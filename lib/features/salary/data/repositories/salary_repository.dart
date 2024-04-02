import 'package:uoitc_new_app/core/networking/api_result.dart';
import 'package:uoitc_new_app/core/networking/error_handler.dart';
import 'package:uoitc_new_app/features/salary/data/datasource/salary_remote_datasource.dart';
import 'package:uoitc_new_app/features/salary/data/models/salary.dart';

class SalaryRepository {
  final SalaryRemoteDataSource salaryRemoteDataSource;
  SalaryRepository({
    required this.salaryRemoteDataSource,
  });
  Future<ApiResult<Salary>> fetchSalary() async {
    try {
      final response = await salaryRemoteDataSource.getSalary();
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro));
    }
  }
}
