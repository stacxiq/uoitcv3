


import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uoitc_new_app/features/salary/data/models/salary.dart';
part 'salary_state.freezed.dart';
@freezed
class  SalaryState<T> with _$SalaryState<T> {
  const factory SalaryState.initial() = _Initial;
  
  const factory SalaryState.loading() = Loading;
  const factory SalaryState.success(Salary salary) = Success;
  const factory SalaryState.error({required String error}) = Error;
}