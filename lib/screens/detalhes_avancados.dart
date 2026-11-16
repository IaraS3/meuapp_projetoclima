import 'package:flutter/material.dart';
import '../models/cidade.dart';
import '../widgets/titulo_secao.dart';
import '../widgets/item_previsao.dart';
import 'previsao_semana.dart';

class DetalhesAvancadosScreen extends StatelessWidget {
  final Cidade cidade;

  const DetalhesAvancadosScreen({super.key, required this.cidade});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes avançados')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const TituloSecao(titulo: 'Condição do tempo'),
          const SizedBox(height: 8),
          Stack(
            children: [
              Image.network(
                cidade.imagem,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stack) => const SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Icon(Icons.cloud, size: 80),
                ),
              ),
              Positioned(
                left: 12,
                bottom: 12,
                child: Text(
                  '${cidade.nome}\n${cidade.temperatura} • ${cidade.condicao}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const Divider(),

          const TituloSecao(titulo: 'Alertas'),
          Card(
            child: ListTile(
              leading: const Icon(Icons.warning, color: Colors.orange),
              title: Text(cidade.alertaTitulo),
              subtitle: Text(cidade.alertaTexto),
            ),
          ),
          const Divider(),

          const TituloSecao(titulo: 'Previsão da semana'),
          Card(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PrevisaoSemanaScreen(cidade: cidade),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    for (final d in cidade.previsao)
                      ItemPrevisao(
                        dia: d.dia,
                        icone: d.icone,
                        minima: d.minima,
                        maxima: d.maxima,
                      ),
                  ],
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 4),
            child: Text('Toque para ver a previsão completa'),
          ),
          const Divider(),

          const TituloSecao(titulo: 'Indicadores'),
          const SizedBox(height: 8),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _Indicador(
                  icone: Icons.wb_sunny, valor: cidade.uv, nome: 'Índice UV'),
              _Indicador(
                  icone: Icons.speed, valor: cidade.pressao, nome: 'Pressão'),
              _Indicador(
                  icone: Icons.visibility,
                  valor: cidade.visibilidade,
                  nome: 'Visibilidade'),
              _Indicador(
                  icone: Icons.wb_twilight,
                  valor: cidade.nascerDoSol,
                  nome: 'Nascer do sol'),
            ],
          ),
        ],
      ),
    );
  }
}

class _Indicador extends StatelessWidget {
  final IconData icone;
  final String valor;
  final String nome;

  const _Indicador({
    required this.icone,
    required this.valor,
    required this.nome,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icone, size: 32),
          const SizedBox(height: 4),
          Text(valor,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text(nome),
        ],
      ),
    );
  }
}