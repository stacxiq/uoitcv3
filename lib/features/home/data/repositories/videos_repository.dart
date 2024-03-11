


import 'package:uoitc_new_app/core/networking/api_result.dart';
import 'package:uoitc_new_app/core/networking/error_handler.dart';
import 'package:uoitc_new_app/features/home/data/datasource/video_data_source.dart';
import 'package:uoitc_new_app/features/home/data/models/video.dart';

class VideosRepository {
  final VideosDataSource videosDataSource;
  VideosRepository({
    required this.videosDataSource,
  });
  Future<ApiResult<List<VideoModel>>> fetchVideos() async {
    try {
      final response = await videosDataSource.getVideos();
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro));
    }
  }
}