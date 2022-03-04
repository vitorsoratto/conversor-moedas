import 'package:conversor_moedas/app/modules/historico/historico_page.dart';
import 'package:conversor_moedas/app/modules/historico/historico_store.dart';
import 'package:conversor_moedas/app/shared/models/currency_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../home/home_store.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    // Bind.lazySingleton((i) => HistoricoStore(i(), i(), i())),
    // Bind.instance<double>(0),
    Bind.lazySingleton((i) => HomeStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, args) => HomePage(
              currencyData:
                  args.data ?? CurrencyData(dolar: 0, euro: 0, real: 0),
            )),
    ChildRoute('/historico',
        child: (_, args) => HistoricoPage(
              currencyList: args.data,
            )),
  ];
}
