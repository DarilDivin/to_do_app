import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dio/dio.dart';
import 'package:projet_controle/data/services/users_services.dart';
import 'login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  final formkey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final fullnameController = TextEditingController();
  final passwordController = TextEditingController();

  bool loading = false;

  final userService = UserService();

  createUser() async {
    setState(() {
      loading = true;
    });
    try {
      Map<String, dynamic> data = {
        'email': emailController.text,
        'fullname': fullnameController.text,
        'password': passwordController.text
      };
      print(data);

      await userService.create(data);

      passwordController.text = "";
      fullnameController.text = "";
      emailController.text = "";

      Fluttertoast.showToast(msg: "Utilisateur créé avec succès");

    } on DioException catch (e) {

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
          const Text("Créer un compte", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue),),
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
                    controller: fullnameController,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        label: Text("Nom & Prénom *"),
                        hintText: "Entrez votre nom et prénom"
                    ),
                    validator: (String? value) {
                      return value == null || value == "" ? "Ce champ est obligatoire" : null;
                    },
                  ),
                  TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    obscureText: true,
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
                      onPressed: () async{
                        if(!loading) {
                          if (formkey.currentState!.validate()) {
                            await createUser();
                          }
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
                      Text("Créer", style: TextStyle(fontSize: 16),)
                  ),
                ],
              )
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage())
                  );
                },
                child: Text("Connectez vous", style: TextStyle(fontSize: 20),)
            ),
          )
        ],
      ),
    );
  }
}
