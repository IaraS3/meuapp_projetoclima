import 'package:flutter/material.dart';
import '../widgets/titulo_secao.dart';

class DetalhesAvancadosScreen extends StatelessWidget {
  const DetalhesAvancadosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes avançados')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const TituloSecao(titulo: 'Alertas'),
          const Card(
            child: ListTile(
              leading: Icon(Icons.warning, color: Colors.orange),
              title: Text('Chuva forte'),
              subtitle: Text('Previsto para hoje, a partir das 18h'),
              trailing: Icon(Icons.chevron_right),
            ),
          ),
          const Card(
            child: ListTile(
              leading: Icon(Icons.bolt, color: Colors.red),
              title: Text('Trovoadas isoladas'),
              subtitle: Text('Previsto para a noite de hoje'),
              trailing: Icon(Icons.chevron_right),
            ),
          ),
          const Divider(),

          const TituloSecao(titulo: 'Indicadores'),
          const SizedBox(height: 8),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              _Indicador(icone: Icons.wb_sunny, valor: '6', nome: 'Índice UV'),
              _Indicador(icone: Icons.speed, valor: '1013 hPa', nome: 'Pressão'),
              _Indicador(icone: Icons.visibility, valor: '10 km', nome: 'Visibilidade'),
              _Indicador(icone: Icons.wb_twilight, valor: '05:20', nome: 'Nascer do sol'),
            ],
          ),
          const Divider(),

          const TituloSecao(titulo: 'Condição do tempo'),
          const SizedBox(height: 8),
          Stack(
            children: [
              Image.network(
                'https://images.unsplash.com/photo-1763568972598-02eeb63efce1?q=80&w=1169&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stack) => const SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Icon(Icons.cloud, size: 80),
                ),
              ),
              const Positioned(
                left: 12,
                bottom: 12,
                child: Text(
                  '26°C',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const Positioned(
                right: 12,
                top: 12,
                child: Icon(Icons.wb_sunny, color: Colors.white, size: 32),
              ),
            ],
          ),
          const Divider(),

          const TituloSecao(titulo: 'Tags'),
          const SizedBox(height: 8),
          const Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              Chip(avatar: Icon(Icons.water_drop, size: 18), label: Text('Chuva forte')),
              Chip(avatar: Icon(Icons.wb_sunny, size: 18), label: Text('UV alto')),
              Chip(label: Text('Vento moderado')),
              Chip(label: Text('Umidade alta')),
              Chip(label: Text('Frente fria')),
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
          Text(valor, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text(nome),
        ],
      ),
    );
  }
}