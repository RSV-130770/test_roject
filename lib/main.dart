import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_roject/cur.dart';
import 'dart:async';



void main() {
  runApp(const MyApp());
}

class CurrencyPage extends StatefulWidget {
  const CurrencyPage({super.key});

  @override
  _CurrencyPageState createState() => _CurrencyPageState();
}
class _CurrencyPageState extends State<CurrencyPage> {
  late Future<Map<String, dynamic>> exchangeRates;

  @override
  void initState() {
    super.initState();
    exchangeRates = fetchExchangeRates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Currency Layer')),
      body: FutureBuilder<Map<String, dynamic>>(
        future: exchangeRates,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            final data = snapshot.data!;
            // process and display data here
            return Text('Quotes: ${data['quotes']}');
          }
          return Container();
        },
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test project',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: CurrencyPage(),
    );
  }
}

Future<http.Response> fetchAlbum() {
  return http.get(Uri.parse('http://apilayer.net/api/live'));
}



