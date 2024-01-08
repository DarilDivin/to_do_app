import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projet_controle/pages/todolist_page.dart';

import '../data/services/todo_services.dart';

class CreateTodoPage extends StatefulWidget {
  const CreateTodoPage({super.key});

  @override
  State<CreateTodoPage> createState() => _CreateTodoPageState();
}

class _CreateTodoPageState extends State<CreateTodoPage> {

  final formkey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final priorityController = TextEditingController();
  final deadlineController = TextEditingController();

  int selectedIndex = 0;


  bool loading = false;

  final todoService = TodoService();

  createTodo() async {
    setState(() {
      loading = true;
    });
    try {

      Map<String, dynamic> data = {
        'title': titleController.text,
        'description': descriptionController.text,
        'priority': priorityController.text,
        'deadline_at': deadlineController.text,
      };

      await todoService.create(data);

      titleController.text = "";
      descriptionController.text = "";
      priorityController.text = "";
      deadlineController.text = "";

      Fluttertoast.showToast(msg: "Tache créée avec succès");

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

      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const TodoList())
      );
    }

  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Créer une tache", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text("Créer une tache", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.blue),),
              SizedBox(height: 30,),
              Form(
                  key: formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: titleController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            hintText: "Titre"
                        ),
                        validator: (String? value) {
                          return value == null || value == "" ? "Ce champ est obligatoire" : null;
                        },
                      ),
                      const SizedBox(height: 15,),
                      TextFormField(
                        controller: descriptionController,
                        minLines: 3,
                        maxLines: 6,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            hintText: "Contenu"
                        ),
                        validator: (String? value) {
                          return value == null || value == "" ? "Ce champ est obligatoire" : null;
                        },
                      ),
                      const SizedBox(height: 20,),
                      TextFormField(
                        controller: priorityController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            hintText: "Priorité"
                        ),
                        validator: (String? value) {
                          return value == null || value == "" ? "Ce champ est obligatoire" : null;
                        },
                      ),
                      const SizedBox(height: 20,),
                      InputDatePickerFormField(firstDate: DateTime.now(), lastDate: DateTime(3000)),
                      const SizedBox(height: 20,),
                      ElevatedButton(
                          onPressed: () async {
                            if(!loading) {
                              if (formkey.currentState!.validate()) {
                                await createTodo();
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
                          const Text("Créer", style: TextStyle(fontSize: 16),)
                      ),
                    ],
                  )
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: Colors.redAccent,
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const<BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Inscription'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: 'Information'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Paramètres'
          ),
        ],
      ),
    );
  }
}
