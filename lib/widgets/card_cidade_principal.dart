import 'package:flutter/material.dart';
import '../models/cidade.dart';
import 'item_previsao.dart';

class CardCidadePrincipal extends StatelessWidget {
  final Cidade cidade;
  final VoidCallback onTap;

  const CardCidadePrincipal({
    super.key,
    required this.cidade,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          colors: coresClima(cidade.icone),
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      cidade.nome,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '${cidade.minima} / ${cidade.maxima}',
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    IconeClima(tipo: cidade.icone, tamanho: 80),
                    const SizedBox(width: 24),
                    Text(
                      cidade.temperatura,
                      style: const TextStyle(
                        fontSize: 56,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _Info(Icons.water_drop, cidade.umidade),
                      _Info(Icons.air, cidade.vento),
                      _Info(Icons.umbrella, cidade.chuva),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Info extends StatelessWidget {
  final IconData icone;
  final String valor;

  const _Info(this.icone, this.valor);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icone, size: 18, color: Colors.white),
        const SizedBox(width: 4),
        Text(valor, style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}