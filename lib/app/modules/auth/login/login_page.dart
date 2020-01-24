import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:substring_highlight/substring_highlight.dart';

import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);
  
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  final loginController = Modular.get<LoginController>();
     
  _textField({
      String labelText, 
      onChanged, 
      String Function() errorText
    }) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      onChanged: onChanged,
      textAlign: TextAlign.left,
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
                  labelText: "E-mail"
                );
              }
            ),
            SizedBox(
              height: 20,
            ),
            Observer(
              builder: (_){
                return _textField(
                  labelText: "E-mail",
                  errorText: loginController.validateEmail,
                  onChanged: loginController.changeEmail
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            Observer(
              builder: (_){
                return _textField(
                  labelText: "Senha",
                  errorText: loginController.validatePassword,
                  onChanged: loginController.changePassword
                );
              },
            ),
            SizedBox(
              height: 50,
            ),
            Observer(
              builder: (_) {
                return RaisedButton(
                  onPressed: loginController.formIsValid 
                  ? () { 
                      
                    } 
                  : null,
                  child: Text("Entrar"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {

  //final logins = [
  //  "Eduardo Camara de Mattos",
  //  "BRUNA PEREIRA DE MATTOS",
  //  "Sandra Pereira de Mattos",
  //  "Solange Pereira",
  //  "Sonia Pereira Bortolini",
  //  "Antonio Francisco Meireles de Mattos",
  //  "Clara Maria Camara de Mattos"
  //];

  final logins = [];

  final recentLogins = [
    "Sandra Pereira de Mattos",
    "Solange Pereira",
    "Sonia Pereira Bortolini"
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    // actions for app bar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Leading Icon on the left on the bar app
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: (){
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Show some results based on the selection
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        child: Card(
          color: Colors.red,
          child: Center(
            child: Text(query),
          ),
        ),
      ),
    );    
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Show whem someone searches for something
    final suggestionList = query.isEmpty 
      ? recentLogins 
      : logins.where((c) => c.contains(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: (){
          showResults(context);
        },
        leading: Icon(Icons.location_city),
        title: SubstringHighlight(
          text: suggestionList[index], 
          term: query,
          textStyle: TextStyle(                       // non-highlight style                       
            color: Colors.grey,
          ),
          textStyleHighlight: TextStyle(              // highlight style
            color: Colors.black,
            decoration: TextDecoration.underline,
          ), 
        )
      ),
      itemCount: suggestionList.length,
    );
  }  
} 