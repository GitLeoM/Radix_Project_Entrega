import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:radix_entrega_project/Components/text_plus_image.dart';
import 'package:radix_entrega_project/Data/dummy_data.dart';
import 'package:radix_entrega_project/Utils/app_routes.dart';

import '../Components/historic_tile.dart';
import '../Model/pedido.dart';
import '../Providers/pedido_provider.dart';

class HistoricScreen extends StatefulWidget {
  const HistoricScreen({Key? key}) : super(key: key);

  @override
  State<HistoricScreen> createState() => _HistoricScreenState();
}

class _HistoricScreenState extends State<HistoricScreen> {
  bool _isLoading = true;
  int randomDist = 0;
  int minuto = 0;

  void initState() {
    super.initState();
    Provider.of<PedidoProvider>(context, listen: false)
        .loadPedidos()
        .then((value) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Pedido> _pedidos = Provider.of<PedidoProvider>(context).getPedidos();

    return Scaffold(
      backgroundColor: Colors.white,
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _pedidos.isEmpty
              ? LayoutBuilder(
                  builder: (context, constraints) {
                    return Column(
                      children: [
                        SizedBox(height: constraints.maxHeight * .15),
                        TextPlusImage(
                          firstText: 'Nenhum pedido realizado',
                          imgUrl: 'assets/svg/undraw_feeling_blue.svg',
                          height: constraints.maxWidth * .5,
                          secondText:
                              'As compras feitas no app irão aparecer aqui quando finalizadas',
                          constraints: constraints,
                        ),
                      ],
                    );
                  },
                )
              : LayoutBuilder(
                  builder: (context, constraints) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: constraints.maxHeight * .135,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(132, 202, 157, 1),
                              boxShadow: [BoxShadow(blurRadius: 4)],
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: constraints.maxHeight * .05),
                              child: Text(
                                'Histórico',
                                style: TextStyle(
                                    fontSize: constraints.maxHeight * .04,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          SizedBox(height: constraints.maxHeight * .03),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: constraints.maxHeight * .04),
                              Container(
                                height: constraints.maxHeight * .9,
                                child: ListView.builder(
                                  itemCount: _pedidos.length,
                                  itemBuilder: (context, index) {
                                    Pedido p = _pedidos[index];
                                    randomDist = Random().nextInt(101);
                                    minuto = Random().nextInt(59) + 1;
                                    return HistoricTile(
                                        index: index,
                                        constraints: constraints,
                                        titleNumPed: p.idPedido.toString(),
                                        subTitleValor:
                                            'R\$${p.frete.toString()}',
                                        subTitleDistan: randomDist.toString(),
                                        subTitleTempGast: '$minuto min',
                                        trailingIcon:
                                            Icons.arrow_forward_ios_rounded,
                                        temporaryString: '');
                                  },
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
    );
  }
}
