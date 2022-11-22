import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:radix_entrega_project/Data/dummy_data.dart';
import 'package:radix_entrega_project/Screens/after_accept_run_screen.dart';
import 'package:radix_entrega_project/Utils/app_routes.dart';

import '../Model/pedido.dart';
import '../Model/pedidos.dart';
import '../Providers/pedido_provider.dart';

class TransactionForm extends StatelessWidget {
  final bool pedidoSolicitado;
  int randomNum = 0;

  TransactionForm({this.pedidoSolicitado = false});

  Row _row({
    double top = 20,
    double left = 0,
    bool fontWTrueFalse = true,
    FontWeight fontWeight = FontWeight.w700,
    double fontS = 15,
    String valuePedido = '',
    bool colorTrueFalse = false,
    Color color = Colors.black,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: top, left: left),
          child: Text(
            'R\$$valuePedido',
            overflow: TextOverflow.fade,
            style: TextStyle(
              color: colorTrueFalse ? color : null,
              fontWeight: fontWTrueFalse ? fontWeight : null,
              fontSize: fontS,
            ),
          ),
        ),
      ],
    );
  }

  Padding _paddingAdress(String pedido) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Text(
        pedido,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
    );
  }

  sortearPed() {
    randomNum = Random().nextInt(5);
  }

  @override
  Widget build(BuildContext context) {
    int i = 0;
    final pedido = DUMMY_pedidos[randomNum];
    List<Pedido> _pedidos = Provider.of<PedidoProvider>(context).getPedidos();
    return LayoutBuilder(
      builder: ((context, constraints) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: SizedBox(
            height: constraints.maxHeight,
            child: Card(
              elevation: 10,
              borderOnForeground: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/svg/undraw_delivery_truck_vt6p.svg',
                    height: constraints.maxHeight * .15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 10),
                        child: const Text(
                          'NOVA ENTREGA!!',
                          style: TextStyle(
                              color: Color.fromRGBO(108, 168, 129, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  _row(
                      top: 20,
                      valuePedido: _pedidos[randomNum].frete.toString(),
                      fontWTrueFalse: true,
                      fontS: 30),
                  _row(
                    top: 20,
                    color: const Color.fromRGBO(153, 153, 153, 1),
                    colorTrueFalse: true,
                    fontS: 10,
                    fontWTrueFalse: true,
                    fontWeight: FontWeight.w400,
                    valuePedido: '${pedido.distancia} de distância',
                  ),
                  _row(
                    top: 5,
                    color: const Color.fromRGBO(153, 153, 153, 1),
                    colorTrueFalse: true,
                    fontS: 10,
                    fontWTrueFalse: true,
                    fontWeight: FontWeight.w400,
                    valuePedido:
                        'Tempo estimado: ${pedido.tempEntrega} para entrega',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          alignment: AlignmentDirectional.center,
                          width: constraints.maxWidth * .3,
                          child: _paddingAdress(pedido.localInic)),
                      Container(
                        padding: const EdgeInsets.only(top: 40),
                        width: constraints.maxWidth * .3,
                        child: const Icon(
                          Icons.arrow_right_alt_outlined,
                          color: Color.fromRGBO(108, 168, 129, 1),
                          size: 100,
                        ),
                      ),
                      Container(
                        alignment: AlignmentDirectional.center,
                        width: constraints.maxWidth * .3,
                        child: _paddingAdress(pedido.localFim),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          AcceptRunScreen(
                            index: randomNum,
                          );
                          Navigator.of(context).pushNamed(AppRoutes.ACCEPTRUN);
                        },
                        icon: const Icon(
                          Icons.check_circle_outline_outlined,
                          color: Color.fromRGBO(108, 168, 129, 1),
                          size: 40,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.cancel_outlined,
                          color: Color.fromRGBO(239, 102, 143, 1),
                          size: 40,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
