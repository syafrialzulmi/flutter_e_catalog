import 'package:bloc/bloc.dart';
import 'package:flutter_e_catalog/data/localsources/auth_local_storage.dart';
import 'package:meta/meta.dart';

import 'package:flutter_e_catalog/data/datasources/auth_datasources.dart';
import 'package:flutter_e_catalog/data/models/request/login_request_model.dart';
import 'package:flutter_e_catalog/data/models/response/login_response_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthDatasources authDatasources;
  LoginBloc(
    this.authDatasources,
  ) : super(LoginInitial()) {
    on<DoLoginEvent>((event, emit) async {
      try {
        emit(LoginLoading());
        final result = await authDatasources.login(event.loginRequestModel);
        await AuthLocalStorage().saveToken(result.accessToken);
        emit(LoginLoaded(loginResponseModel: result));
      } catch (e) {
        emit(LoginError(message: 'Network problem'));
      }
    });
  }
}
