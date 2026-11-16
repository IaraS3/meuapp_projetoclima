import 'package:flutter/material.dart';
import '../data/cidades_data.dart';
import '../widgets/card_cidade.dart';
import '../widgets/card_cidade_principal.dart';
import 'detalhes_avancados.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _abrir(BuildContext context, int indice) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetalhesAvancadosScreen(cidade: cidades[indice]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ClimaApp')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          CardCidadePrincipal(
            cidade: cidades[0],
            onTap: () => _abrir(context, 0),
          ),
          const SizedBox(height: 16),
          const Center(child: Text('Toque na cidade para ver mais')),
          const SizedBox(height: 8),
          for (int i = 1; i < cidades.length; i++)
            CardCidade(
              cidade: cidades[i],
              onTap: () => _abrir(context, i),
            ),
        ],
      ),
    );
  }
}