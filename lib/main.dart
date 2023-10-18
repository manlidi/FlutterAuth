import 'package:flutter/material.dart';
import 'package:test_test/screens/connexion.dart';
import 'package:test_test/screens/home.dart';
import 'package:test_test/screens/inscription.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: '/inscription',
      routes: {
        '/connexion': (context) => Connexion(),
        '/inscription': (context) => InscriptionPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}

