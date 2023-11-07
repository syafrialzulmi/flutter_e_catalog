part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class DoLoginEvent extends LoginEvent {
  final LoginRequestModel loginRequestModel;
  DoLoginEvent({
    required this.loginRequestModel,
  });
}
