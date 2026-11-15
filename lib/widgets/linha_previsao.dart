import 'package:flutter/material.dart';

class LinhaPrevisao extends StatelessWidget {
  final String dia;
  final IconData icone;
  final String minima;
  final String maxima;

  const LinhaPrevisao({
    super.key,
    required this.dia,
    required this.icone,
    required this.minima,
    required this.maxima,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(flex: 2, child: Text(dia)),
          Icon(icone, size: 28),
          Expanded(child: Text(minima, textAlign: TextAlign.center)),
          Expanded(child: Text(maxima, textAlign: TextAlign.center)),
        ],
      ),
    );
  }
}