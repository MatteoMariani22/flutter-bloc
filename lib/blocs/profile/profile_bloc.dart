import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_essentials_kit/errors/localized_error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter-bloc/errors/generic_error.dart';
import 'package:flutter-bloc/models/groups/groups.dart';
import 'package:flutter-bloc/models/impersonation/impersonation.dart';
import 'package:flutter-bloc/models/profile/profile.dart';
import 'package:flutter-bloc/repositories/profile_repository.dart';

part 'profile_bloc.freezed.dart';
part 'profile_event.dart';
part 'profile_state.dart';

/// The ProfileBloc
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository profileRepository;

  /// Create a new instance of [ProfileBloc].
  ProfileBloc({
    required this.profileRepository,
  }) : super(const ProfileState.initial()) {
    on<GetProfileEvent>(_onGet);
    on<GetGroupsProfileEvent>(_onGetGroups);
    on<ImpersonationProfileEvent>(_onImpersonation);
    on<ResetProfileEvent>(_onReset);
  }

  /// Method used to add the [GetProfileEvent] event
  void get() => add(const ProfileEvent.get());

  FutureOr<void> _onGet(
    ProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileState.getting());

    try {
      final profile = await profileRepository.profile();

      emit(
        profile.authorized ? ProfileState.got(profile) : const ProfileState.notAuthorized(),
      );
    } on LocalizedError catch (error) {
      emit(ProfileState.errorGetting(error));
    } catch (error) {
      emit(ProfileState.errorGetting(GenericError()));
    }
  }

  void groups() => add(const ProfileEvent.getGroups());

  FutureOr<void> _onGetGroups(
    ProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileState.gettingGroups());

    try {
      final groups = await profileRepository.groups();

      emit(ProfileState.gotGroups(groups));
    } on LocalizedError catch (error) {
      emit(ProfileState.errorGettingGroups(error));
    } catch (error) {
      emit(ProfileState.errorGettingGroups(GenericError()));
    }
  }

  void impersonation({
    required String group,
    List<String>? specialities,
  }) =>
      add(ProfileEvent.impersonation(
        group: group,
        specialities: specialities,
      ));

  FutureOr<void> _onImpersonation(
    ImpersonationProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileState.impersonating());

    try {
      final impersonation = Impersonation(
        group: event.group,
        specialities: event.specialities,
      );

      final profile = await profileRepository.impersonation(impersonation);

      emit(ProfileState.impersonated(profile));
    } on LocalizedError catch (error) {
      emit(ProfileState.errorImpersonating(error));
    } catch (error) {
      emit(ProfileState.errorImpersonating(GenericError()));
    }
  }

  void reset() => add(const ProfileEvent.reset());

  FutureOr<void> _onReset(
    ResetProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileState.reset());
  }
}

extension ProfileBlocExtension on BuildContext {
  /// Extension method used to get the [ProfileBloc] instance
  ProfileBloc get profileBloc => read<ProfileBloc>();
}
