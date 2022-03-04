import 'package:conversor_moedas/app/shared/models/currency_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class HomeStore extends NotifierStore<Exception, double> {
  HomeStore() : super(0);

  final currency = Modular.get<Currency>();
  final currencyList = Modular.get<List<CurrencyData>>();

  TextEditingController valueText = TextEditingController();

  final FocusNode focusNode = FocusNode();

  bool validate = false;

  double real = 0;
  double dolar = 0;
  double euro = 0;

  convert() {
    if (valueText.text == '') {
      validate = true;
      update(state);
      return;
    }
    validate = false;
    real = double.parse(valueText.text.replaceAll(',', '.'));
    dolar = real / currency.Dolar;
    euro = real / currency.Euro;

    CurrencyData data = CurrencyData(dolar: dolar, euro: euro, real: real);

    currencyList.add(data);

    update(real);
    clean();
  }

  clean() {
    valueText.text = '';
  }
}
