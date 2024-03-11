
import 'package:dio/dio.dart';
import 'package:uoitc_new_app/core/networking/api_result.dart';
import 'package:uoitc_new_app/core/networking/error_handler.dart';
import 'package:uoitc_new_app/features/update_employee/data/datasource/structure_data_source.dart';
import 'package:uoitc_new_app/features/update_employee/data/models/employee_form_request.dart';
import 'package:uoitc_new_app/features/update_employee/data/models/structure.dart';

class StructureRepository {
  final StructureDataSource remoteDataSource;

  StructureRepository({required this.remoteDataSource});

  Future<ApiResult<Structure>> getStructure() async {
    try {
      final structure = await remoteDataSource.getStructure();
      return ApiResult.success(structure);
    } catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro));
    }
  }
  Future<ApiResult<Response>> updateEmployeeInfo(EmployeeFormRequest employeeFormRequest) async {
    try {
      final response = await remoteDataSource.updateEmploeeInfo(employeeFormRequest);
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro));
    }
  }
}