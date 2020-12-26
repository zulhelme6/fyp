import 'package:flutter/material.dart';
import 'package:haifma_v2/screens/Wrapper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Wrapper() ,


    );
  }
}
