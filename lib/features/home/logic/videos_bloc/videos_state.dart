
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uoitc_new_app/features/home/data/models/video.dart';
part 'videos_state.freezed.dart';

@freezed
class  VideosState<T> with _$VideosState<T> {
  const factory VideosState.initial() = _Initial;
  
  const factory VideosState.loading() = Loading;
  const factory VideosState.success(List<VideoModel> data) = Success;
  const factory VideosState.error({required String error}) = Error;
}