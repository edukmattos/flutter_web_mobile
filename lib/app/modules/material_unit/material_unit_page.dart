import 'package:flutter/material.dart';

class MaterialUnitPage extends StatefulWidget {
  final String title;
  const MaterialUnitPage({Key key, this.title = "MaterialUnit"})
      : super(key: key);

  @override
  _MaterialUnitPageState createState() => _MaterialUnitPageState();
}

class _MaterialUnitPageState extends State<MaterialUnitPage> {
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
