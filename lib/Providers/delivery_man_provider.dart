import 'package:flutter/cupertino.dart';
import 'package:radix_entrega_project/Data/dummy_data.dart';
import 'package:radix_entrega_project/Model/delivery_man.dart';
import '../Data/dummy_data.dart';
//

class DeliveryManProvider with ChangeNotifier {
  List<DeliveryMan> _deliMan = DUMMY_Delivery;

  List<DeliveryMan> get getDeliMan => [..._deliMan];
  DeliveryMan get user =>
      _deliMan.singleWhere((element) => element.isUser == true);

  List<dynamic> loginValidate(String email, String senha) {
    List<dynamic> list = [];
    DeliveryMan? deliMan;

    if (_deliMan.any((d) => d.email == email && d.senha == senha)) {
      _deliMan.forEach((element) {
        if (element.email == email && element.senha == senha) {
          deliMan = element;
        }
      });
      deliMan?.isUser == true;
      list.add(true);
      list.add(deliMan);
    } else {
      list.add(false);
    }

    return list;
  }

  void addDeliMan(DeliveryMan deliMan) {
    _deliMan.add(deliMan);
    notifyListeners();
  }

  void deleteDeliMan(String id) {
    _deliMan.removeWhere((d) => d.id.toString() == id);
    notifyListeners();
  }
}
