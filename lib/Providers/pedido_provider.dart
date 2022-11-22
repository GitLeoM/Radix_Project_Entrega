import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../Model/pedido.dart';

class PedidoProvider with ChangeNotifier {
  List<Pedido> _pedidos = [];
  List<Pedido> getPedidos() => [..._pedidos];

  Future<List<Pedido>> loadPedidos() async {
    _pedidos.clear();
    var response = await Dio().get('http://127.0.0.1:8000/api/getPedidos');

    if (response.data['status'] == '200') {
      response.data['pedidos'].forEach(
        (p) {
          Pedido pedido = Pedido(
            idPedido: p['idPedido'],
            data: '30/10/2022',
            frete: double.parse(p['frete']),
            statusPedido: p['statusPedido'],
            idCliente: p['idCliente'],
            idVendedor: p['idVendedor'],
            Cupom: p['cupom'],
          );

          if (_pedidos.any((element) =>
              element.idPedido == pedido.idPedido &&
              element.statusPedido != 2)) {
            print('_');
          } else {
            _pedidos.add(pedido);
            print(_pedidos);
          }
        },
      );
    } else {
      print(response.data['message'].toString());
    }
    notifyListeners();
    return _pedidos;
  }
}
