import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';
import './resultado.dart';

class Questionario extends StatefulWidget {
  @override
  _QuestionarioState createState() => _QuestionarioState();
}

class _QuestionarioState extends State<Questionario> {
  var perguntaSelecionada = 0;
  int pontuacaoTotal = 0;

  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 1},
        {'texto': 'Branco', 'pontuacao': 2},
        {'texto': 'Roxo', 'pontuacao': 3}
      ]
    },
    {
      'texto': 'Animal favorito?',
      'respostas': [
        {'texto': 'Dog', 'pontuacao': 4},
        {'texto': 'Gato', 'pontuacao': 5},
        {'texto': 'Lontra', 'pontuacao': 6}
      ]
    },
    {
      'texto': 'Idade?',
      'respostas': [
        {'texto': '18', 'pontuacao': 7},
        {'texto': '19', 'pontuacao': 8},
        {'texto': '20', 'pontuacao': 9}
      ]
    },
  ];

  void reiniciar(){
    setState(() {
      pontuacaoTotal = 0;
      perguntaSelecionada = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < _perguntas.length;
  }

  responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        perguntaSelecionada++;
        pontuacaoTotal+=pontuacao;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? _perguntas[perguntaSelecionada]['respostas']
        : null;

    return temPerguntaSelecionada
        ? Column(
            children: [
              Questao(_perguntas[perguntaSelecionada]['texto']),
              ...respostas.map((resp) => Resposta(resp['texto'],  () => responder(resp['pontuacao']))).toList()
            ],
          )
        : new Resultado(pontuacaoTotal, reiniciar);
  }
}
