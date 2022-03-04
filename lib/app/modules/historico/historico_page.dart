import 'package:conversor_moedas/app/shared/models/currency_model.dart';
import 'package:conversor_moedas/app/widgets/conversao_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'historico_store.dart';

class HistoricoPage extends StatelessWidget {
  final List<dynamic> currencyList;

  const HistoricoPage({Key? key, required this.currencyList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Histórico de Conversão'),
          centerTitle: true,
          leading: BackButton(
            onPressed: () {
              Modular.to.navigate('/');
            },
          ),
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount: currencyList.length,
            itemBuilder: (context, i) {
              return GestureDetector(
                onTap: () {
                  Modular.to.navigate('/', arguments: currencyList[i]);
                },
                child: ConversaoWidget(
                  currencyData: currencyList[i],
                ),
              );
            },
          ),
        ));
  }
}
