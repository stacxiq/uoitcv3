
import 'package:uoitc_new_app/core/networking/api_result.dart';
import 'package:uoitc_new_app/core/networking/error_handler.dart';
import 'package:uoitc_new_app/features/colleges/data/models/college.dart';
import 'package:uoitc_new_app/features/contact/data/datasource/utility_remote_data_source.dart';
import 'package:uoitc_new_app/features/gallery/data/models/gallery.dart';

class UtilityRepository {
  final UtiliyRemoteDataSource utiliyRemoteDataSource;
  UtilityRepository({
    required this.utiliyRemoteDataSource,
  });
  Future<ApiResult<List<Utility>>> fetchUtility() async {
    try {
      final response = await utiliyRemoteDataSource.fetchUtilities();
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro));
    }
  }


}