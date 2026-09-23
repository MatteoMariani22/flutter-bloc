import 'package:pine/dto/dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'groups_jto.g.dart';

part 'groups_jto.freezed.dart';

@freezed
class GroupsJTO extends DTO with _$GroupsJTO {
  const factory GroupsJTO({
    @Default([]) List<String> roles,
    @Default([]) List<String> specialities,
  }) = _GroupsJTO;

  factory GroupsJTO.fromJson(Map<String, dynamic> json) =>
      _$GroupsJTOFromJson(json);
}
