import 'package:flutter/material.dart';
import 'package:projet_controle/data/models/authenticated_user.dart';
import 'package:projet_controle/data/services/users_services.dart';
import 'package:projet_controle/pages/StatistiquePage.dart';
import 'package:projet_controle/pages/todolist_page.dart';
import 'package:projet_controle/pages/signup_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final emailController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  bool loading = false;

  // Initialiser la classe du service user
  final userService = UserService();

  loginUser() async {

    // déclencher le loading
    setState(() {
      loading = true;
    });

    try {

      // Prépare les données à envoyer
      Map<String, dynamic> data = {
        'email': emailController.text,
        'strategy': 'local',
        'password': passwordController.text
      };

      // Lancer la requête
      AuthenticatedUser authUser = await userService.login(data);

      // Initialiser une instance de shared preference
      final sharedPref = await SharedPreferences.getInstance();

      // Sauvegerder le token en mémoire
      sharedPref.setString("token", authUser.accessToken!);

      // Afficher un message de succès
      Fluttertoast.showToast(msg: "Utilisateur connecté avec succès");

      // rediriger vers la page home
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => TodoList())
      );

    } on DioException catch (e) {

      // Quand erreur de requête, afficher les erreurs et le status code
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.statusCode);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }

      Fluttertoast.showToast(msg: "Une erreur est survenue");

    } finally {
      setState(() {
        loading = false;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text("Se connecter", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue),),
          Form(
              key: formkey,
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        icon: Icon(Icons.mail),
                        label: Text("Email *"),
                        hintText: "Entrez votre email"
                    ),
                    validator: (String? value) {
                      return value == null || value == "" ? "Ce champ est obligatoire" : null;
                    },
                  ),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        icon: Icon(Icons.lock),
                        label: Text("Mot de passe *"),
                        hintText: "Entrez votre mot de passe"
                    ),
                    validator: (String? value) {
                      return value == null || value == "" ? "Ce champ est obligatoire" : null;
                    },
                  ),
                  const SizedBox(height: 20,),
                  ElevatedButton(
                      onPressed: () async {
                        if (!loading) {
                          await loginUser();
                        }
                      },
                      child: loading ?
                      const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                        ),
                      ) :
                      const Text("Connexion", style: TextStyle(fontSize: 16),)
                  ),
                ],
              )
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SignupPage())
                  );
                },
                child: const Text("Créer un compte", style: TextStyle(fontSize: 20),)
            ),
          )
        ],
      ),
    );
  }
}
