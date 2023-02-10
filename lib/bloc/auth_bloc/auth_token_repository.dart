import 'dart:async';
import 'package:todo_applaudo/core/repository/dio_client.dart';

class AuthTokenRepository {
  static final AuthTokenRepository _singletonAuthTokenRepository =
      AuthTokenRepository._internal();

  factory AuthTokenRepository() {
    return _singletonAuthTokenRepository;
  }

  AuthTokenRepository._internal();

  Future<dynamic> authToken() async {
    return await DioClient().refreshToken();
  }
}
