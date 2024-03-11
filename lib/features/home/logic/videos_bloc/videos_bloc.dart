


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uoitc_new_app/features/home/data/models/video.dart';
import 'package:uoitc_new_app/features/home/data/repositories/videos_repository.dart';
import 'package:uoitc_new_app/features/home/logic/videos_bloc/videos_event.dart';
import 'package:uoitc_new_app/features/home/logic/videos_bloc/videos_state.dart';

class VideosBloc extends Bloc<VideosEvent, VideosState> {
  int page = 1;
  List<VideoModel> videos = [];
  final VideosRepository _videosRepository;
  VideosBloc(this._videosRepository) : super(const VideosState.loading()) {
    on<VideosEvent>((VideosEvent event, emit) async {
      await event.map(fetch: (_) async {
        emit(const VideosState.loading());

        final response = await _videosRepository.fetchVideos();
        page++;
        response.when(success: (data) {
          videos.addAll(data);
          emit(VideosState.success(videos));
        }, failure: (err) {
          emit(VideosState.error(error: err.apiErrorModel.message!));
        });
      });
    });
  }
}
