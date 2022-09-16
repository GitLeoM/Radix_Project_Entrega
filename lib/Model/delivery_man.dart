import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:radix_entrega_project/Data/dummy_data.dart';
import 'package:radix_entrega_project/Model/carro.dart';

class DeliveryMan {
  final int id;
  final String nome;
  final String email;
  final String senha;
  final Carro? carro;
  final String cpf;
  bool statusOnOff;
  bool statusConta;
  bool isUser;

  DeliveryMan(
      {required this.id,
      required this.nome,
      this.statusOnOff = false,
      required this.email,
      required this.senha,
      this.carro = null,
      required this.cpf,
      this.statusConta = true,
      this.isUser = false});

  void set setIsUser(bool state) {
    isUser = state;
  }
}
