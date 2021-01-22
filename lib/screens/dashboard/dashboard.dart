import 'package:bytebank/models/saldo.dart';
import 'package:bytebank/screens/dashboard/saldo.dart';
import 'package:bytebank/screens/deposito/formulario.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Bytebank'),
        ),
        body: ListView(children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: SaldoCard(),
          ),
          RaisedButton(
              child: Text('Receber Deposito'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return FormularioDeposito();
                }));
              },
            ),
        ]));
  }
}
