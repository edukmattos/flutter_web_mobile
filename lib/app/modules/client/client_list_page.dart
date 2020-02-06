import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
  Firestore db = Firestore.instance;

  Future getClients() async {    
    QuerySnapshot qn = await db.collection("clents").getDocuments();

    return qn.documents;
  }

  @override
  Widget build(BuildContext context) {
    return Container(                                                                                                                                                                                                                                                                                                                                           
      child: FutureBuilder(
        future: getClients(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none: 
              return Text('Sem Dados');
              break;
            case ConnectionState.active: 
              break;
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator()
              );
              break;
            case ConnectionState.done: 
              return Text(snapshot.data['name'].toString());
              break;
            default:
              return Text('Finalizado');
          }
        }
      ),
    );
  }
}
