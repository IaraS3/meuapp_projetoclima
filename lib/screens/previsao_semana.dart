import 'package:flutter/material.dart';
import '../widgets/titulo_secao.dart';
import '../widgets/linha_previsao.dart';

class PrevisaoSemanaScreen extends StatelessWidget {
  const PrevisaoSemanaScreen({super.key});

  static const List<Map<String, String>> dias = [
    {'dia': 'Sexta', 'icone': 'sol', 'min': '18°C', 'max': '30°C'},
    {'dia': 'Sábado', 'icone': 'nuvem', 'min': '17°C', 'max': '27°C'},
    {'dia': 'Domingo', 'icone': 'chuva', 'min': '16°C', 'max': '24°C'},
    {'dia': 'Segunda', 'icone': 'sol', 'min': '18°C', 'max': '29°C'},
    {'dia': 'Terça', 'icone': 'nuvem', 'min': '19°C', 'max': '28°C'},
  ];

  static IconData _icone(String nome) {
    switch (nome) {
      case 'sol':
        return Icons.wb_sunny;
      case 'chuva':
        return Icons.umbrella;
      default:
        return Icons.cloud;
    }
  }

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
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: dias.length,
            itemBuilder: (context, index) {
              final item = dias[index];
              return LinhaPrevisao(
                dia: item['dia']!,
                icone: _icone(item['icone']!),
                minima: item['min']!,
                maxima: item['max']!,
              );
            },
          ),
        ],
      ),
    );
  }
}