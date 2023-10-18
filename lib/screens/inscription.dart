import 'package:flutter/material.dart';
import 'package:test_test/screens/connexion.dart';
import 'package:test_test/widgets/customTextField.dart';
import 'package:http/http.dart' as http;


class InscriptionPage extends StatefulWidget {
  const InscriptionPage({Key? key}) : super(key: key);

  @override
  State<InscriptionPage> createState() => _InscriptionPageState();
}

class _InscriptionPageState extends State<InscriptionPage> {
  CustomTextField usernameText =
      CustomTextField(title: 'Username', placeholder: 'Saisissez votre username');
  CustomTextField emailText =
      CustomTextField(title: 'Email', placeholder: 'Saisissez votre email');
  CustomTextField passwordText = CustomTextField(
      title: 'Mot de passe',
      placeholder: 'Saisissez votre mot de passe',
      ispass: true);
  CustomTextField confirmpasswordText = CustomTextField(
      title: 'Confirmation de mot de passe',
      placeholder: 'Confirmez votre mot de passe',
      ispass: true);
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    usernameText.err = "Veuillez renseigné votre username";
    emailText.err = "Veuillez renseigné votre email";
    passwordText.err = "Veuillez renseigné votre mot de passe";
    confirmpasswordText.err = "Veuillez confirmer votre mot de passe";
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
                  Text(
                    "Inscription",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  usernameText.textFormField(),
                  SizedBox(
                    height: 15,
                  ),
                  emailText.textFormField(),
                  SizedBox(
                    height: 15,
                  ),
                  passwordText.textFormField(),
                  SizedBox(
                    height: 15,
                  ),
                  confirmpasswordText.textFormField(),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_key.currentState!.validate()) {
                        final username = usernameText.value;
                        final email = emailText.value;
                        final password = passwordText.value;

                        await registerUser(username, email, password);
                      }
                    },
                    child: Text(
                      "Inscription",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent.withOpacity(.7),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Vous avez un compte?"),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Connexion()));
                        },
                        child: Text(
                          "Connectez-vous",
                          style: TextStyle(color: Colors.redAccent),
                        ),
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

  Future<void> registerUser(String username, String email, String password) async {
    final url =
        Uri.parse('http://127.0.0.1:8000/api/register/');

    final response = await http.post(
      url,
      body: {
        'username': username,
        'email': email,
        'password': password,
      },
    );

    print(response.statusCode);
  }
}
