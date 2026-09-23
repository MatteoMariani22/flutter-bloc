import 'package:freezed_annotation/freezed_annotation.dart';

part 'impersonation.freezed.dart';

@freezed
class Impersonation with _$Impersonation {
  const Impersonation._();

  const factory Impersonation({
    required String group,
    List<String>? specialities,
  }) = _Impersonation;
}
