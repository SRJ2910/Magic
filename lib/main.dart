import 'package:flutter/material.dart';
import 'package:magic/paymentChat.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magic',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: payChat(),
    );
  }
}
