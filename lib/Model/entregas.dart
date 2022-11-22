import 'package:radix_entrega_project/Model/cliente.dart';
import 'package:radix_entrega_project/Model/pedido.dart';
import 'package:radix_entrega_project/Model/pedidos.dart';

class Entregas {
  Cliente cliente;
  Pedidos pedido;

  Entregas({
    required this.cliente,
    required this.pedido,
  });
}
