import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_web_mobile/app/modules/client/client_controller.dart';

class ClientPage extends StatefulWidget {
  final String title;
  const ClientPage({Key key, this.title = "Cliente"}) : super(key: key);

  @override
  _ClientPageState createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {

  final clientController = ClientController();
  
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
                  errorText: clientController.validateName,
                  onChanged: clientController.changeName
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
                  errorText: clientController.validateEmail,
                  onChanged: clientController.changeEmail
                );
              },
            ),
            SizedBox(
              height: 50,
            ),
            Observer(
              builder: (_) {
                return RaisedButton(
                  onPressed: clientController.formIsValid 
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
