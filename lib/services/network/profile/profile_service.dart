import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:flutter-bloc/services/network/jto/profile/profile_jto.dart';
import 'package:flutter-bloc/services/network/jto/groups/groups_jto.dart';
import 'package:flutter-bloc/services/network/requests/impersonation/impersonation_request.dart';

part 'profile_service.g.dart';

/// Abstract class of ProfileService
@RestApi()
abstract class ProfileService {
  factory ProfileService(Dio dio, {String baseUrl}) = _ProfileService;

  @GET('/profile/myprofile')
  Future<ProfileJTO> profile();

  @GET('/profile/mygroups')
  Future<GroupsJTO> groups();

  @POST('/profile/myimpersonation')
  Future<ProfileJTO> impersonation(@Body() ImpersonationRequest impersonationRequest);
}
