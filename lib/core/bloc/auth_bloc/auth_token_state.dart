import 'package:todo_applaudo/core/models/auth_token.dart';

class AuthTokenState {}

class AuthTokenInitialState extends AuthTokenState {}

class AuthTokenLoading extends AuthTokenState {}

class AuthTokenLoadedState extends AuthTokenState {
  AuthToken authToken;
  AuthTokenLoadedState(this.authToken);
}

class AuthTokenError extends AuthTokenState {
  Error e;
  AuthTokenError(this.e);
}
