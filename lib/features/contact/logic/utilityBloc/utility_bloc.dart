import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uoitc_new_app/features/colleges/data/models/college.dart';
import 'package:uoitc_new_app/features/contact/data/repositories/utilities_repository.dart';
import 'package:uoitc_new_app/features/contact/logic/utilityBloc/utility_event.dart';
import 'package:uoitc_new_app/features/contact/logic/utilityBloc/utility_state.dart';

class UtilityBloc extends Bloc<UtilityEvent, UtilityState> {
  List<Utility> utilityList = [];
  final UtilityRepository utilityRepository;
  UtilityBloc(this.utilityRepository) : super(const UtilityState.loading()) {
    on<UtilityEvent>((UtilityEvent event, emit) async {
      await event.map(fetch: (_) async {
        emit(const UtilityState.loading());

        final response = await utilityRepository.fetchUtility();
        
        response.when(success: (data) {
          utilityList.addAll(data);
          emit(UtilityState.success(utilityList));
        }, failure: (err) {
          emit(UtilityState.error(error: err.apiErrorModel.message!));
        });
      });
    });
  }
}
