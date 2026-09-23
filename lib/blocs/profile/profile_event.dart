part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.get() = GetProfileEvent;

  const factory ProfileEvent.getGroups() = GetGroupsProfileEvent;

  const factory ProfileEvent.impersonation({
    required String group,
    List<String>? specialities,
  }) = ImpersonationProfileEvent;

  const factory ProfileEvent.reset() = ResetProfileEvent;
}
