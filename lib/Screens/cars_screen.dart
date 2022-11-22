import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:radix_entrega_project/Components/button_white.dart';
import 'package:radix_entrega_project/Model/carro.dart';
import 'package:radix_entrega_project/Providers/carro_provider.dart';
import 'package:radix_entrega_project/Providers/delivery_man_provider.dart';
import 'package:radix_entrega_project/Utils/app_routes.dart';

import '../Components/cars_tile.dart';
import '../Data/dummy_data.dart';

class CarsScreen extends StatefulWidget {
  const CarsScreen({Key? key}) : super(key: key);

  @override
  State<CarsScreen> createState() => _CarsScreenState();
}

class _CarsScreenState extends State<CarsScreen> {
  Map<int, List<Carro>> _veiculosMap = {};

  void _delete(int index) {
    setState(() {
      Provider.of<VeiculoProvider>(context).deleteCarro(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Carro> _veiculos = Provider.of<VeiculoProvider>(context).getVeiculo();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: constraints.maxHeight * .04),
              Container(
                height: constraints.maxHeight * .9,
                child: ListView.builder(
                  itemCount: _veiculos.length,
                  itemBuilder: (context, index) {
                    Carro c = _veiculos[index];
                    int randomRuns = Random().nextInt(101);
                    // minuto = Random().nextInt(59) + 1;
                    return CarsTile(
                      constraints: constraints,
                      func: () {
                        _delete(index);
                      },
                      subTitlePlaca: _veiculos[index].placa,
                      subTitleQntdCorridas: randomRuns.toString(),
                      titleCar: _veiculos[index].nome,
                    );
                  },
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
          ),
        );
      }),
    );
  }
}
