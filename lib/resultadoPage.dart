import 'package:flutter/material.dart';
import 'package:projeto_perguntas/botaoCustom.dart';

class ResultadoPage extends StatelessWidget {
  final int pontucaoFinal;
  final void Function() reiniciarQuestionario;

  const ResultadoPage({
    super.key,
    required this.pontucaoFinal,
    required this.reiniciarQuestionario,
  });

  String get fraseResultado {
    late String frase;
    if (pontucaoFinal < 8) {
      frase = 'Parabéns!';
    } else if (pontucaoFinal < 12) {
      frase = 'Você é bom!';
    } else if (pontucaoFinal < 16) {
      frase = 'Impressionante!';
    } else {
      frase = 'Perfeito!';
    }
    frase += ' Sua pontuação foi $pontucaoFinal.';
    return frase;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: const TextStyle(
              fontSize: 20,
              fontFamily: 'Ubuntu',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        BotaoCustom(
          texto: 'Reiniciar',
          onPressed: reiniciarQuestionario,
        ),
      ],
    );
  }
}
