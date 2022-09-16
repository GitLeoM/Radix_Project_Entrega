import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:radix_entrega_project/Data/dummy_data.dart';

import '../Components/historic_tile.dart';

class HistoricScreen extends StatefulWidget {
  const HistoricScreen({Key? key}) : super(key: key);

  @override
  State<HistoricScreen> createState() => _HistoricScreenState();
}

class _HistoricScreenState extends State<HistoricScreen> {
  @override
  Widget build(BuildContext context) {
    var i = 0;
    final pedido1 = DUMMY_pedidos[0];
    final pedido2 = DUMMY_pedidos[1];
    final pedido3 = DUMMY_pedidos[2];

    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
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
                    padding: EdgeInsets.only(top: constraints.maxHeight * .05),
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
                HistoricTile(
                  index: 1,
                  constraints: constraints,
                  titleNumPed: pedido2.numPed,
                  subTitleValor: pedido2.valor,
                  subTitleDistan: pedido2.distancia,
                  subTitleTempGast: pedido2.tempEntrega,
                  trailingIcon: Icons.arrow_forward_ios_rounded,
                  temporaryString: '',
                ),
                HistoricTile(
                  index: 0,
                  constraints: constraints,
                  titleNumPed: pedido1.numPed,
                  subTitleValor: pedido1.valor,
                  subTitleDistan: pedido1.distancia,
                  subTitleTempGast: pedido1.tempEntrega,
                  trailingIcon: Icons.arrow_forward_ios_rounded,
                  temporaryString: '',
                ),
                HistoricTile(
                  index: 2,
                  constraints: constraints,
                  titleNumPed: pedido3.numPed,
                  subTitleValor: pedido3.valor,
                  subTitleDistan: pedido3.distancia,
                  subTitleTempGast: pedido3.tempEntrega,
                  trailingIcon: Icons.arrow_forward_ios_rounded,
                  temporaryString: '',
                ),
                SizedBox(height: constraints.maxHeight * .1),
              ],
            ),
          );
        },
      ),
    );
  }
}
