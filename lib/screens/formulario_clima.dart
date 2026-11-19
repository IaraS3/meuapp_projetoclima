import 'package:flutter/material.dart';
import '../widgets/form_decoration.dart';
import 'home_screen.dart';

class FormularioClima extends StatefulWidget {
  const FormularioClima({super.key});

  @override
  State<FormularioClima> createState() => _FormularioClimaState();
}

class _FormularioClimaState extends State<FormularioClima> {
  bool entrar = true;
  bool ocultarsenha = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade100, // Cor de céu claro no fundo
      appBar: AppBar(
        title: const Text('ClimaApp'),
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
      ),
      body: Form(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Icon(
                    Icons.wb_sunny_rounded, // Ícone de sol/clima
                    size: 80,
                    color: Colors.amber,
                  ),
                  const SizedBox(height: 16),
                  Visibility(
                    visible: !entrar,
                    child: TextFormField(
                      decoration: getInputDecoration('Nome'),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    decoration: getInputDecoration('E-mail'),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    decoration: getInputDecoration('Senha').copyWith(
                      suffixIcon: IconButton(
                        icon: Icon(
                          ocultarsenha
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            ocultarsenha = !ocultarsenha;
                          });
                        },
                      ),
                    ),
                    obscureText: ocultarsenha,
                  ),
                  const SizedBox(height: 8),
                  Visibility(
                    visible: !entrar,
                    child: TextFormField(
                      decoration: getInputDecoration('Confirme a senha'),
                      obscureText: true,
                    ),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    },
                    child: Text(entrar ? 'Entrar' : 'Cadastrar'),
                  ),
                  const Divider(),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        entrar = !entrar;
                      });
                    },
                    child: Text(
                      entrar
                          ? 'Ainda não tem uma conta? Cadastre-se'
                          : 'Já possui uma conta? Entre',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
