import 'package:uoitc_new_app/core/networking/api_result.dart';
import 'package:uoitc_new_app/core/networking/error_handler.dart';
import 'package:uoitc_new_app/features/colleges/data/datasource/college_remote_datasource.dart';
import 'package:uoitc_new_app/features/colleges/data/models/college.dart';

class CollegeRepository {
  final CollegeRemoteDataSource collegeRemoteDataSource;
  CollegeRepository({
    required this.collegeRemoteDataSource,
  });
  Future<ApiResult<Colleges>> fetchCollege() async {
    try {
      final response = await collegeRemoteDataSource.fetchCollegeData();
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro));
    }
  }
}
