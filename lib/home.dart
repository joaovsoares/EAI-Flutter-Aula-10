//flutter:
//  assets:
//    - assets/imagens/padrao.png
//    - assets/imagens/pedra.png
//    - assets/imagens/papel.png
//    - assets/imagens/tesoura.png
import 'package:flutter/material.dart';
import 'jokenpoenum.dart';
import 'jokenpo.dart';
import 'i18n.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _imagemPedra = 'assets/imagens/pedra.png';
  final _imagemPapel = 'assets/imagens/papel.png';
  final _imagemTesoura = 'assets/imagens/tesoura.png';
  var _opcaoApp = AssetImage('assets/imagens/padrao.png');
  var _mensagem = "";

  void jogarCom(JoKenPoEnum escolha) {
    var resultado = JoKenPo.jogar(escolha);
    var opcaoApp = resultado['opcaoApp'];

    switch (opcaoApp) {
      case JoKenPoEnum.pedra:
        setState(() {
          _opcaoApp = AssetImage(_imagemPedra);
        });
        break;
      case JoKenPoEnum.papel:
        setState(() {
          _opcaoApp = AssetImage(_imagemPapel);
        });
        break;
      case JoKenPoEnum.tesoura:
        setState(() {
          _opcaoApp = AssetImage(_imagemTesoura);
        });
        break;
    }

    setState(() {
      this._mensagem = resultado['mensagem'];
    });
  }

  AppBar appBar(String titulo) {
    return AppBar(
        title: Text(widget.title.i18n),
      );
  }

  Widget jokenpo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 16, bottom: 16),
          child: Text(
            'Escolha do App'.i18n,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )
        ),
        Image(image: this._opcaoApp),
        Expanded(
          child: Center (
            child: Text(
              this._mensagem,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          )
        ),
        Text(
          'Escolha do Jogador'.i18n,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: EdgeInsets.only(top: 16, bottom: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => jogarCom(JoKenPoEnum.pedra),
                child: Image.asset(_imagemPedra)
              ),
              GestureDetector(
                onTap: () => jogarCom(JoKenPoEnum.papel),
                child: Image.asset(_imagemPapel)
              ),
              GestureDetector(
                onTap: () => jogarCom(JoKenPoEnum.tesoura),
                child: Image.asset(_imagemTesoura)
              ),
            ],
          )
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(widget.title),
      body: jokenpo()
    );
  }
}