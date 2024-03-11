import 'package:uoitc_new_app/core/networking/api_result.dart';
import 'package:uoitc_new_app/core/networking/error_handler.dart';
import 'package:uoitc_new_app/features/gallery/data/datasource/gallery_datasource.dart';
import 'package:uoitc_new_app/features/gallery/data/models/gallery.dart';

class GalleryRepository {
  final GalleryDataSource galleryDataSource;
  GalleryRepository({
    required this.galleryDataSource,
  });
  Future<ApiResult<List<GalleryModel>>> fetchGallery() async {
    try {
      final response = await galleryDataSource.fetchGallery();
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro));
    }
  }
}
