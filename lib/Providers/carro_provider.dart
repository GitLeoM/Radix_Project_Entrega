import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:radix_entrega_project/Model/carro.dart';

class VeiculoProvider with ChangeNotifier {
  List<Carro> _veiculos = [];
  List<Carro> getVeiculo() => [..._veiculos];

  // Future<void> loadAllCarros() async {
  //   var response = await Dio().get('http://127.0.0.1:8000/api/getVeiculo');

  //   response.data['veiculo'].forEach((e) {
  //     Carro veiculo = Carro(
  //       idVeiculo: e['idVeiculo'],
  //       nome: e['nome'],
  //       placa: e['placa'],
  //       ano: e['ano'],
  //       modelo: e['modelo'],
  //       idEntregador: e['idEntregador'],
  //     );

  //     if (_veiculos.any((element) => element.idVeiculo == veiculo.idVeiculo)) {
  //       print('_');
  //     } else {
  //       _veiculos.add(veiculo);
  //     }
  //   });
  //   notifyListeners();
  // }

  Future<List<Carro>> loadCarrosVendedor(int idEntregador) async {
    List<Carro> _x = [];
    var response = await Dio()
        .get('http://127.0.0.1:8000/api/getAllVeiculos/$idEntregador');

    if (response.data['status'] == '200') {
      response.data['veiculos'].forEach(
        (v) {
          Carro veiculo = Carro(
              idVeiculo: v['idVeiculo'],
              ano: v['ano'],
              idEntregador: v['idEntregador'],
              modelo: v['modelo'],
              nome: v['nome'],
              placa: v['placa']);

          if (_x.any((element) => element.idVeiculo == veiculo.idVeiculo)) {
            print('_');
          } else {
            _x.add(veiculo);
            _veiculos = _x;
          }
        },
      );
    } else {
      print(response.data['message'].toString());
    }
    return _x;
  }

  deleteVeiculo(int veiculo) async {
    var response = await Dio()
        .delete('http://127.0.0.1:8000/api/deleteVeiculo/${veiculo + 4}');

    if (response.data['status'] == '200') {
      print(response.data['mensagem'].toString());
    } else {
      print(response.data['mensagem'].toString());
      print(veiculo);
    }
  }
}
