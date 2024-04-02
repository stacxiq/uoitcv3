
import 'package:freezed_annotation/freezed_annotation.dart';

part 'salary_event.freezed.dart';

@freezed
class SalaryEvent with _$SalaryEvent {
  const factory SalaryEvent.fetch() = _Fetch;  
}