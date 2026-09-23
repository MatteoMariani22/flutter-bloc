import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pine/dto/dto.dart';

part 'impersonation_request.g.dart';

part 'impersonation_request.freezed.dart';

@freezed
class ImpersonationRequest extends DTO with _$ImpersonationRequest {
  const factory ImpersonationRequest({
    required String group,
    List<String>? specialities,
  }) = _ImpersonationRequest;

  factory ImpersonationRequest.fromJson(Map<String, dynamic> json) =>
      _$ImpersonationRequestFromJson(json);
}
