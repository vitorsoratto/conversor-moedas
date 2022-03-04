import 'package:flutter_triple/flutter_triple.dart';

class HistoricoStore extends NotifierStore<Exception, int> {
  HistoricoStore(this.real, this.dolar, this.euro) : super(0);

  final double real;
  final double dolar;
  final double euro;

  teste() {
    print(real);
    print(dolar);
    print(euro);
  }
}
