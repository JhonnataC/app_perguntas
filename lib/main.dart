import 'package:flutter/material.dart';
import 'package:projeto_perguntas/botaoCustom.dart';
import 'package:projeto_perguntas/questionarioPage.dart';
import 'package:projeto_perguntas/resultadoPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const PerguntaApp();
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  int _pontuacaoTotal = 0;

  //      List<Map<String, Object>>, 'Object' para o tipo de valor ser mais flexivel, assim podendo ser uma String como é na chave de texto, e uma lista na chave de respostas
  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Branco', 'pontuacao': 5},
        {'texto': 'Azul', 'pontuacao': 3},
        {'texto': 'Vermelho', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Gato', 'pontuacao': 10},
        {'texto': 'Cachorro', 'pontuacao': 5},
        {'texto': 'Papagaio', 'pontuacao': 3},
        {'texto': 'Rato', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': [
        {'texto': 'Maria', 'pontuacao': 10},
        {'texto': 'João', 'pontuacao': 5},
        {'texto': 'Claudia', 'pontuacao': 3},
        {'texto': 'Jhon', 'pontuacao': 1},
      ]
    }
  ];

  void _responder(int pontuacao) {
    if (temPergunta) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPergunta {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Perguntas',
              style: TextStyle(
                fontFamily: 'Ubuntu',
              ),
            ),
          ),
        ),
        body: temPergunta
            ? QuestionarioPage(
                perguntaSelecionada: _perguntaSelecionada,
                perguntas: _perguntas,
                quandoResponder: _responder)
            : ResultadoPage(
                pontucaoFinal: _pontuacaoTotal,
                reiniciarQuestionario: _reiniciarQuestionario),
      ),
    );
  }
}
