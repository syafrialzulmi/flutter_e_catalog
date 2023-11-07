import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:flutter_e_catalog/data/datasources/auth_datasources.dart';
import 'package:flutter_e_catalog/data/models/response/profile_response_model.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final AuthDatasources authDatasources;
  ProfileBloc(
    this.authDatasources,
  ) : super(ProfileInitial()) {
    on<GetProfileEvent>((event, emit) async {
      try {
        emit(ProfileLoading());
        final result = await authDatasources.getProfil();
        emit(ProfileLoaded(profilResponseModel: result));
      } catch (e) {
        emit(ProfileError(message: 'network problem : ${e.toString()}'));
      }
    });
  }
}
