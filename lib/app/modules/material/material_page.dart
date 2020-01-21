import 'package:flutter/material.dart';

class MaterialPage extends StatefulWidget {
  final String title;
  const MaterialPage({Key key, this.title = "Material"}) : super(key: key);

  @override
  _MaterialPageState createState() => _MaterialPageState();
}

class _MaterialPageState extends State<MaterialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
