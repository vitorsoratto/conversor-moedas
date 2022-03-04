import 'package:conversor_moedas/app/shared/models/currency_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:share_plus/share_plus.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {
  final CurrencyData currencyData;
  const HomePage({Key? key, required this.currencyData}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  String dolar = '';
  String euro = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conversor de moedas'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {
                  String res = '';
                  for (var e in store.currencyList) {
                    var real = e.real.toStringAsFixed(2);
                    var dolar = e.euro.toStringAsFixed(2);
                    var euro = e.dolar.toStringAsFixed(2);
                    res +=
                        'Reais: R\$$real, Dolar: R\$$dolar, Euro: R\$$euro\n';
                  }

                  Share.share(res);
                },
                icon: const Icon(Icons.share)),
          ),
        ],
      ),
      body: ScopedBuilder<HomeStore, Exception, double>(
          store: store,
          onState: (_, real) {
            if (widget.currencyData.real == real || real == 0) {
              store.real = widget.currencyData.real;
              store.dolar = widget.currencyData.dolar;
              store.euro = widget.currencyData.euro;
              store.real.toString().replaceAll('.', '') == '0'
                  ? store.valueText.text = store.real.toString()
                  : store.valueText.text = '';
            }
            dolar = store.currency.Dolar.toString().replaceAll('.', ',');
            euro = store.currency.Euro.toString().replaceAll('.', ',');

            return Column(
              children: [
                const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: (Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dolar: R\$$dolar',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Euro: R\$$euro',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      TextField(
                        keyboardType: TextInputType.number,
                        controller: store.valueText,
                        decoration: InputDecoration(
                          label: const Text('Valor em Reais'),
                          errorText:
                              store.validate ? 'Escreva algum valor' : null,
                        ),
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          onPressed: () {
                            store.convert();
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(12),
                            child: Text('CONVERTER'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: (Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Resultado:',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Dolar: \$${store.dolar.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Euro: €${store.euro.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    )),
                  ),
                ),
              ],
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Modular.to.navigate('/historico', arguments: store.currencyList),
        child: const Icon(Icons.format_align_left),
      ),
    );
  }
}
