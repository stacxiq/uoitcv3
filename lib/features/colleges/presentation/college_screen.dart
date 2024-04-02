import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:uoitc_new_app/core/extensions/extensions.dart';
import 'package:uoitc_new_app/core/routing/routes.dart';
import 'package:uoitc_new_app/core/shared/widgets/horizantol_spacing.dart';
import 'package:uoitc_new_app/core/shared/widgets/vertical_spacing.dart';
import 'package:uoitc_new_app/features/colleges/logic/college_bloc.dart';
import 'package:uoitc_new_app/features/colleges/logic/college_state.dart';

class CollegeScreen extends StatelessWidget {
  const CollegeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CollegeBloc, CollegeState>(
      builder: (context, state) {
        return state.when(
          initial: () {
            return Container();
          },
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          success: (colleges) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    fit: StackFit.loose,
                    children: [
                      Container(
                        height: 325.h,
                      ),
                      SizedBox(
                        height: 200.h,
                        width: double.infinity,
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: CachedNetworkImage(
                              imageUrl: colleges.utilities!
                                  .firstWhere(
                                    (element) =>
                                        element.property == 'uoitc_image',
                                  )
                                  .value),
                        ),
                      ),
                      Positioned(
                        top: 150.h,
                        right: 15.w,
                        left: 15.w,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 8.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              VerticalSpacing(height: 10.h),
                              Text(
                                colleges.utilities?[0].extraInformation ?? '',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontSize: 10.5.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const VerticalSpacing(height: 10),
                  AnimationLimiter(
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: colleges.colleges!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 750),
                          child: SlideAnimation(
                            verticalOffset: 50.0,
                            child: FadeInAnimation(
                                child: GestureDetector(
                              onTap: () {
                                context.pushNamed(
                                  Routes.collegeDetailScreen,
                                  arguments: colleges.colleges![index],
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 20.w, vertical: 10.h),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8.w, vertical: 8.h),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15.r),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 7,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 120.w,
                                      height: 150.h,
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            colleges.colleges![index].images,
                                      ),
                                    ),
                                    const HorizontalSpacing(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            colleges.colleges![index].title,
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                            ),
                                          ),
                                          VerticalSpacing(height: 10.h),
                                          Text(
                                            colleges
                                                .colleges![index].description,
                                            maxLines: 5,
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
          error: (e) => Center(
            child: Text('Error'),
          ),
        );
      },
    );
  }
}
