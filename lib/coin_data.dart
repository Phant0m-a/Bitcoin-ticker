import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    var urlPar = Uri.parse(url);
    http.Response res = await http.get(urlPar);
    if (res.statusCode == 200) {
      print(res.body);
      String body = res.body;

      return jsonDecode(body);
    } else {
      print(res.statusCode);
    }
  }
}

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
  'PKR',
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
  // 'BNB',
  // 'ADA',
  // 'ATA',
  // 'BAKE',
  // 'AAVE',
  // 'CAKE',
  // 'MATIC',
  // 'SLP',
  // 'DOT',
  // 'NEO',
  // 'CHZ',
  // 'ALGO',
  // 'POLS',
  // 'SNX',
  // 'LRC',
  // 'ALICE',
  // 'NULS',
  // 'XEC',
  // 'SHIB',
  // 'DODGE',
];

class CoinData {
  final url;
  CoinData(this.url);

  // {this.fiat, this.crypto}
  // final fiat, crypto;
  //

  Future getData() async {
    var urlPar = Uri.parse(url);
    http.Response res = await http.get(urlPar);
    if (res.statusCode == 200) {
      print(res.body);
      String body = res.body;

      return jsonDecode(body);
    } else {
      print(res.statusCode);
    }
  }

  // https://api.nomics.com/v1/currencies/ticker?key=3db103ef8cc6cba1c93f75f81c5e1d8c5f5482ad&ids=BTC&convert=USD

}
