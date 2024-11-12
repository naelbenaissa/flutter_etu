import 'package:flutter/material.dart';
import 'dart:convert'; // for the utf8.encode method
import 'package:crypto/crypto.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  /// Propriétés
  String? nom;
  String? courriel;
  String? password; /// Test123!
  final _formKey = GlobalKey<FormState>(); /// https://api.flutter.dev/flutter/widgets/GlobalKey-class.html


  /// Méthodes
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter et formulaires'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.purple,
      ),
      body: _formSection(),
    );
  }

  /// Construction du formulaire
  Widget _formSection() {
    return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.blueGrey,
                  ),
                  height: 200,
                  child: const Center(
                    child: Text(
                        "Identification",
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 15)),
                blocNom(),
                blocCourriel(),
                blocPassword(),
                const Padding(padding: EdgeInsets.only(bottom: 15)),
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(Colors.blueGrey),
                    foregroundColor: WidgetStatePropertyAll<Color>(Colors.white)
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // print("Données du formulaire validées");
                      // print("$nom - $courriel - $password - $_formKey");
                    final message  = "Nom : $nom\nCourriel : $courriel\nMot de passe : $password";
                      final snackBar = SnackBar(
                          content: Text(
                            message,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        backgroundColor: Colors.purple,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: const Text(
                      "S'identifier",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }

  /// Bloc nom
  Widget blocNom() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        maxLength: 30,
        obscureText: false,
        decoration: const InputDecoration(
          labelText: "Nom d'utilisateur",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))
          ),
        ),
        validator: (value) {
          if (value!.length < 4) {
            return "Entrer au moins 4 caractères";
          }
          return null;
        },
        onSaved: (value) {
          setState(() {
            nom = value;
          });
        },
      ),
    );
  }

  /// Bloc Courriel
  Widget blocCourriel() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        obscureText: false,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          hintText: "Courriel personnel"
        ),
        validator: (value) {
          const emailRegExp = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
          final regExp = RegExp(emailRegExp);
          if (!regExp.hasMatch(value!)){
            return "Entrer un courriel valide";
          }
          return null;
        },
        onSaved: (value) {
          setState(() {
            courriel = value;
          });
        },
      ),
    );
  }

  /// blocPassword
  Widget blocPassword() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        obscureText: true,
        decoration: const InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            hintText: "Mot de passe"
        ),
        validator: (value) {
          const passwordRegExp = r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$';
          final regExp = RegExp(passwordRegExp);
          if (!regExp.hasMatch(value!)){
            return "Entrer un mot de passe valide";
          }
          return null;
        },
        onSaved: (value) {
          setState(() {
            var bytes = utf8.encode(value!);
            var digest = sha512.convert(bytes); /// pub.dev : crypto
            password = digest.toString();
          });
        },
      ),
    );
  }
} /// Class