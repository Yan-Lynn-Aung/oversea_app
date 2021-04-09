import 'package:oversea_app/data/api/auth_apiService.dart';
import 'package:oversea_app/data/model/user.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthapiRepository {
  // static String mainUrl = "http://localhost:8000/api/v1/";
  var loginUrl = 'http://localhost:8000/api/v1/auth/login';
  final AuthapiService _authapiService;
  AuthapiRepository(this._authapiService);

  final FlutterSecureStorage storage = new FlutterSecureStorage();
  final Dio _dio = Dio();

  Future<bool> hasToken() async {
    var value = await storage.read(key: 'token');
    if (value != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> persistToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  Future<void> deleteToken() async {
    storage.delete(key: 'token');
    storage.deleteAll();
  }

  // Future<User> login(User user) => _authapiService.login(user);

  Future<String> login(String email, String password) async {
    Response response = await _dio.post(loginUrl, data: {
      "email": email,
      "password": password,
    });
    return response.data["token"];
  }
}
