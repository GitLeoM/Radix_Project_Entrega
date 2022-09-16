import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:radix_entrega_project/Components/button.dart';
import 'package:radix_entrega_project/Components/button_white.dart';
import 'package:radix_entrega_project/Utils/app_routes.dart';

import '../Components/cars_tile.dart';
import '../Data/dummy_data.dart';

class CarsScreen extends StatefulWidget {
  const CarsScreen({Key? key}) : super(key: key);

  @override
  State<CarsScreen> createState() => _CarsScreenState();
}

class _CarsScreenState extends State<CarsScreen> {
  var i = 0;
  final carro1 = DUMMY_Delivery[0].carro;
  final carro2 = DUMMY_Delivery[1].carro;
  final carro3 = DUMMY_Delivery[2].carro;
  final carro4 = DUMMY_Delivery[3].carro;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: LayoutBuilder(builder: (context, constraints) {
          return Column(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: constraints.maxHeight * .03),
                    CarsTile(
                      subTitlePlaca: carro1!.placa,
                      subTitleQntdCorridas: carro1!.corridasRealizadas,
                      titleCar: carro1!.nomeVeiculo,
                      constraints: constraints,
                      trailingIcon: Icons.clear_rounded,
                    ),
                    CarsTile(
                      subTitlePlaca: carro2!.placa,
                      subTitleQntdCorridas: carro2!.corridasRealizadas,
                      titleCar: carro2!.nomeVeiculo,
                      constraints: constraints,
                      trailingIcon: Icons.clear_rounded,
                    ),
                    CarsTile(
                      subTitlePlaca: carro3!.placa,
                      subTitleQntdCorridas: carro3!.corridasRealizadas,
                      titleCar: carro3!.nomeVeiculo,
                      constraints: constraints,
                      trailingIcon: Icons.clear_rounded,
                    ),
                    SizedBox(height: constraints.maxHeight * .1),
                  ],
                ),
              ),
              ButtonWhite(
                text: 'Adicionar novo veículo',
                onTap: () {
                  Navigator.of(context).pushNamed(AppRoutes.ADDCAR);
                },
                height: constraints.maxHeight * .08,
                width: constraints.maxWidth * .75,
                color: true,
              )
            ],
          );
        }),
      ),
    );
  }
}
