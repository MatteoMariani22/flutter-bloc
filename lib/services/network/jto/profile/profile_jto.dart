import 'package:pine/pine.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter-bloc/services/network/jto/user/user_jto.dart';

part 'profile_jto.g.dart';

part 'profile_jto.freezed.dart';

@freezed
class ProfileJTO extends DTO with _$ProfileJTO {
  const factory ProfileJTO({
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
    UserJTO? user,
    int? assetManager,
  }) = _ProfileJTO;

  factory ProfileJTO.fromJson(Map<String, dynamic> json) => _$ProfileJTOFromJson(json);
}
