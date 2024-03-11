import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:uoitc_new_app/core/networking/dio_factory.dart';
import 'package:uoitc_new_app/features/home/data/models/video.dart';

abstract class VideosDataSource {
  Future<List<VideoModel>> getVideos();
}

class VideosDataSourceImpl implements VideosDataSource {
  @override
  Future<List<VideoModel>> getVideos() async {
    try {
      final requestData = {
        'operation': 'video',
      };
      final response = await NetworkManager.dio
          .post('video.php', queryParameters: requestData);

      Map<String, dynamic> result = json.decode(response.data);

      final videosData = result["video"];

      List<VideoModel> videosList = [];
      for (var e in videosData) {
        videosList.add(VideoModel.fromJson(e));
      }
      return videosList;
    } on DioException catch (e) {
      throw Exception(e);
    }
  }
}
