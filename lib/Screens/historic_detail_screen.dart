// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radix_entrega_project/Widget/location_input.dart';

import '../Data/dummy_data.dart';
import '../Model/pedido.dart';
import '../Providers/pedido_provider.dart';

class HistoricDetailScreen extends StatelessWidget {
  int index = 1;

  set setIndex(int newInt) {
    index = newInt;
  }

  int get newIndex {
    return index;
  }

  Widget _rowInfos(
      BoxConstraints constraints, String titleBig, String infoRequisitada) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: constraints.maxWidth * .05),
        Text(
          titleBig,
          style: const TextStyle(
            color: Color.fromRGBO(158, 158, 158, 1),
            fontSize: 20,
            fontWeight: FontWeight.w100,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 4),
          child: Text(
            infoRequisitada,
            // 'Av. Comendador Salazar Farias Lima, 564',
            maxLines: 1,
            overflow: TextOverflow.clip,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Pedido> _pedidos = Provider.of<PedidoProvider>(context).getPedidos();

    int i = newIndex;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return LayoutBuilder(
          builder: ((context, constraints) {
            return Scaffold(
                appBar: AppBar(
                  backgroundColor: const Color.fromRGBO(132, 202, 157, 1),
                ),
                body: Container(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          color: Colors.white,
                          height: constraints.maxHeight * .874,
                          width: constraints.maxWidth * .91,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _rowInfos(constraints, 'Valor da entrega:',
                                    _pedidos[2].frete.toString()),
                                _rowInfos(constraints, 'Tempo total gasto:',
                                    DUMMY_pedidos.elementAt(2).tempEntrega),
                                _rowInfos(constraints, 'Número do pedido:',
                                    _pedidos[2].idPedido.toString()),
                                _rowInfos(constraints, 'Nome do cliente:',
                                    DUMMY_cliente.elementAt(2).nome),
                                Container(
                                    width: double.infinity,
                                    child:
                                        LocationInput() /*Center(
                                      child: Text('Mapa não carregado!!'),
                                    )*/
                                    ),
                              ]),
                        ),
                      ]),
                ));
          }),
        );
      },
    );
  }
}
