import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radix_entrega_project/Components/button.dart';
import 'package:radix_entrega_project/Model/carro.dart';
import 'package:radix_entrega_project/Model/cliente.dart';
import 'package:radix_entrega_project/Model/delivery_man.dart';
import 'package:radix_entrega_project/Model/entregas.dart';
import 'package:radix_entrega_project/Model/online_or_off.dart';
import 'package:radix_entrega_project/Model/pedidos.dart';
import 'package:radix_entrega_project/Providers/pedido_provider.dart';

import '../Model/pedido.dart';

// List<DeliveryMan> DUMMY_Delivery = [
//   DeliveryMan(
//     id: 00,
//     nome: 'Teste',
//     statusOnOff: true,
//     idade: 18,
//     rg: '12.345.678-0',
//     carro: [
//       Carro(
//         nomeVeiculo: 'Camaro',
//         anoModelo: '2019/2020',
//         corridasRealizadas: '15',
//         placa: 'EBG8K90',
//       ),
//     ],
//     email: '@',
//     senha: 's',
//     cpf: '123',
//   ),
//   DeliveryMan(
//     id: 01,
//     nome: 'Leonardo',
//     statusOnOff: false,
//     idade: 20,
//     rg: '12.345.678-1',
//     carro: [
//       Carro(
//         nomeVeiculo: 'Lamborghini',
//         anoModelo: '2021/2022',
//         corridasRealizadas: '89',
//         placa: 'FCB1L27',
//       ),
//     ],
//     email: 'dummymail1@gmail.com',
//     senha: 'Sen123-1',
//     cpf: '123.456.789-01',
//   ),
//   DeliveryMan(
//     id: 02,
//     nome: 'Lucas',
//     statusOnOff: true,
//     idade: 22,
//     rg: '12.345.678-2',
//     carro: [
//       Carro(
//         nomeVeiculo: 'Ferrari',
//         anoModelo: '2018/2019',
//         corridasRealizadas: '51',
//         placa: 'IJH6T78',
//       ),
//     ],
//     email: 'dummymail2@gmail.com',
//     senha: 'Sen123-2',
//     cpf: '123.456.789-02',
//   ),
//   DeliveryMan(
//     id: 03,
//     nome: 'Henrique',
//     statusOnOff: false,
//     idade: 24,
//     rg: '12.345.678-3',
//     carro: [
//       Carro(
//         nomeVeiculo: 'Corsa',
//         anoModelo: '2008/2009',
//         corridasRealizadas: '13',
//         placa: 'MNJ8U65',
//       ),
//     ],
//     email: 'dummymail3@gmail.com',
//     senha: 'Sen123-3',
//     cpf: '123.456.789-03',
//   ),
//   DeliveryMan(
//     id: 04,
//     nome: 'Maria',
//     statusOnOff: true,
//     idade: 26,
//     rg: '12.345.678-4',
//     carro: [
//       Carro(
//         nomeVeiculo: 'Camaro',
//         anoModelo: '2019/2020',
//         corridasRealizadas: '15',
//         placa: 'EBG8K90',
//       ),
//     ],
//     email: 'dummymail4@gmail.com',
//     senha: 'Sen123-4',
//     cpf: '123.456.789-04',
//   ),
//   DeliveryMan(
//     id: 05,
//     nome: 'Giovanna',
//     statusOnOff: true,
//     idade: 28,
//     rg: '12.345.678-5',
//     carro: [
//       Carro(
//         nomeVeiculo: 'Camaro',
//         anoModelo: '2019/2020',
//         corridasRealizadas: '15',
//         placa: 'EBG8K90',
//       ),
//     ],
//     email: 'dummymail5@gmail.com',
//     senha: 'Sen123-5',
//     cpf: '123.456.789-05',
//   ),
// ];

List<OnlineOrOff> DUMMY_OnOFF = [
  OnlineOrOff(onOff: false),
];

List<Pedido> _pedido = PedidoProvider().getPedidos();

List<Pedidos> DUMMY_pedidos = [
  Pedidos(
    numPed: '001',
    valor: 'R\$27.32',
    distancia: '3KM',
    localInic: 'Rua Um, 53',
    localFim: 'Rua Dois, 90',
    tempEntrega: '15min',
  ),
  Pedidos(
    numPed: '002',
    valor: 'R\$53.80',
    distancia: '5KM',
    localInic: 'Rua Tres, 765',
    localFim: 'Rua Quatro, 89',
    tempEntrega: '18min',
  ),
  Pedidos(
    numPed: '003',
    valor: 'R\$35.00',
    distancia: '7KM',
    localInic: 'Rua Cinco, 980',
    localFim: 'Rua Seis, 7612',
    tempEntrega: '20min',
  ),
];

List<Cliente> DUMMY_cliente = [
  Cliente(nome: 'Roberto'),
  Cliente(nome: 'Henrique'),
  Cliente(nome: 'Gabriel'),
  Cliente(nome: 'Lorena'),
];

List<Entregas> DUMMY_entregas = [
  Entregas(
    cliente: DUMMY_cliente.elementAt(0),
    pedido: DUMMY_pedidos.elementAt(0),
  )
];

TextStyle onlineOff(BuildContext context, bool status) {
  if (status == true) {
    return const TextStyle(
      color: Color.fromRGBO(132, 202, 157, 1),
      fontWeight: FontWeight.w700,
    );
  } else {
    return const TextStyle(
      color: Colors.red,
      fontWeight: FontWeight.w700,
    );
  }
}

String onOff(bool status) {
  if (status == false) {
    return 'Offline';
  } else {
    return 'Online';
  }
}
