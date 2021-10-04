import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Interface {
  static botao(String _titulo, Function _f) {
    return Container(

      child: RaisedButton(

        color: Colors.blue,
        textColor: Colors.white,

        padding: EdgeInsets.all(0),
        child: Text(
          _titulo,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: _f,
      ),
    );
  }

/*
  static toast(String mensagem) {
    return Fluttertoast.showToast(
        msg: mensagem,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.black,
        fontSize: 16.0);
  }

 */

  static slider(double valor, String label, Function _f) {
    return Slider(
        value: valor,
        label: label,
        max: 10,
        min: 0,
        divisions: 10,
        onChanged: _f);
  }

  static checkBox(bool valor, String titulo, Function _f) {
    return CheckboxListTile(value: valor, title: text(titulo), onChanged: _f);
  }

  static switche(bool valor, Function _f) {
    return Switch(value: valor, onChanged: _f);
  }

  static radios(String titulo, String valor, String grupo, Function _f) {
    return RadioListTile(
      title: text(titulo),
      value: valor,
      groupValue: grupo,
      onChanged: _f,
    );
  }

  static text(String _texto) {
    return Text(
      _texto,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static appBar(String _titulo) {
    return AppBar(
      title: Text(_titulo),
      backgroundColor: Colors.blue,
    );
  }

  static textField(String label, TextEditingController textEditingController) {
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(labelText: label),
      controller: textEditingController,
      style: TextStyle(fontSize: 22),
    );
  }

  static floatActionButon(Function _f) {
    return FloatingActionButton(
        backgroundColor: Colors.green, child: Icon(Icons.add), onPressed: _f);
  }
}
