import 'package:http/http.dart' as http;
import 'dart:convert';
import 'constants.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future<double> getCoinData(
      {required String coin, required String currency}) async {
    Map<String, String> headers = {
      'X-CoinAPI-Key': kAPIKey,
    };
    http.Response response = await http.get(
      Uri.parse('https://rest.coinapi.io/v1/exchangerate/$coin/$currency'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      dynamic rateData = jsonDecode(response.body);
      var rate = rateData['rate'];
      return rate.toDouble();
    } else {
      print('failed to retrieve rate data for $currency');
      return 0;
    }
  }
}
