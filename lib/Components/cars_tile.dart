import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:radix_entrega_project/Data/dummy_data.dart';

class CarsTile extends StatelessWidget {
  final constraints;
  final String titleCar;
  final String subTitlePlaca, subTitleQntdCorridas;
  final trailingIcon;

  CarsTile({
    required this.constraints,
    required this.titleCar,
    required this.subTitlePlaca,
    required this.subTitleQntdCorridas,
    required this.trailingIcon,
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
            titleCar,
            style: TextStyle(
              fontSize: constraints.maxHeight * .035,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Container(
            padding: EdgeInsets.only(top: constraints.maxHeight * .015),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Placa: $subTitlePlaca ',
                  style: TextStyle(
                    fontSize: constraints.maxHeight * .025,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Corridas realizadas: $subTitleQntdCorridas',
                  style: TextStyle(
                    fontSize: constraints.maxHeight * .025,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          trailing: Padding(
            padding: EdgeInsets.fromLTRB(
                0, constraints.maxWidth * .02, constraints.maxWidth * .08, 0),
            child: IconButton(
              onPressed: () {},
              iconSize: 32,
              icon: Icon(
                trailingIcon,
                color: const Color.fromRGBO(235, 99, 99, 1),
              ),
            ),
          ),
          isThreeLine: true,
        ),
      ),
    );
  }
}
