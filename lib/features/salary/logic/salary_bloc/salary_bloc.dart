import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uoitc_new_app/features/salary/data/repositories/salary_repository.dart';
import 'package:uoitc_new_app/features/salary/logic/salary_bloc/salary_event.dart';
import 'package:uoitc_new_app/features/salary/logic/salary_bloc/salary_state.dart';

class SalaryBloc extends Bloc<SalaryEvent, SalaryState> {
  final SalaryRepository _salaryRepository;
  SalaryBloc(this._salaryRepository) : super(const SalaryState.loading()) {
    on<SalaryEvent>((SalaryEvent event, emit) async {
      await event.map(fetch: (_) async {
        emit(const SalaryState.loading());

        final response = await _salaryRepository.fetchSalary();

        response.when(success: (data) {
          emit(SalaryState.success(data));
        }, failure: (err) {
          emit(SalaryState.error(error: err.apiErrorModel.message!));
        });
      });
    });
  }
}
