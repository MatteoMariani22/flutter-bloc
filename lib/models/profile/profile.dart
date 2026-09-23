import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter-bloc/models/user/user.dart';

part 'profile.freezed.dart';

@freezed
class Profile with _$Profile {
  const Profile._();

  const factory Profile({
    required String firstName,
    required String lastName,
    required String uuid,
    String? codiceAgenzia,
    String? commonName,
    String? domainComponent,
    String? email,
    String? fisHash,
    String? organizationalUnit,
    String? role,
    String? telephoneNumber,
    String? tipoAccesso,
    User? user,
    int? assetManager,
  }) = _Profile;
}
