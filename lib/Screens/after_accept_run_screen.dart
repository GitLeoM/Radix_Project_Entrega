import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:radix_entrega_project/Components/button_run_screen.dart';
import 'package:radix_entrega_project/Data/dummy_data.dart';
import 'package:radix_entrega_project/Screens/finished_run.dart';
import 'package:radix_entrega_project/Utils/app_routes.dart';

import '../Model/pedido.dart';
import '../Providers/pedido_provider.dart';

class AcceptRunScreen extends StatefulWidget {
  int index;

  AcceptRunScreen({this.index = 0});

  @override
  State<AcceptRunScreen> createState() => _AcceptRunScreenState();
}

class _AcceptRunScreenState extends State<AcceptRunScreen> {
  Widget _columnInfos(BoxConstraints constraints, String titleBig, int index,
      String infoRequisitada) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(width: constraints.maxWidth * .1),
            Text(
              titleBig,
              style: const TextStyle(
                color: Color.fromRGBO(132, 202, 157, 1),
                fontSize: 20,
                fontWeight: FontWeight.w100,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: constraints.maxWidth * .1),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Image.asset(
                'assets/images/marcador.png',
                height: constraints.maxHeight * .05,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                infoRequisitada,
                // 'Av. Comendador Salazar Farias Lima, 564',
                maxLines: 1,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Row _rowButton(String titleBig1, String titleBig2, void Function() onTap1,
      void Function() onTap2, bool colorTF1, bool colorTF2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ButtonRunScreen(
          text: titleBig1,
          onTap: onTap1,
          color: colorTF1,
        ),
        ButtonRunScreen(
          text: titleBig2,
          onTap: onTap2,
          color: colorTF2,
        )
      ],
    );
  }

  void updatePedido(constraints) async {
    try {
      var response = await Dio().put(
        'http://127.0.0.1:8000/api/updatePedido/${widget.index}',
        data: {
          'statusPedido': '3',
        },
      );
      if (response.data['status'] == '400') {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text(response.data['message'],
                style: TextStyle(fontSize: constraints.maxWidth * .04)),
          ),
        );
      } else {
        print(response.data['message']);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Pedido> _pedidos = Provider.of<PedidoProvider>(context).getPedidos();
    return Scaffold(
      backgroundColor: const Color.fromRGBO(238, 238, 238, 1),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.only(left: 8, bottom: 15, right: 14),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: constraints.maxHeight * .90,
                  width: constraints.maxWidth,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 30),
                            height: constraints.maxHeight * .13,
                            child: SvgPicture.asset(
                                'assets/svg/undraw_on_the_way_re_swjt.svg'),
                          ),
                          SizedBox(height: constraints.maxHeight * .07),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  _columnInfos(
                                      constraints,
                                      'Colete a entrega:',
                                      widget.index,
                                      DUMMY_pedidos.elementAt(widget.index)
                                          .localInic),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, top: 48),
                                    child: Text(
                                      '${DUMMY_pedidos.elementAt(widget.index).distancia} de distância',
                                      overflow: TextOverflow.fade,
                                      style: const TextStyle(
                                        color: Color.fromRGBO(153, 153, 153, 1),
                                        fontSize: 8,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: constraints.maxHeight * .07),
                          _columnInfos(
                              constraints,
                              'Número do Pedido:',
                              widget.index,
                              _pedidos[widget.index].idPedido.toString()),
                          SizedBox(height: constraints.maxHeight * .07),
                          _columnInfos(
                              constraints,
                              'Entregue o Pedido:',
                              widget.index,
                              DUMMY_pedidos.elementAt(widget.index).localFim),
                          SizedBox(height: constraints.maxHeight * .06),
                          _rowButton(
                            'Concluir Entrega',
                            'Abrir mapa para entrega',
                            () {
                              // updatePedido(constraints);
                              FinishedRun(
                                index: widget.index,
                              );
                              Navigator.of(context)
                                  .pushReplacementNamed(AppRoutes.FINISHEDRUN);
                            },
                            () {},
                            true,
                            true,
                          ),
                          SizedBox(height: constraints.maxHeight * .03),
                          _rowButton(
                            'Cancelar Entrega',
                            'Relatar um problema',
                            () {
                              Navigator.of(context)
                                  .pushReplacementNamed(AppRoutes.HOMETAB);
                            },
                            () {
                              Navigator.of(context)
                                  .pushReplacementNamed(AppRoutes.REPORTSCREEN);
                            },
                            false,
                            false,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
