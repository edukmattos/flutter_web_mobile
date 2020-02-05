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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Observer(
          builder: (BuildContext context) {
            return ListView.builder(
              itemCount: clientController.clients.length,
              itemBuilder: (BuildContext context, int index) {
                final client = clientController.clients[index];
                return Card(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.album),
                        title: Text(client.name == null ? '' : client.name),
                        subtitle: Text(client.email == null ? '' : client.email),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      )
    );
  }
}
