import 'dart:ffi';

class Currency {
  final double Dolar = 5.05;
  final double Euro = 5.58;
}

class CurrencyData {
  final double dolar;
  final double euro;
  final double real;

  CurrencyData({required this.dolar, required this.euro, required this.real});
}
