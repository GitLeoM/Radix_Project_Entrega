import 'package:flutter/material.dart';
import 'package:radix_entrega_project/Screens/historic_detail_screen.dart';
import 'package:radix_entrega_project/Utils/app_routes.dart';

class HistoricTile extends StatelessWidget {
  int index;
  final constraints;
  final String titleNumPed;
  final String subTitleValor, subTitleDistan, subTitleTempGast;
  final trailingIcon;
  final temporaryString; //Mudar essa String para adaptar a diversas linhas posteriormente

  HistoricTile({
    required this.index,
    required this.constraints,
    required this.titleNumPed,
    required this.subTitleValor,
    required this.subTitleDistan,
    required this.subTitleTempGast,
    required this.trailingIcon,
    required this.temporaryString,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(constraints.maxHeight * .02),
      child: SizedBox(
        height: constraints.maxHeight * .20,
        child: ListTile(
          contentPadding: EdgeInsets.fromLTRB(
            constraints.maxWidth * .05,
            constraints.maxHeight * .03,
            0,
            0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          tileColor: const Color.fromRGBO(237, 233, 232, .7),
          title: Text(
            'Pedido: $titleNumPed',
            style: TextStyle(
              fontSize: constraints.maxHeight * .03,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Padding(
            padding: EdgeInsets.only(top: constraints.maxHeight * .009),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Valor total: $subTitleValor ',
                  style: TextStyle(
                    fontSize: constraints.maxHeight * .022,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Distância percorrida: $subTitleDistan',
                  style: TextStyle(
                    fontSize: constraints.maxHeight * .022,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Tempo gasto: $subTitleTempGast',
                  style: TextStyle(
                    fontSize: constraints.maxHeight * .022,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          trailing: Padding(
            padding: EdgeInsets.fromLTRB(
                0, constraints.maxWidth * .016, constraints.maxWidth * .04, 0),
            child: IconButton(
              onPressed: () {
                final int i = index;

                Navigator.of(context).pushNamed(AppRoutes.HISTORICDETAIL);
              },
              icon: Icon(trailingIcon,
                  color: const Color.fromRGBO(132, 202, 157, 1)),
            ),
          ),
          isThreeLine: true,
        ),
      ),
    );
  }
}
