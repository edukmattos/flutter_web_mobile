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
    return TextFormField(
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
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),
          onPressed: (){
            showSearch(
              context: context,
              delegate: DataSearch()
            );
          },)
        ],
      ),
      drawer: Drawer(),
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

class DataSearch extends SearchDelegate<String> {

  final clients = [
    "Eduardo Camara de Mattos",
    "Bruna Pereira de Mattos",
    "Sandra Pereira de Mattos",
    "Solange Pereira",
    "Sonia Pereira Bortolini",
    "Antonio Francisco Meireles de Mattos",
    "Clara Maria Camara de Mattos"
  ];

  final recentClients = [
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
      ? recentClients 
      : clients.where((p) => p.toLowerCase().contains(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: (){
          showResults(context);
        },
        leading: Icon(Icons.location_city),
        title: RichText(
          text: TextSpan(
            text: suggestionList[index].substring(0, query.length),
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold),
            children: [TextSpan(
              text: suggestionList[index].substring(query.length),
              style: TextStyle(
                color: Colors.grey
              )
            )]
          )
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
  
} 
