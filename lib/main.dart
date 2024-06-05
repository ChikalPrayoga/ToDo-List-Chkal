import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //Widget dasar dari aplikasi
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.(statusBarColor: Color.transparent))
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To-Do List',
      home: Home(),
    ); //Material App
  }
}
