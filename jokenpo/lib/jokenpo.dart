import 'package:flutter/material.dart';
import 'dart:math';

class jokenpo extends StatefulWidget {
  @override
  _jokenpoState createState() => _jokenpoState();
}

class _jokenpoState extends State<jokenpo> {
  var _imagemApp = AssetImage("images/padrao.png");
  String _resultado = "Escolha uma opção abaixo:";

  void _opcaoSelecionada(String escolhaUsuario) {
    List<String> opcoes = ["pedra", "papel", "tesoura"];
    int posicao = Random().nextInt(opcoes.length);
    String escolhaApp = opcoes[posicao];

    //Logica do Jogo
    String msg;
    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel")) {
      msg = "Parabéns !!! Você ganhou :)";
    } else if ((escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
        (escolhaApp == "papel" && escolhaUsuario == "pedra") ||
        (escolhaApp == "tesoura" && escolhaUsuario == "papel")) {
      msg = "Você perdeu :(";
    } else {
      msg = "Empatamos ;)";
    }

    setState(() {
      this._imagemApp = AssetImage("images/$escolhaApp.png");
      this._resultado = msg;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("JokenPo"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                "Escolha do App:",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Image(
              image: this._imagemApp,
            ),
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                this._resultado,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () => this._opcaoSelecionada("pedra"),
                  child: Image.asset(
                    "images/pedra.png",
                    height: 100,
                  ),
                ),
                GestureDetector(
                  onTap: () => this._opcaoSelecionada("papel"),
                  child: Image.asset(
                    "images/papel.png",
                    height: 100,
                  ),
                ),
                GestureDetector(
                  onTap: () => this._opcaoSelecionada("tesoura"),
                  child: Image.asset(
                    "images/tesoura.png",
                    height: 100,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
