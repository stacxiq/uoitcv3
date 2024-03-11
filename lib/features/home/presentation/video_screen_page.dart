import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:uoitc_new_app/core/extensions/extensions.dart';
import 'package:uoitc_new_app/core/shared/functions/launcher_function.dart';
import 'package:uoitc_new_app/core/shared/widgets/horizantol_spacing.dart';
import 'package:uoitc_new_app/core/shared/widgets/vertical_spacing.dart';
import 'package:uoitc_new_app/features/home/logic/videos_bloc/videos_bloc.dart';
import 'package:uoitc_new_app/features/home/logic/videos_bloc/videos_state.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('قائمة الفيدوهات'),
      ),
      body: BlocBuilder<VideosBloc, VideosState>(
        builder: (context, state) {
          return state.when(initial: () {
            return Container();
          }, loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }, success: (videos) {
            return ListView.builder(
              clipBehavior: Clip.none,
              itemCount: videos.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    launchInBrowser(videos[index].url);
                  },
                  child: Container(
                    height: 120.h,
                    width: 255.w,
                    margin: EdgeInsets.only(left: 20.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        20.r,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: HexColor.fromHex(
                            '#000000',
                          ).withOpacity(.1),
                          blurRadius: 1,
                          spreadRadius: 0,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 12.h,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          fit: StackFit.loose,
                          children: [
                            SizedBox(
                              height: 100.h,
                              width: 110.w,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25.r),
                                child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: Image.network(
                                    videos[index].image,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 100.h,
                              width: 110.w,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(.15),
                                borderRadius: BorderRadius.circular(25.r),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                width: 110.w,
                                height: 20.h,
                                child: SvgPicture.asset(
                                  'assets/svg/play.svg',
                                ),
                              ),
                            )
                          ],
                        ),
                        const HorizontalSpacing(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const VerticalSpacing(height: 10),
                              Text(
                                videos[index].title,
                                maxLines: 3,
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 12.5.sp,
                                  wordSpacing: 2.sp,
                                  fontWeight: FontWeight.bold,
                                  color: HexColor.fromHex(
                                    '#19202D',
                                  ),
                                ),
                              ),
                              const VerticalSpacing(height: 5),
                              Text(
                                DateFormat(
                                        DateFormat.ABBR_MONTH_WEEKDAY_DAY, 'ar')
                                    .format(videos[index].date!),
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.normal,
                                  color: HexColor.fromHex(
                                    '#9397A0',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }, error: (String error) {
            return Container();
          });
        },
      ),
    );
  }
}
