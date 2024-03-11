import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uoitc_new_app/core/routing/routes.dart';
import 'package:uoitc_new_app/core/static/constant_app.dart';
import 'package:uoitc_new_app/features/update_employee/data/models/employee_form_request.dart';
import 'package:uoitc_new_app/features/update_employee/data/models/structure.dart';
import 'package:uoitc_new_app/features/update_employee/data/repository/structure_repository.dart';
import 'package:uoitc_new_app/features/update_employee/logic/structure_bloc/structure_event.dart';
import 'package:uoitc_new_app/features/update_employee/logic/structure_bloc/structure_state.dart';

class StructureBloc extends Bloc<StructureEvent, StructureState> {
  final StructureRepository _structureRepository;

  BehaviorSubject<List<SubStructure>> substructure =
      BehaviorSubject<List<SubStructure>>.seeded([]);
  BehaviorSubject<List<SubStructure>> activeSubstructure =
      BehaviorSubject<List<SubStructure>>.seeded([]);
  BehaviorSubject<List<MainStructure>> mainstructure =
      BehaviorSubject<List<MainStructure>>.seeded([]);
  SubStructure? activeSubStructure;
  MainStructure? activeMainStructure;
  StructureBloc(this._structureRepository)
      : super(
          const StructureState.loading(),
        ) {
    on<StructureEvent>(
      (StructureEvent event, emit) async {
        await event.map(
          fetch: (_) async {
            emit(
              const StructureState.loading(),
            );
            final response = await _structureRepository.getStructure();
            response.when(success: (data) {
              mainstructure.value = data.mainStructure!;
              substructure.value = data.subStructure!;
              emit(StructureState.success(data));
            }, failure: (err) {
              emit(StructureState.error(error: err.apiErrorModel.message!));
            });
          },
          selectMainStructure: (value) {
            activeSubstructure.value.clear();

            activeSubstructure.value = substructure.value
                .where(
                  (element) =>
                      element.structureId == value.mainStructure.structureId,
                )
                .toList();

            activeMainStructure = value.mainStructure;

            emit(StructureState.success(Structure(
                mainStructure: mainstructure.value,
                subStructure: activeSubstructure.value)));
          },
          selectSubStructure: (value) {
            activeSubStructure = value.mainStructure;
          },
          updateEmployeeInfo: (value) {
            EasyLoading.show();
            _structureRepository
                .updateEmployeeInfo(
              EmployeeFormRequest(
                structureId: activeMainStructure!.structureId,
                departmentId: activeSubStructure!.departmentId,
                phone: value.phone,
              ),
            )
                .then(
              (response) {
                EasyLoading.dismiss();
                response.when(
                  success: (data) {
                    navigatorKey.currentState?.pushNamedAndRemoveUntil(
                        Routes.homeScreen, (route) => false);
                  },
                  failure: (err) {
                    EasyLoading.dismiss();

                    emit(StructureState.error(
                        error: err.apiErrorModel.message!));
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
