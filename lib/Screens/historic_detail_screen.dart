import 'package:flutter/material.dart';

import '../Data/dummy_data.dart';

class HistoricDetailScreen extends StatelessWidget {
  final int index;

  HistoricDetailScreen({this.index = 0});

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
    int i = index;
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
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            color: Colors.white,
                            height: constraints.maxHeight * .9,
                            width: constraints.maxWidth * .9,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  _rowInfos(constraints, 'Valor da entrega:',
                                      DUMMY_pedidos.elementAt(i).valor),
                                  _rowInfos(constraints, 'Tempo total gasto:',
                                      DUMMY_pedidos.elementAt(i).tempEntrega),
                                  _rowInfos(constraints, 'Número do pedido:',
                                      DUMMY_pedidos.elementAt(i).numPed),
                                  _rowInfos(constraints, 'Nome do cliente:',
                                      DUMMY_cliente.elementAt(i).nome),
                                  Container(
                                    width: double.infinity,
                                    color: Color.fromARGB(255, 205, 237, 216),
                                    child: Column(
                                      children: [
                                        const Icon(
                                          Icons.location_on_sharp,
                                          color:
                                              Color.fromRGBO(132, 202, 157, 1),
                                        ),
                                        SizedBox(
                                          height: constraints.maxHeight * .02,
                                        ),
                                        Text(
                                          DUMMY_pedidos.elementAt(i).localInic,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 18),
                                        ),
                                        const Icon(
                                          Icons.arrow_downward_rounded,
                                          color:
                                              Color.fromRGBO(132, 202, 157, 1),
                                          size: 40,
                                        ),
                                        Text(
                                          DUMMY_pedidos.elementAt(i).localFim,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                      ]),
                ));
          }),
        );
      },
    );
  }
}
