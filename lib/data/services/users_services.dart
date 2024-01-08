import 'package:dio/dio.dart';
import 'package:projet_controle/data/dio_instance.dart';
import 'package:projet_controle/data/models/authenticated_user.dart';

class UserService {

  Dio api = configureDio();

  Future<AuthenticatedUser> login (Map<String, dynamic> data) async{

    final response =  await api.post('authentication', data: data);

    return AuthenticatedUser.fromJson(response.data);
  }

  Future<User> create (Map<String, dynamic> data) async{

    final response = await api.post('users', data: data);

    return User.fromJson(response.data);
  }

}