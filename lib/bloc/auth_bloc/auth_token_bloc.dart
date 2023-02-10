import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_applaudo/core/models/auth_token.dart';

import 'auth_token_event.dart';
import 'auth_token_repository.dart';
import 'auth_token_state.dart';

class AuthTokenBloc extends Bloc<FetchAutTokenEvent, AuthTokenState> {
  final AuthTokenRepository _authTokenRepository = AuthTokenRepository();

  AuthTokenState get initialState {
    return AuthTokenInitialState();
  }

  AuthTokenBloc() : super(AuthTokenInitialState()) {
    on<FetchAutTokenEvent>((event, emit) async {
      emit(AuthTokenLoading());
      try {
        AuthToken userResponseList = await _authTokenRepository.authToken();
        emit(AuthTokenLoadedState(userResponseList));
        debugPrint(userResponseList.email);
      } catch (e) {
        debugPrint("error msg ${e.toString()}");
        emit(AuthTokenError(Error()));
      }
    });
  }
}
