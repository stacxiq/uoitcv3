

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uoitc_new_app/features/colleges/data/models/college.dart';

part 'college_state.freezed.dart';
@freezed
class  CollegeState<T> with _$CollegeState<T> {
  const factory CollegeState.initial() = _Initial;
  
  const factory CollegeState.loading() = Loading;
  const factory CollegeState.success(Colleges college) = Success;
  const factory CollegeState.error({required String error}) = Error;
}