import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:projet_controle/data/dio_instance.dart';
import 'package:projet_controle/data/models/todo.dart';

class TodoService {

  Dio api = configureDio();

  Future<Todo> create (Map<String, dynamic> data) async{

    final pref = await SharedPreferences.getInstance();
    String token = pref.getString("token") ?? "";

    if (token != "") {
      api.options.headers['AUTHORIZATION'] = 'Bearer $token';
    }

    final response = await api.post('todos', data: data);

    return Todo.fromJson(response.data);
  }

  Future<Todo> getTodoById (String id) async{

    final pref = await SharedPreferences.getInstance();
    String token = pref.getString("token") ?? "";

    if (token != "") {
      api.options.headers['AUTHORIZATION'] = 'Bearer $token';
    }

    final response = await api.get('todos/$id');

    return Todo.fromJson(response.data);
  }

  Future<List<Todo>> getAll () async{

    final pref = await SharedPreferences.getInstance();
    String token = pref.getString("token") ?? "";

    if (token != "") {
      api.options.headers['AUTHORIZATION'] = 'Bearer $token';
    }

    final response = await api.get('todos');

    return (response.data as List).map((e) => Todo.fromJson(e)).toList();
  }

  Future<List<Todo>> getTodoByPriority (String priority) async{

    final pref = await SharedPreferences.getInstance();
    String token = pref.getString("token") ?? "";

    if (token != "") {
      api.options.headers['AUTHORIZATION'] = 'Bearer $token';
    }

    final response = await api.get('todos?priority=$priority');

    return (response.data as List).map((e) => Todo.fromJson(e)).toList();
  }

  Future<Todo> beginTodo (String id) async{

    final pref = await SharedPreferences.getInstance();
    String token = pref.getString("token") ?? "";

    if (token != "") {
      api.options.headers['AUTHORIZATION'] = 'Bearer $token';
    }

    /* Todo todo = await getTodoById(id);

    todo.beginedAt = DateTime.now().toString(); */

    Map<String, String> data = { "begined_at": DateTime.now().toString() };

    final response = await api.patch('todos/$id', data: data);

    return Todo.fromJson(response.data);
  }

  Future<Todo> finishTodo (String id) async{

    final pref = await SharedPreferences.getInstance();
    String token = pref.getString("token") ?? "";

    if (token != "") {
      api.options.headers['AUTHORIZATION'] = 'Bearer $token';
    }

    /* Todo todo = await getTodoById(id);

    todo.finishedAt = DateTime.now(); */

    Map<String, String> data = { "finished_at": DateTime.now().toString() };

    final response = await api.patch('todos/$id', data: data);

    return Todo.fromJson(response.data);
  }

  Future<Todo> patchTodo (String id, Map<String, String> data) async{

    final pref = await SharedPreferences.getInstance();
    String token = pref.getString("token") ?? "";

    if (token != "") {
      api.options.headers['AUTHORIZATION'] = 'Bearer $token';
    }

    final response = await api.patch('todos/$id', data: data);

    return Todo.fromJson(response.data);
  }

}