import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_test/main.dart';
import 'package:test_test/screens/inscription.dart';
import 'package:test_test/widgets/customTextField.dart';
import 'package:http/http.dart' as http;

class Connexion extends StatefulWidget {
  const Connexion({Key? key}) : super(key: key);

  @override
  State<Connexion> createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  CustomTextField usernameText =
      CustomTextField(title: 'Username', placeholder: 'Saisissez votre username');
  CustomTextField passwordText = CustomTextField(title: 'Mot de passe', placeholder: 'Saisissez votre mot de passe', ispass: true);
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    usernameText.err = "Veuillez renseigné votre username";
    passwordText.err = "Veuillez renseigné votre mot de passe";
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(22),
            child: Form(
              key: _key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("Connexion", textAlign: TextAlign.center, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.redAccent),),
                  SizedBox(height: 30,),
                  usernameText.textFormField(),
                  SizedBox(height: 15,),
                  passwordText.textFormField(),
                  SizedBox(height: 15,),
                  ElevatedButton(
                    onPressed: () async {
                      if(_key.currentState!.validate()){
                        final username = usernameText.value;
                        final password = passwordText.value;

                        await loginUser(username, password);
                      }
                    }, 
                    child: Text("Connexion", style: TextStyle(color: Colors.white),),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent.withOpacity(.7),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Vous n'avez pas de compte?"),
                        TextButton( 
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => InscriptionPage()));
                          },  
                          child: Text("Inscrivez-vous", style: TextStyle(color: Colors.redAccent),),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

    Future<void> loginUser(String username, String password) async {
    try{
      final url = Uri.parse('http://127.0.0.1:8000/api/login/'); 

      final response = await http.post(
        url,
        body: {
          'username': username,
          'password': password,
        },
      );
      
      if (response.statusCode == 200) {
        final usern = Provider.of<UsernameProvider>(context, listen: false);
        usern.setUserName(username);
  
        Navigator.of(context).pushReplacementNamed('/home');
      } else {
          print("Erreur lors de la connexion. Code de statut : ${response.statusCode}");
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Connexion échouée')));
      }
    }on http.ClientException catch (e, stackTrace) {
      print('Erreur ClientException: $e');
      print('StackTrace: $stackTrace');
    }catch (e, stackTrace) {
      print('Erreur inattendue: $e');
      print('StackTrace: $stackTrace');
    }
  }
}
