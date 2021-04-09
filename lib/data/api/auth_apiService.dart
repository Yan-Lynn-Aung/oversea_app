import 'package:oversea_app/data/model/user.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_apiService.g.dart';

@RestApi(baseUrl: 'http://localhost:8000/api/v1/')
abstract class AuthapiService {
  @POST('auth/login')
  Future<User> login(@Body() User user);
}
