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
      appBar: AppBar(title: Text('Previsão da semana • ${cidade.nome}')),
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
                    child: Center(child: Text('Manhã: ${cidade.manha}')),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Container(
                    color: Colors.orange.shade200,
                    child: Center(child: Text('Tarde: ${cidade.tarde}')),
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
            itemCount: cidade.previsao.length,
            itemBuilder: (context, index) {
              final d = cidade.previsao[index];
              return LinhaPrevisao(
                dia: d.dia,
                icone: iconeClima(d.icone),
                minima: d.minima,
                maxima: d.maxima,
              );
            },
          ),
        ],
      ),
    );
  }
}