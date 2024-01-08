import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projet_controle/data/models/todo.dart';
import 'package:projet_controle/data/services/todo_services.dart';
import 'package:projet_controle/pages/create_todo_page.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _HomePageState();
}

class _HomePageState extends State<TodoList> {



  List<Todo> todos = [];
  bool loading = false;

  final todoService = TodoService();

  loadTodos() async {
    setState(() {
      loading = true;
    });
    try {

      todos = await todoService.getAll();
      setState(() {});

      print(todos);

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
  void initState() {
    // TODO: implement initState
    super.initState();
    loadTodos();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CreateTodoPage())
          );
        },
        child: const Icon(Icons.add),
      ),
      body: loading ?
      const Center(
        child: SizedBox(
            height: 50,
            width: 50,
            child: CircularProgressIndicator(color: Colors.blue, strokeWidth: 3,)
        ),
      ) : todos.length > 0 ?
      ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.access_alarm_rounded),
                  title: Text(todos[index].title!, maxLines: 1,),
                  subtitle: Text(todos[index].description!, maxLines: 3, style: const TextStyle(fontSize: 15),),
                  onTap: () {
                    /* Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailPostPage(post: posts[index].id!,))
                ); */
                  },

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        
                      }, 
                      child: Text("Modifier")
                    ),
                    TextButton(
                      onPressed: () {

                      },
                      child: Text("Commencer")
                    ),
                    TextButton(
                      onPressed: () {

                      },
                      child: Text("Finir")
                    ),
                    TextButton(
                      onPressed: () {

                      },
                      child: Text("Détails")
                    )
                  ],
                ),

              ],
            )
          );
        },
      ) :
      const Center(
        child: Text("Aucune tache disponible", style: TextStyle(fontSize: 30),),
      ),
    );
  }
}

