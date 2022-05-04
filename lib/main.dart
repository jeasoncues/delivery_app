import 'package:flutter/material.dart';
import 'package:momba/pages/home/home_page.dart';
import 'package:momba/pages/register/register_page.dart';

import 'pages/login/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivery Moumba',
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login': (BuildContext context) => const LoginPage(),
        'register': (BuildContext context) => RegisterPage(),
        'home': (BuildContext context) => HomePage(),
      },
    );
  }
}
