import 'package:conversor_moedas/app/shared/models/currency_model.dart';
import 'package:flutter/material.dart';

class ConversaoWidget extends StatelessWidget {
  const ConversaoWidget({Key? key, required this.currencyData})
      : super(key: key);

  final CurrencyData currencyData;

  double get real => currencyData.real;
  double get euro => currencyData.euro;
  double get dolar => currencyData.dolar;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Card(
            child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 12, right: 18),
                child: Text(
                  'R\$${real.toStringAsFixed(2).replaceAll('.', ',')}',
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'Dolar: R\$${dolar.toStringAsFixed(2).replaceAll('.', ',')}'),
                    const SizedBox(height: 5),
                    Text(
                        'Euro: R\$${euro.toStringAsFixed(2).replaceAll('.', ',')}'),
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
