import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flux_validator_dart/flux_validator_dart.dart';

import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final loginController = Modular.get<LoginController>();

  final _formKey = GlobalKey<FormState>();

  Widget _submitButton() {
    return RaisedButton(
      child: new Text("ENTRAR", style: new TextStyle(color: Colors.white)),
      color: Colors.orange,
      elevation: 15.0,
      shape: StadiumBorder(),
      onPressed: () {
        if (_formKey.currentState.validate()) {
          // If the form is valid, display a Snackbar.
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text('Processing Data')));
          _formKey.currentState.save();
        }
      },
    );
  }

  Widget _createAccountLabel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Don\'t have an account ?',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              //Navigator.push(context,
              //    MaterialPageRoute(builder: (context) => SignUpPage()));
            },
            child: Text(
              'Register',
              style: TextStyle(
                  color: Color(0xfff79c4f),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: <Widget>[
          Container(
            padding: EdgeInsets.all(18),
            height: MediaQuery.of(context).size.height,
            child: Form(
              key: _formKey,
              autovalidate: true,
              // readonly: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/logo.jpeg',
                    width: 250,
                    height: 250,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Observer(
                    name: 'email',
                    builder: (_){
                      return TextFormField(
                        onChanged: loginController.changeEmail,
                        obscureText: false,
                        maxLines: 1,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Colors.orange,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'E-mail',
                          suffix: Tooltip(
                            message: 'Erro',
                            //child: Icon(Icons.error, color: Colors.red, size: 20),
                          ),
                          prefixIcon:
                              Icon(Icons.email, color: Colors.orange, size: 20),
                          helperText: 'Informe o seu e-mail.',
                        ),
                        validator: (value) {
                          if (Validator.required(value)) return 'Obrigatorio.';
                          if (Validator.email(value)) return 'Invalido.';
                          return null;
                        }
                      );
                  }),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    //attribute: "password",
                    obscureText: true,
                    maxLines: 1,
                    decoration: InputDecoration(
                      labelText: "Senha",
                      prefixIcon:
                          Icon(Icons.lock, color: Colors.orange, size: 20),
                      hintText: 'Senha',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none),
                    ),
                    //validators: [
                    //  FormBuilderValidators.numeric(),
                    //  FormBuilderValidators.max(70),
                    //],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _submitButton(),
                ],
              ),
            ),
          )
        ]));
  }
}
