import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uoitc_new_app/features/update_employee/data/models/structure.dart';
part 'structure_state.freezed.dart';

@freezed
class StructureState with _$StructureState {
  const factory StructureState.initial() = _Initial;
  const factory StructureState.loading() = Loading;
  const factory StructureState.success(Structure structure) = Success;
  const factory StructureState.error({required String error}) = Error;
}
