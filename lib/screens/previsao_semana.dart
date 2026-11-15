import 'package:flutter/material.dart';
import '../widgets/titulo_secao.dart';
import '../widgets/linha_previsao.dart';

class PrevisaoSemanaScreen extends StatelessWidget {
  const PrevisaoSemanaScreen({super.key});

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
                  child: const Center(child: Text('Mínima: 18°C')),
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  height: 60,
                  color: Colors.amber.shade300,
                  child: const Center(child: Text('Atual: 26°C')),
                ),
              ),
              Expanded(
                child: Container(
                  height: 60,
                  color: Colors.deepOrange.shade300,
                  child: const Center(child: Text('Máxima: 31°C')),
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
          const LinhaPrevisao(
            dia: 'Sexta',
            icone: Icons.wb_sunny,
            minima: '18°C',
            maxima: '30°C',
          ),
          const LinhaPrevisao(
            dia: 'Sábado',
            icone: Icons.cloud,
            minima: '17°C',
            maxima: '27°C',
          ),
          const LinhaPrevisao(
            dia: 'Domingo',
            icone: Icons.umbrella,
            minima: '16°C',
            maxima: '24°C',
          ),
          const LinhaPrevisao(
            dia: 'Segunda',
            icone: Icons.wb_sunny,
            minima: '18°C',
            maxima: '29°C',
          ),
          const LinhaPrevisao(
            dia: 'Terça',
            icone: Icons.cloud,
            minima: '19°C',
            maxima: '28°C',
          ),
        ],
      ),
    );
  }
}