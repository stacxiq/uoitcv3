import 'package:freezed_annotation/freezed_annotation.dart';

part 'gallery_event.freezed.dart';

@freezed

class GalleryEvent with _$GalleryEvent {
  const factory GalleryEvent.fetch() = _Fetch;  
}