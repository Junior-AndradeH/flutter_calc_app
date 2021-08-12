import 'package:flutter/material.dart';

void main() {
  runApp(AppFlutter());
}

class AppFlutter extends StatefulWidget {
  const AppFlutter({Key? key}) : super(key: key);

  @override
  _AppFlutterState createState() => _AppFlutterState();
}

class _AppFlutterState extends State<AppFlutter> {
  /*  **********************************************************************  */

  // final
  final _formKey = GlobalKey<FormState>();

  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  /*  **********************************************************************  */

  // global
  String? _active;
  String? _title;
  String? _subtitle;

  double? _heigth;
  double? _weight;
  double? _total;

  /*  **********************************************************************  */

  // return
  @override
  Widget build(BuildContext context) {
    /*  ********************************************************************  */

    // setando
    if (_active == null || _active == "") {
      _active = "off";
    }

    /*  ********************************************************************  */

    // return
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("IMC"),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                TextFormField(
                  controller: _heightController,
                  decoration: InputDecoration(
                    labelText: "Altura",
                    labelStyle: TextStyle(color: Colors.black),
                    hintText: "Ex: 1.80 m",
                  ),
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.red,
                  validator: (text) {
                    if (text!.isEmpty)
                      return "Altura inválido!";
                    else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  controller: _weightController,
                  decoration: InputDecoration(
                    labelText: "Peso",
                    labelStyle: TextStyle(color: Colors.black),
                    hintText: "Ex: 56 kg",
                  ),
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.red,
                  validator: (text) {
                    if (text!.isEmpty)
                      return "Altura inválido!";
                    else {
                      return null;
                    }
                  },
                ),
                ElevatedButton(
                  child: Text("Calcular IMC"),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        _active = "on";
                        _heigth = double.parse(_heightController.text);
                        _weight = double.parse(_weightController.text);
                        _total = _weight! / (_heigth! * _heigth!);

                        if (_total! < 18.5) {
                          _title = "Seu IMC é ${_total!.toStringAsFixed(2)}.";
                          _subtitle = "Status: Magreza.";
                        } else if (_total! >= 18.5 && _total! < 24.9) {
                          _title = "Seu IMC é ${_total!.toStringAsFixed(2)}.";
                          _subtitle = "Status: Normal.";
                        } else if (_total! >= 24.9 && _total! < 30.0) {
                          _title = "Seu IMC é ${_total!.toStringAsFixed(2)}.";
                          _subtitle = "Status: Sobrepeso.";
                        } else {
                          _title = "Seu IMC é ${_total!.toStringAsFixed(2)}.";
                          _subtitle = "Status: Obesidade.";
                        }
                      });
                    }
                  },
                ),
                SizedBox(height: 10.0),
                _title == null || _title == ""
                    ? Container()
                    : Card(
                        elevation: 5.0,
                        child: ListTile(
                          title: Text("$_title",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text("$_subtitle",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
