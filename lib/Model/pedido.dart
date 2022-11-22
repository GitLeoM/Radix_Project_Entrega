class Pedido {
  final int idPedido;
  final String data;
  final double frete;
  final int statusPedido;
  final int idCliente;
  final int idVendedor;
  final int Cupom;

  Pedido(
      {required this.idPedido,
      this.data = '',
      required this.frete,
      required this.statusPedido,
      required this.idCliente,
      required this.idVendedor,
      required this.Cupom,
      S});
}
