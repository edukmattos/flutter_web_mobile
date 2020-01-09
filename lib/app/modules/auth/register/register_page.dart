import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'register_controller.dart';

class RegisterPage extends StatefulWidget {
  final String title;
  const RegisterPage({Key key, this.title = "Registro"}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final registerController = RegisterController();
  
  _textField({String labelText, onChanged, String Function() errorText}) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
        errorText: errorText == null ? null : errorText(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Observer(
              builder: (_){
                return _textField(
                  labelText: "Nome",
                  errorText: registerController.validateName,
                  onChanged: registerController.changeName
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            Observer(
              builder: (_){
                return _textField(
                  labelText: "E-mail",
                  errorText: registerController.validateEmail,
                  onChanged: registerController.changeEmail
                );
              },
            ),
            SizedBox(
              height: 50,
            ),
            Observer(
              builder: (_) {
                return RaisedButton(
                  onPressed: registerController.formIsValid 
                  ? () { 
                      
                    } 
                  : null,
                  child: Text("Salvar"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
