import 'package:flutter/material.dart';
import 'package:test_test/screens/inscription.dart';
import 'package:test_test/widgets/customTextField.dart';

class Connexion extends StatefulWidget {
  const Connexion({Key? key}) : super(key: key);

  @override
  State<Connexion> createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  CustomTextField emailText = CustomTextField(title: 'Email', placeholder: 'Saisissez votre email');
  CustomTextField passwordText = CustomTextField(title: 'Mot de passe', placeholder: 'Saisissez votre mot de passe', ispass: true);
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    emailText.err = "Veuillez renseigné votre email";
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
                  emailText.textFormField(),
                  SizedBox(height: 15,),
                  passwordText.textFormField(),
                  SizedBox(height: 15,),
                  ElevatedButton(
                    onPressed: (){
                      if(_key.currentState!.validate()){
                        print(emailText.value);
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
}
