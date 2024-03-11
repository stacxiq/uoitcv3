import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:uoitc_new_app/core/networking/dio_factory.dart';
import 'package:uoitc_new_app/features/update_employee/data/models/employee_form_request.dart';
import 'package:uoitc_new_app/features/update_employee/data/models/structure.dart';

abstract class StructureDataSource {
  Future<Structure> getStructure();
  Future updateEmploeeInfo(EmployeeFormRequest employeeFormRequest);
}

class StructureDataSourceImpl extends StructureDataSource {
  @override
  Future<Structure> getStructure() async {
    try {
      final requestData = {'operation': 'main_structure'};
      final response =
          await NetworkManager.dio.post('list.php', data: requestData);

      Map<String, dynamic> result = json.decode(response.data);

      Structure structure = Structure.fromJson(result);

      return structure;
    } on DioException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future updateEmploeeInfo(EmployeeFormRequest employeeFormRequest) async {
    try {
      final requestData = {
        'operation': 'update',
        'structure_id': employeeFormRequest.structureId,
        'department_id': employeeFormRequest.departmentId,
        'phone': employeeFormRequest.phone
      };
      final response =
          await NetworkManager.dio.post('list.php', data: requestData);
      return response;
    } on DioException catch (e) {
      throw Exception(e);
    }
  }
}
