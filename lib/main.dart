import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/transaction_prodivder.dart';
import 'package:flutter_application_1/views/HomePage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return TransactionssProvider();
        })
      ],
      child:  MaterialApp(
        title: 'Flutter Demo',
        home: HomepageApp(),
      ),
    );
  }
}
