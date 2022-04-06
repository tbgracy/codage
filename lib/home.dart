import 'package:flutter/material.dart';
import 'package:codage/codage_cesar.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _updateEncodedMessage([String value = 'message', bool encode = true]) {
    setState(() {
      if (encode) {
        message = value;
        encodedMessage = codage_cesar.encode(value, key);
      }
    });
  }

  void _updateKey(String value) {
    setState(() {
      key = int.tryParse(value);
      encodedMessage = codage_cesar.encode(message, key);
    });
  }

  String _validateKey(String value) {
    int key = int.tryParse(value);
    return key == null ? 'La clé doit être un nombre entier' : null;
  }

  String message = '';
  String encodedMessage = '';
  int key = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Codage de César")),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.keyboard_arrow_down),
            itemBuilder: (BuildContext context){
              return [
                PopupMenuItem(child: Text("Codage de César")),
                PopupMenuItem(child: Text("Codage de Vigenère")),
                PopupMenuItem(child: Text("Carré de Polybe")),
                PopupMenuItem(child: Text("Masque jetable")),
                PopupMenuItem(child: Text("Codage affine")),
              ];
            },
            tooltip: "Choisir une méthode de codage",
            onSelected: (valueSelected) {
              Navigator.pushNamed(context, "/$valueSelected");
            },
          ),
        ],
      ),
      body: Center(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Key",
                  ),
                  onChanged: (value) => _updateKey(value),
                  validator: (value) => _validateKey(value),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Message",
                  ),
                  onChanged: (value) => _updateEncodedMessage(value, true),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Message codé (clé = $key): $encodedMessage',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
