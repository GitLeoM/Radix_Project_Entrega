import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:radix_entrega_project/Data/dummy_data.dart';
import 'package:radix_entrega_project/Model/carro.dart';

class DeliveryMan {
  final int id;
  final String nome;
  final String email;
  final String senha;
  final String urlImage;
  final String cpf;
  final String rg;
  final String idade;
  bool statusOnOff;
  int statusConta;
  bool isUser;

  DeliveryMan(
      {required this.id,
      required this.nome,
      this.rg = '',
      this.idade = '',
      this.statusOnOff = false,
      this.urlImage = '',
      required this.email,
      required this.senha,
      this.cpf = '',
      this.statusConta = 1,
      this.isUser = false});

  void set setIsUser(bool state) {
    isUser = state;
  }
}
