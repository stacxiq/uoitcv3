
import 'package:freezed_annotation/freezed_annotation.dart';

part 'utility_event.freezed.dart';

@freezed
class UtilityEvent with _$UtilityEvent {
  const factory UtilityEvent.fetch() = _Fetch;  
}