import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'client_controller.dart';

class ClientListPage extends StatefulWidget {
  final String title;
  const ClientListPage({Key key, this.title = "Clientes - Listagem"}) : super(key: key);

  @override
  _ClientListPageState createState() => _ClientListPageState();
}

class _ClientListPageState extends State<ClientListPage> {

  final clientController = Modular.get<ClientController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(
        builder: (BuildContext context) {
          return ListView.builder(
            itemCount: clientController.clients.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.album),
                      title: Text(clientController.clients[index].name),
                      subtitle: Text(clientController.clients[index].name),
                    ),
                  ],
                ),
              );
            },
          );
        },
      )
    );
  }
}
