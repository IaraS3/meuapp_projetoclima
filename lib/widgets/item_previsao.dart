import 'package:flutter/material.dart';

IconData iconeClima(String nome) {
  switch (nome) {
    case 'sol':
      return Icons.wb_sunny;
    case 'chuva':
      return Icons.umbrella;
    default:
      return Icons.cloud;
  }
}

List<Color> coresClima(String nome) {
  switch (nome) {
    case 'sol':
      return [Colors.orange.shade400, Colors.amber.shade300];
    case 'chuva':
      return [Colors.blue.shade700, Colors.lightBlue.shade400];
    default:
      return [Colors.blueGrey.shade500, Colors.blueGrey.shade300];
  }
}

class IconeClima extends StatelessWidget {
  final String tipo;
  final double tamanho;

  const IconeClima({super.key, required this.tipo, required this.tamanho});

  @override
  Widget build(BuildContext context) {
    if (tipo == 'chuva') {
      return SizedBox(
        width: tamanho * 1.2,
        height: tamanho,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Icon(Icons.cloud, size: tamanho, color: Colors.white),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Icon(
                Icons.umbrella,
                size: tamanho * 0.65,
                color: Colors.amber.shade300,
              ),
            ),
          ],
        ),
      );
    }
    if (tipo == 'sol') {
      return Icon(Icons.wb_sunny, size: tamanho, color: Colors.yellow.shade200);
    }
    return Icon(Icons.cloud, size: tamanho, color: Colors.white);
  }
}

class ItemPrevisao extends StatelessWidget {
  final String dia;
  final String icone;
  final String minima;
  final String maxima;

  const ItemPrevisao({
    super.key,
    required this.dia,
    required this.icone,
    required this.minima,
    required this.maxima,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(dia, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(minima),
          Icon(iconeClima(icone), size: 28),
          Text(maxima),
        ],
      ),
    );
  }
}