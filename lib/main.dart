import 'package:flutter/material.dart';
import 'package:test_test/screens/connexion.dart';
import 'package:test_test/screens/home.dart';
import 'package:test_test/screens/inscription.dart';
import 'package:provider/provider.dart';
import 'package:test_test/screens/test.dart';

void main() {
  runApp(
    ChangeNotifierProvider<UsernameProvider>(
      create: (context) => UsernameProvider(),
      child: const MyApp(),
    ),
  );
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
        primarySwatch: Colors.indigo,
      ),
      initialRoute: '/connexion',
      routes: {
        '/connexion': (context) => Connexion(),
        '/inscription': (context) => InscriptionPage(),
        '/home': (context) => HomePage(),
        '/test': (context) => Test()
      },
    );
  }
}
class UsernameProvider with ChangeNotifier {
  String? username;
  void setUserName(String? name) {
    username = name;
    notifyListeners();
  }
}
