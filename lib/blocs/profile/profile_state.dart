part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = InitialProfileState;

  const factory ProfileState.getting() = GettingProfileState;

  const factory ProfileState.got(Profile profile) = GotProfileState;

  const factory ProfileState.notAuthorized() = NotAuthorizedProfileState;

  const factory ProfileState.errorGetting(LocalizedError error) = ErrorGettingProfileState;

  const factory ProfileState.gettingGroups() = GettingGroupsProfileState;

  const factory ProfileState.gotGroups(Groups groups) = GotGroupsProfileState;

  const factory ProfileState.errorGettingGroups(LocalizedError error) =
      ErrorGettingGroupsProfileState;

  const factory ProfileState.impersonating() = ImpersonatingProfileState;

  const factory ProfileState.impersonated(Profile profile) = ImpersonatedProfileState;

  const factory ProfileState.errorImpersonating(LocalizedError error) =
      ErrorImpersonatingProfileState;

  const factory ProfileState.reset() = ResetProfileState;
}
