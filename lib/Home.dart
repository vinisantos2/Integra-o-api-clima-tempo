import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:prova_flutter/componetes/Interface.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _urlbase = "https://api.hgbrasil.com/weather";
  String _cidade = "";
  String _data = "";
  String _temperatura = "";
  String _descricao = "";
  String _hora = "";
  bool _buscando = false;
  TextEditingController _textEditCidade = TextEditingController();

  _buscarClimaCidade() async {
    setState(() {
      _buscando = true;
    });
    String cidade = "";
    if (_textEditCidade.text.isEmpty)
      cidade = "ribeira do pombal";
    else
      cidade = _textEditCidade.text;

    http.Response response =
        await http.get(_urlbase + "?key=74a6fb4a&city_name=${cidade}");
    Map dadosJson = json.decode(response.body);

    setState(() {
      _buscando = false;
      _cidade = dadosJson['results']['city'];
      _data = dadosJson['results']['date'].toString();
      _hora = dadosJson['results']['time'];
      _temperatura = dadosJson['results']['temp'].toString();
      _descricao = dadosJson['results']['description'];
      _textEditCidade.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Interface.appBar("Tempo em sua cidade"),
      body: Container(
        child: SingleChildScrollView(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

              Padding(
                padding: EdgeInsets.all(1),
                child: Image.asset(
                  "imagens/clima.jpg",
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child:
                Interface.textField("Informe uma cidade", _textEditCidade),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Interface.botao("Buscar", _buscarClimaCidade),
              ),
              Center(
                child: _buscando? CircularProgressIndicator(): Center(),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Interface.text("Cidade: " + _cidade),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Interface.text("Data: " + _data),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Interface.text("Hora: " + _hora),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Interface.text("Temperatura: " + _temperatura),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Interface.text("Descrição: " + _descricao),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
