import 'package:bytebank/models/transferencias.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'lista.dart';

final _titulo = 'Ultimas transferencias';

class SemTransferenciaCadastrada extends StatelessWidget {
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(40),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          'Voce ainda nao cadastrou nenhuma transferencia',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class UltimasTransferencias extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          _titulo,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Consumer<Transferencias>(builder: (context, transferencias, child) {
          final _quantidade = transferencias.transferencias.length;
          final _ultimasTransferencias =
              transferencias.transferencias.reversed.toList();

          int _tamanho = 2;

          if(_quantidade == 0){
            return SemTransferenciaCadastrada();
          }

          if (_quantidade < 3) {
            _tamanho = _quantidade;
          }
          return ListView.builder(
            padding: const EdgeInsets.all(0),
            itemCount: _tamanho,
            shrinkWrap: true,
            itemBuilder: (context, indice) {
              return ItemTransferencia(_ultimasTransferencias[indice]);
            },
          );
        }),
        RaisedButton(
          color: Colors.green,
          child: Text('Ver todas transferencias'),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ListaTransferencias();
            }));
          },
        ),
      ],
    );
  }
}
