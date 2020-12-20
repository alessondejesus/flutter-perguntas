import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  int pontuacaoTotal;
  final Function() reiniciar;

  Resultado(this.pontuacaoTotal, this.reiniciar);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: (
            Text('Parabéns', style: TextStyle(fontSize: 32))),
          ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: (
              Center(
                child: (
                    Text('Pontuacao: $pontuacaoTotal')
                ),
              )
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: ElevatedButton(
            onPressed: this.reiniciar,
            child: (
              Text('Reiniciar')
            )
          ),
        )
      ],
    );
  }
}
