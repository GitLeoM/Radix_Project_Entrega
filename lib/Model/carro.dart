class Carro {
  final int idVeiculo;
  final String placa;
  final String ano;
  final String nome;
  final String modelo;
  final int idEntregador;

  Carro({
    required this.idEntregador,
    required this.ano,
    required this.idVeiculo,
    required this.modelo,
    required this.nome,
    required this.placa,
  });
}
