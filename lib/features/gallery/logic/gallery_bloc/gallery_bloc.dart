import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uoitc_new_app/features/gallery/data/models/gallery.dart';
import 'package:uoitc_new_app/features/gallery/data/repositories/gallery_repository.dart';
import 'package:uoitc_new_app/features/gallery/logic/gallery_bloc/gallery_event.dart';
import 'package:uoitc_new_app/features/gallery/logic/gallery_bloc/gallery_state.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  List<GalleryModel> galleryList = [];
  final GalleryRepository _galleryRepository;
  GalleryBloc(this._galleryRepository) : super(const GalleryState.loading()) {
    on<GalleryEvent>((GalleryEvent event, emit) async {
      await event.map(fetch: (_) async {
        emit(const GalleryState.loading());

        final response = await _galleryRepository.fetchGallery();
        
        response.when(success: (data) {
          galleryList.addAll(data);
          emit(GalleryState.success(galleryList));
        }, failure: (err) {
          emit(GalleryState.error(error: err.apiErrorModel.message!));
        });
      });
    });
  }
}
