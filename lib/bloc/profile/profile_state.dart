part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileLoaded extends ProfileState {
  final ProfileResponseModel profilResponseModel;

  ProfileLoaded({
    required this.profilResponseModel,
  });
}

final class ProfileError extends ProfileState {
  final String message;

  ProfileError({
    required this.message,
  });
}
