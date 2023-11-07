part of 'register_bloc.dart';

@immutable
abstract class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterLoaded extends RegisterState {
  final RegisterResponseModel response;

  RegisterLoaded({
    required this.response,
  });
}
