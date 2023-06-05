import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questaoCustom.dart';

import 'botaoCustom.dart';

class QuestionarioPage extends StatelessWidget {
  final int perguntaSelecionada;
  final List<Map<String, Object>> perguntas;
  final void Function(int) quandoResponder;

  const QuestionarioPage({
    super.key,
    required this.perguntaSelecionada,
    required this.perguntas,
    required this.quandoResponder,
  });

  bool get temPergunta {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
//  Forma mais imperativa

//    var respostas = [];
//    for (String textoRes
//        in perguntas[_perguntaSelecionada].cast()['respostas']) {
//      respostas.add(BotaoCustom(texto: textoRes, onPressed: _responder));
//    }

    List<Map<String, Object>> respostas = temPergunta
        ? perguntas[perguntaSelecionada].cast()['respostas']
            as List<Map<String, Object>>
        : [];

    return Column(
      children: [
        const SizedBox(
          height: 100,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: QuestaoCustom(
            texto: perguntas[perguntaSelecionada]['texto'].toString(),
          ),
        ),
// O operador ... (spread) adiciona todos o elementos da lista 'respostas' na lista Column
// Forma mais declarativa - mais compativel com programação funcional, com o uso do map()
        ...respostas
            .map((resp) => BotaoCustom(
                texto: resp['texto'] as String,
                onPressed: () =>
                    quandoResponder(int.parse(resp['pontuacao'].toString()))))
            .toList()
      ],
    );
  }
}
