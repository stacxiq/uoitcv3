import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uoitc_new_app/features/colleges/data/repositories/colleges_repository.dart';
import 'package:uoitc_new_app/features/colleges/logic/college_event.dart';
import 'package:uoitc_new_app/features/colleges/logic/college_state.dart';

class CollegeBloc extends Bloc<CollegeEvent, CollegeState> {
  final CollegeRepository collegeRepository;
  CollegeBloc(this.collegeRepository) : super(const CollegeState.loading()) {
    on<CollegeEvent>((CollegeEvent event, emit) async {
      await event.map(fetch: (_) async {
        emit(const CollegeState.loading());

        final response = await collegeRepository.fetchCollege();

        response.when(success: (data) {
          emit(CollegeState.success(data));
        }, failure: (err) {
          emit(CollegeState.error(error: err.apiErrorModel.message!));
        });
      });
    });
  }
}
