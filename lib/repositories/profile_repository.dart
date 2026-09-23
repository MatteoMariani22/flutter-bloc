import 'package:pine/pine.dart';

import 'package:flutter-bloc/models/profile/profile.dart';
import 'package:flutter-bloc/models/groups/groups.dart';
import 'package:flutter-bloc/models/impersonation/impersonation.dart';
import 'package:flutter-bloc/repositories/repository.dart';
import 'package:flutter-bloc/services/network/jto/profile/profile_jto.dart';
import 'package:flutter-bloc/services/network/jto/groups/groups_jto.dart';
import 'package:flutter-bloc/services/network/profile/profile_service.dart';
import 'package:flutter-bloc/services/network/requests/impersonation/impersonation_request.dart';

/// Abstract class of ProfileRepository
abstract class ProfileRepository {
  Future<Profile> profile();

  Future<Groups> groups();

  Future<Profile> impersonation(Impersonation impersonation);
}

/// Implementation of the base interface ProfileRepository
class ProfileRepositoryImpl extends Repository implements ProfileRepository {
  final ProfileService service;
  final DTOMapper<ProfileJTO, Profile> profileMapper;
  final DTOMapper<GroupsJTO, Groups> groupsMapper;
  final DTOMapper<ImpersonationRequest, Impersonation> impersonationMapper;

  const ProfileRepositoryImpl({
    required this.service,
    required this.profileMapper,
    required this.groupsMapper,
    required this.impersonationMapper,
    required super.talker,
  });

  @override
  Future<Profile> profile() => safeCode(() async {
        try {
          final response = await service.profile();

          return profileMapper.fromDTO(response);
        } catch (e, stackTrace) {
          talker.error(
            '[ProfileRepository] An error has occurred while performing profile',
            e,
            stackTrace,
          );

          rethrow;
        }
      });

  @override
  Future<Groups> groups() => safeCode(() async {
        try {
          final response = await service.groups();

          return groupsMapper.fromDTO(response);
        } catch (e, stackTrace) {
          talker.error(
            '[ProfileRepository] An error has occurred while performing groups',
            e,
            stackTrace,
          );

          rethrow;
        }
      });

  @override
  Future<Profile> impersonation(Impersonation impersonation) => safeCode(() async {
        try {
          final response = await service.impersonation(impersonationMapper.toDTO(impersonation));

          return profileMapper.fromDTO(response);
        } catch (e, stackTrace) {
          talker.error(
            '[ProfileRepository] An error has occurred while performing impersonation',
            e,
            stackTrace,
          );

          rethrow;
        }
      });
}
