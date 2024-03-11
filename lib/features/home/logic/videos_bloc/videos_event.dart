import 'package:freezed_annotation/freezed_annotation.dart';

part 'videos_event.freezed.dart';

@freezed
class VideosEvent with _$VideosEvent {
  const factory VideosEvent.fetch() = _Fetch;  
}