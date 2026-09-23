import 'package:freezed_annotation/freezed_annotation.dart';

part 'groups.freezed.dart';

@freezed
class Groups with _$Groups {
  const Groups._();

  const factory Groups({
    @Default([]) List<String> roles,
    @Default([]) List<String> specialities,
  }) = _Groups;
}
