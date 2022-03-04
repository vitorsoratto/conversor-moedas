import 'package:conversor_moedas/app/shared/models/currency_model.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/historico/historico_module.dart';
import 'modules/historico/historico_page.dart';
import 'modules/home/home_module.dart';

class AppModule extends Module {
  // @override
  // final List<Module> imports = [
  //   HomeModule(),
  // ];

  @override
  final List<Bind> binds = [
    Bind.singleton((i) => Currency()),
    Bind.singleton<List<CurrencyData>>((i) => <CurrencyData>[]),
    // Bind.lazySingleton((i) => Share())
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
  ];
}
