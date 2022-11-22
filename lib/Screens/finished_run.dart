import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:radix_entrega_project/Components/button_white.dart';
import 'package:radix_entrega_project/Data/dummy_data.dart';
import 'package:radix_entrega_project/Utils/app_routes.dart';

import '../Model/pedido.dart';
import '../Providers/pedido_provider.dart';

class FinishedRun extends StatelessWidget {
  int index;
  FinishedRun({this.index = 0});

  Widget _columnInfos(BoxConstraints constraints, String titleBig, int index,
      String infoRequisitada) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(width: constraints.maxWidth * .05),
            Text(
              titleBig,
              style: const TextStyle(
                color: Color.fromRGBO(158, 158, 158, 1),
                fontSize: 18,
                fontWeight: FontWeight.w100,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: constraints.maxWidth * .05),
            Image.asset(
              'assets/images/marcador.png',
              height: constraints.maxHeight * .04,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                infoRequisitada,
                // 'Av. Comendador Salazar Farias Lima, 564',
                maxLines: 1,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Pedido> _pedidos = Provider.of<PedidoProvider>(context).getPedidos();
    return Scaffold(
      body: LayoutBuilder(
        builder: ((context, constraints) {
          return Container(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              child: Container(
                height: constraints.maxHeight * .92,
                width: double.infinity,
                color: const Color.fromRGBO(132, 202, 157, 1),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        'Pedido Entregue!!!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          color: Colors.white,
                          height: constraints.maxHeight * .60,
                          width: constraints.maxWidth * .75,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _columnInfos(constraints, 'Valor da entrega:',
                                    index, _pedidos[index].frete.toString()),
                                _columnInfos(
                                    constraints,
                                    'Tempo total gasto:',
                                    index,
                                    DUMMY_pedidos.elementAt(index).tempEntrega),
                                _columnInfos(constraints, 'Número do pedido:',
                                    index, _pedidos[index].idPedido.toString()),
                                _columnInfos(constraints, 'Nome do cliente:',
                                    index, DUMMY_cliente.elementAt(index).nome),
                                Container(
                                  width: double.infinity,
                                  child: Column(
                                    children: [
                                      const Icon(
                                        Icons.location_on_sharp,
                                        color: Color.fromRGBO(132, 202, 157, 1),
                                      ),
                                      SizedBox(
                                        height: constraints.maxHeight * .02,
                                      ),
                                      Text(
                                        DUMMY_pedidos.elementAt(index)
                                            .localInic,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 18),
                                      ),
                                      const Icon(
                                        Icons.arrow_downward_rounded,
                                        color: Color.fromRGBO(132, 202, 157, 1),
                                        size: 40,
                                      ),
                                      Text(
                                        DUMMY_pedidos.elementAt(index).localFim,
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
                      ButtonWhite(
                          text: 'Voltar para o início',
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacementNamed(AppRoutes.HOMETAB);
                          },
                          height: constraints.maxHeight * .1,
                          width: constraints.maxWidth * .75,
                          color: false)
                    ]),
              ),
            ),
          );
        }),
      ),
    );
  }
}
