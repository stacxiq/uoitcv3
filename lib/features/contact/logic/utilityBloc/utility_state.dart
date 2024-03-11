
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uoitc_new_app/features/colleges/data/models/college.dart';

part 'utility_state.freezed.dart';

@freezed
class  UtilityState<T> with _$UtilityState<T> {
  const factory UtilityState.initial() = _Initial;
  
  const factory UtilityState.loading() = Loading;
  const factory UtilityState.success(List<Utility> data) = Success;
  const factory UtilityState.error({required String error}) = Error;
}