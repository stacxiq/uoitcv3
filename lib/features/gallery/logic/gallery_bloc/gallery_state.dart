



import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uoitc_new_app/features/gallery/data/models/gallery.dart';

part 'gallery_state.freezed.dart';
@freezed
class  GalleryState<T> with _$GalleryState<T> {
  const factory GalleryState.initial() = _Initial;
  
  const factory GalleryState.loading() = Loading;
  const factory GalleryState.success(List<GalleryModel> data) = Success;
  const factory GalleryState.error({required String error}) = Error;
}