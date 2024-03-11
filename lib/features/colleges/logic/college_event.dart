
import 'package:freezed_annotation/freezed_annotation.dart';

part 'college_event.freezed.dart';

@freezed

class CollegeEvent with _$CollegeEvent {
  const factory CollegeEvent.fetch() = _Fetch;  
}