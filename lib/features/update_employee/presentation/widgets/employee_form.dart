import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:uoitc_new_app/core/shared/widgets/vertical_spacing.dart';
import 'package:uoitc_new_app/core/static/colors.dart';
import 'package:uoitc_new_app/features/update_employee/data/models/structure.dart';
import 'package:uoitc_new_app/features/update_employee/logic/structure_bloc/structure_bloc.dart';
import 'package:uoitc_new_app/features/update_employee/logic/structure_bloc/structure_event.dart';
import 'package:uoitc_new_app/features/update_employee/logic/structure_bloc/structure_state.dart';

class EmployeeForm extends StatefulWidget {
  const EmployeeForm({super.key});

  @override
  State<EmployeeForm> createState() => _EmployeeFormState();
}

class _EmployeeFormState extends State<EmployeeForm> {
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 550.h,
      width: size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          15.r,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 20,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Column(
          children: [
            const VerticalSpacing(height: 30),
            SizedBox(
              height: 150.h,
              width: 150.w,
              child: Image.asset('assets/images/uoitc.png'),
            ),
            const VerticalSpacing(height: 35),
            SizedBox(
              height: 60.h,
              child: BlocBuilder<StructureBloc, StructureState>(
                builder: (context, state) {
                  return state.when(
                    initial: () {
                      return Container();
                    },
                    loading: () {
                      return Container();
                    },
                    success: (data) {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade400,
                          ),
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        padding: EdgeInsets.all(4.w),
                        child: DropdownSearch<MainStructure>(
                          items: data.mainStructure!.reversed.toList(),
                          itemAsString: (item) =>
                              item.title..replaceAll(RegExp('[^A-Za-z]'), ''),
                          dropdownDecoratorProps: const DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              hintText: "التشكيل",
                            ),
                          ),
                          onChanged: (value) {
                            context.read<StructureBloc>().add(
                                  StructureEvent.selectMainStructure(
                                    value!,
                                  ),
                                );
                          },
                        ),
                      );
                    },
                    error: (error) {
                      return Container();
                    },
                  );
                },
              ),
            ),
            const VerticalSpacing(height: 15),
            SizedBox(
              height: 60.h,
              child: BlocBuilder<StructureBloc, StructureState>(
                builder: (context, state) {
                  return state.when(initial: () {
                    return Container();
                  }, loading: () {
                    return Container();
                  }, success: (data) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade400,
                        ),
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      padding: EdgeInsets.all(4.w),
                      child: DropdownSearch<SubStructure>(
                        items: context
                            .read<StructureBloc>()
                            .activeSubstructure
                            .value
                            .reversed
                            .toList(),
                        itemAsString: (item) =>
                            item.title..replaceAll(RegExp('[^A-Za-z]'), ''),
                        dropdownDecoratorProps: const DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                            hintText: "التشكيل الفرعي",
                          ),
                        ),
                        onChanged: (value) {
                          context.read<StructureBloc>().add(
                                StructureEvent.selectSubStructure(
                                  value!,
                                ),
                              );
                        },
                      ),
                    );
                  }, error: (error) {
                    return Container();
                  });
                },
              ),
            ),
            const VerticalSpacing(height: 15),
            SizedBox(
              height: 60.h,
              child: TextFormField(
                controller: phoneController,
                decoration: InputDecoration(
                  hintText: 'رقم الهاتف',
                  prefixIcon: Icon(
                    IconlyBroken.call,
                    color: primaryColor,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      10.r,
                    ),
                  ),
                ),
                keyboardType: TextInputType.phone,
              ),
            ),
            const VerticalSpacing(height: 40),
            SizedBox(
              width: size.width,
              height: size.height * 0.06,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      10.r,
                    ),
                  ),
                ),
                onPressed: () {
                  if (phoneController.text.length != 11) {
                    EasyLoading.showError('رقم الهاتف غير صالح');
                  } else {
                    context.read<StructureBloc>().add(
                          StructureEvent.updateEmployeeInfo(
                              phoneController.text),
                        );
                  }
                },
                child: Text(
                  'تحديث البيانات',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
