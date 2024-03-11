import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:uoitc_new_app/core/networking/dio_factory.dart';
import 'package:uoitc_new_app/features/gallery/data/models/gallery.dart';

abstract class GalleryDataSource {
  Future<List<GalleryModel>> fetchGallery();
}

class GalleryDataSourceImpl implements GalleryDataSource {
  @override
  Future<List<GalleryModel>> fetchGallery() async {
    try {
      final requestData = {
        'operation': 'gallery',
      };
      final response =
          await NetworkManager.dio.post('gallery.php', data: requestData);

      Map<String, dynamic> result = json.decode(response.data);

      final galleryData = result["gallery"];

      List<GalleryModel> galleryList = [];
      for (var e in galleryData) {
        galleryList.add(GalleryModel.fromJson(e));
      }
      return galleryList;
    } on DioException catch (e) {
      throw Exception(e);
    }
  }
}
