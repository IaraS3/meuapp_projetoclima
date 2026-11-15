import 'package:flutter/material.dart';
import 'widgets/titulo_secao.dart';
import 'widgets/item_detalhe.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('WeatherApp')),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const TituloSecao(titulo: 'Cidade atual'),
            const Text(
              'São Bernardo do Campo',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Domingo, 15 de novembro',
              style: TextStyle(fontSize: 16),
            ),
            const Divider(),

            const TituloSecao(titulo: 'Temperatura'),
            const Text(
              '26°C',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ),
            const Text(
              'Sensação térmica: 28°C',
              style: TextStyle(fontSize: 16),
            ),
            const Divider(),

            const TituloSecao(titulo: 'Condição do tempo'),
            Image.network(
              'https://images.unsplash.com/photo-1763568972598-02eeb63efce1?q=80&w=1169&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D',
              height: 200,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stack) =>
                  const SizedBox(height: 200, child: Icon(Icons.cloud, size: 80)),
            ),
            const Divider(),

            const TituloSecao(titulo: 'Detalhes'),
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ItemDetalhe(icone: Icons.water_drop, cor: Colors.blue, valor: '65%'),
                ItemDetalhe(icone: Icons.air, cor: Colors.grey, valor: '12 km/h'),
                ItemDetalhe(icone: Icons.umbrella, cor: Colors.indigo, valor: '30%'),
              ],
            ),
            const Divider(),

            const TituloSecao(titulo: 'Atualização'),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Atualizar'),
            ),
          ],
        ),
      ),
    );
  }
}