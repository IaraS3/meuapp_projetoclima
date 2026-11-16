class DiaPrevisao {
  final String dia;
  final String icone; // 'sol', 'nuvem' ou 'chuva'
  final String minima;
  final String maxima;

  const DiaPrevisao({
    required this.dia,
    required this.icone,
    required this.minima,
    required this.maxima,
  });
}

class Cidade {
  final String nome;
  final String icone; // 'sol', 'nuvem' ou 'chuva'
  final String temperatura;
  final String minima;
  final String maxima;
  final String umidade;
  final String vento;
  final String chuva;
  final String imagem;
  final String condicao;
  final String alertaTitulo;
  final String alertaTexto;
  final String uv;
  final String pressao;
  final String visibilidade;
  final String nascerDoSol;
  final List<DiaPrevisao> previsao;

  const Cidade({
    required this.nome,
    required this.icone,
    required this.temperatura,
    required this.minima,
    required this.maxima,
    required this.umidade,
    required this.vento,
    required this.chuva,
    required this.imagem,
    required this.condicao,
    required this.alertaTitulo,
    required this.alertaTexto,
    required this.uv,
    required this.pressao,
    required this.visibilidade,
    required this.nascerDoSol,
    required this.previsao,
  });
}