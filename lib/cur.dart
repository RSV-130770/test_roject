import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchExchangeRates() async {
  final apiKey = 'e3c28aef66135235c6990ddcb9e3a54c&';
  final url = 'http://api.currencylayer.com/live?access_key=$apiKey';

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return data;
  } else {
    throw Exception('Failed to load exchange rates');
  }
}


/*
class Currency {
  bool success= true;
  String terms= 'https://currencylayer.com/terms';
  String privacy='https://currencylayer.com/privacy';
  DateTime timestamp= 1430068515;
  String source= "USD";
   list <string>{
    'USDAUD':0,
    USDCHF,
    USDEUR,
    USDGBP,
    USDPLN);

  Currency( {required this.access_key, required this.source, required this.currencies,required this.format});

  factory Currency.fromJson(Map<String, dynamic> json) {
  return switch (json) {
  {'userId': int userId, 'id': int id, 'title': String title} => Currency(
  access_key: access_key,
  currencies: currencies,
  source: source,
  format :format
  ),
  _ => throw const FormatException('Failed to load currency.'),
  };
  }

}
Future< Currency> fetchCurrency() async {
  final response = await http.get(
    Uri.parse('http://apilayer.net/api/live?access_key=e3c28aef66135235c6990ddcb9e3a54c& currencies = EUR,GBP,CAD,PLN&source=USD&format=1'),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Currency.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}*/
