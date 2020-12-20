import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';

main() => runApp(PerguntaApp());

class PerguntaAppState extends State<PerguntaApp>{

  @override
  Widget build(BuildContext context){

    return new MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Página Inicial'),
            backgroundColor: Color(333),
          ),
          body: new Questionario()
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget{

  PerguntaAppState createState() {
    return new PerguntaAppState();
  }
}
