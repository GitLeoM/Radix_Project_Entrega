import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:radix_entrega_project/Data/dummy_data.dart';
import 'package:radix_entrega_project/Model/carro.dart';
import 'package:radix_entrega_project/Model/delivery_man.dart';

class DeliveryManProvider with ChangeNotifier {
  List<DeliveryMan> _deliMan = [];
  List<DeliveryMan> getEntregadores() => [..._deliMan];

  Future<void> loadEntregadores() async {
    _deliMan.clear();
    var response =
        await Dio().get('http://127.0.0.1:8000/api/getAllEntregador');

    response.data['entregador'].forEach(
      (e) {
        DeliveryMan entregador = DeliveryMan(
          id: e['idEntregador'],
          nome: e['nome'],
          cpf: e['cpf'],
          email: e['email'],
          senha: e['senha'],
          urlImage: e['foto'],
          idade: e['idade'],
          statusConta: e['statusConta'],
          rg: e['rg'],
        );
        if (entregador.statusConta == 1) {
          if (_deliMan.any((element) => element.id == entregador.id)) {
            print('_');
          } else {
            _deliMan.add(entregador);
          }
        }
      },
    );
    notifyListeners();
  }

  Future<void> getEntregador(int id) async {
    var response = await Dio(
      BaseOptions(
        connectTimeout: 20000,
      ),
    ).get(
      'http://127.0.0.1:8000/api/getEntregador/$id',
    );

    response.data['entregador'].forEach(
      (e) {
        DeliveryMan entregador = DeliveryMan(
          id: e['idEntregador'],
          nome: e['nome'],
          cpf: e['cpf'],
          email: e['email'],
          senha: e['senha'],
          urlImage: e['foto'],
          idade: e['idade'],
          statusConta: e['statusConta'],
          rg: e['rg'],
        );
        if (entregador.statusConta == 1) {
          _deliMan.add(entregador);
        } else {}
      },
    );
    notifyListeners();
  }

  DeliveryMan user = DeliveryMan(
      id: 0,
      nome: 'nome',
      cpf: 'cpf',
      email: 'email',
      senha: 'senha',
      idade: '0',
      rg: 'email',
      urlImage: '',
      statusConta: 1);

  List<DeliveryMan> get getDeliveryMan => [..._deliMan];

  DeliveryMan get getUser => user;

  void changeUser(DeliveryMan newUser) {
    user = newUser;
    notifyListeners();
  }

  void userLogoff() {
    user = DeliveryMan(
        id: 0,
        nome: 'nome',
        cpf: 'cpf',
        email: 'email',
        senha: 'senha',
        idade: '0',
        rg: 'email',
        urlImage: '',
        statusConta: 1);
    notifyListeners();
  }

  List<dynamic> loginValidate(String email, String senha) {
    List<dynamic> list = [];
    DeliveryMan? deliveryMan;

    if (_deliMan.any((c) => c.email == email && c.senha == senha)) {
      _deliMan.forEach((element) {
        if (element.email == email && element.senha == senha) {
          deliveryMan = element;
        }
      });
      deliveryMan?.isUser == true;
      list.add(true);
      list.add(deliveryMan);
    } else {
      list.add(false);
    }

    return list;
  }

  void addEntregador(DeliveryMan deliveryMan) {
    _deliMan.add(deliveryMan);
    notifyListeners();
  }

  void deleteEntregador(String id) {
    _deliMan.removeWhere((c) => c.id.toString() == id);
    notifyListeners();
  }
}
