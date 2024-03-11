import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uoitc_new_app/features/update_employee/data/models/structure.dart';

part 'structure_event.freezed.dart';

@freezed
class StructureEvent with _$StructureEvent {
  const factory StructureEvent.fetch() = _Fetch;
  const factory StructureEvent.selectMainStructure(
      MainStructure mainStructure) = _SelectMainStructure;
  const factory StructureEvent.selectSubStructure(SubStructure mainStructure) =
      _SelectSubStructure;
  const factory StructureEvent.updateEmployeeInfo(String phone) =
      _updateEmployeeInfo;
}
