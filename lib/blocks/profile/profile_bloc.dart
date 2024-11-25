import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:j_courier/models/profile/profile.dart';
import 'package:j_courier/repositories/profile/profile_abstarct_repository.dart';
import 'package:talker_flutter/talker_flutter.dart';
import '../../models/ApiResponse';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(this.profileRepository) : super(ProfileInitial()) {
    on<LoadProfile>(_load);
  }

  final ProfileAbstractRepository profileRepository;

  Future<void> _load(
    LoadProfile event,
    Emitter<ProfileState> emit,
  ) async {
    if (state is! ProfileSuccess) {
      emit(ProfileLoading());
    }
    final response = await profileRepository.getProfile();

    if (response is SuccessResponse<Profile>) {
      emit(ProfileSuccess(profile: response.data));
    } else if (response is ErrorResponse) {
      emit(ProfileFailure(exception: response.errorMessage));
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }
}
