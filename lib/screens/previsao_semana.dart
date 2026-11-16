import 'package:flutter/material.dart';
import '../models/cidade.dart';
import '../widgets/titulo_secao.dart';
import '../widgets/linha_previsao.dart';
import '../widgets/item_previsao.dart';

class PrevisaoSemanaScreen extends StatelessWidget {
  final Cidade cidade;

  const PrevisaoSemanaScreen({super.key, required this.cidade});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Previsão da semana')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const TituloSecao(titulo: 'Faixa de temperatura'),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 60,
                  color: Colors.lightBlue.shade200,
                  child: Center(child: Text('Mínima: ${cidade.minima}')),
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  height: 60,
                  color: Colors.amber.shade300,
                  child: Center(child: Text('Atual: ${cidade.temperatura}')),
                ),
              ),
              Expanded(
                child: Container(
                  height: 60,
                  color: Colors.deepOrange.shade300,
                  child: Center(child: Text('Máxima: ${cidade.maxima}')),
                ),
              ),
            ],
          ),
          const Divider(),

          const TituloSecao(titulo: 'Resumo do dia'),
          const SizedBox(height: 8),
          Container(
            height: 200,
            color: Colors.grey.shade300,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.yellow.shade200,
                    child: const Center(child: Text('Manhã: 20°C')),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Container(
                    color: Colors.orange.shade200,
                    child: const Center(child: Text('Tarde: 29°C')),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),

          const TituloSecao(titulo: 'Próximos dias'),
          for (final d in cidade.previsao)
            LinhaPrevisao(
              dia: d.dia,
              icone: iconeClima(d.icone),
              minima: d.minima,
              maxima: d.maxima,
            ),
        ],
      ),
    );
  }
}