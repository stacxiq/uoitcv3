import 'package:uoitc_new_app/core/networking/api_result.dart';
import 'package:uoitc_new_app/core/networking/error_handler.dart';
import 'package:uoitc_new_app/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:uoitc_new_app/features/auth/data/models/user.dart';
import 'package:uoitc_new_app/features/auth/data/models/user_request.dart';

class AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepository({
    required this.authRemoteDataSource,
  });
  Future<ApiResult<User>> login(UserRequest userRequest) async {
    try {
      final response = await authRemoteDataSource.login(userRequest);
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro));
    }
  }
}
