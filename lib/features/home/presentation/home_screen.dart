import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:iconly/iconly.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart' as intl;
import 'package:uoitc_new_app/core/extensions/extensions.dart';
import 'package:uoitc_new_app/core/routing/routes.dart';
import 'package:uoitc_new_app/core/services/authservice/auth_service.dart';
import 'package:uoitc_new_app/core/shared/functions/launcher_function.dart';
import 'package:uoitc_new_app/core/shared/functions/section_image_function.dart';
import 'package:uoitc_new_app/core/shared/widgets/horizantol_spacing.dart';
import 'package:uoitc_new_app/core/shared/widgets/vertical_spacing.dart';
import 'package:uoitc_new_app/core/static/colors.dart';
// ignore: library_prefixes
import 'package:uoitc_new_app/features/home/data/models/news.dart' as newsModel;
import 'package:uoitc_new_app/features/home/logic/news_bloc/news_bloc.dart';
import 'package:uoitc_new_app/features/home/logic/news_bloc/news_state.dart';
import 'package:uoitc_new_app/features/home/logic/videos_bloc/videos_bloc.dart';
import 'package:uoitc_new_app/features/home/logic/videos_bloc/videos_state.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  var box = Hive.box('authBox');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(right: 30.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VerticalSpacing(
                    height: 15,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 12.0.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 51.w,
                              height: 51.h,
                              child: Image.asset(
                                'uoitc.png'.imagePath(),
                              ),
                            ),
                            const HorizontalSpacing(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AuthService.impl().getUsername(),
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                    color: HexColor.fromHex(
                                      '#19202D',
                                    ),
                                  ),
                                ),
                                const VerticalSpacing(height: 0),
                                Text(
                                  intl.DateFormat(
                                          intl.DateFormat
                                              .ABBR_MONTH_WEEKDAY_DAY,
                                          'ar')
                                      .format(
                                    DateTime.now(),
                                  ),
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: HexColor.fromHex(
                                      '#9397A0',
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        Visibility(
                          visible: !AuthService.impl().isAuthenticated(),
                          replacement: GestureDetector(
                            onTap: () {
                              context.pushNamed(
                                Routes.salaryScreen,
                              );
                            },
                            child: Container(
                              height: 45.h,
                              width: 45.w,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Icon(
                                  FontAwesomeIcons.dollarSign,
                                  color: primaryColor,
                                  size: 22.h,
                                ),
                              ),
                            ),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              context.pushNamed(
                                Routes.loginScreen,
                              );
                            },
                            child: Container(
                              height: 45.h,
                              width: 45.w,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Icon(
                                  IconlyBold.login,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const VerticalSpacing(height: 30),
                  Container(
                    decoration: BoxDecoration(
                      color: HexColor.fromHex('#FFFFFF'),
                      borderRadius: BorderRadius.circular(15.r),
                      border: Border.all(
                        color: Colors.grey.shade300.withOpacity(.4),
                      ),
                    ),
                    height: 50.h,
                    margin: EdgeInsets.only(left: 30.w),
                    padding: EdgeInsets.only(right: 13.w),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'بحث عن خبر ...',
                              hintStyle: TextStyle(
                                fontSize: 12.sp,
                                color: HexColor.fromHex(
                                  '#A7A7A7',
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 49.h,
                          width: 47.w,
                          decoration: BoxDecoration(
                              color: HexColor.fromHex('#5474FD'),
                              borderRadius: BorderRadius.circular(15.r)),
                          child: SizedBox(
                            width: 28.w,
                            height: 28.h,
                            child: Center(
                              child: SvgPicture.asset(
                                'assets/svg/search.svg',
                                width: 28.w,
                                height: 28.h,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const VerticalSpacing(height: 30),
                  Padding(
                    padding: EdgeInsets.only(left: 18.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'اخر الاخبار',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: HexColor.fromHex(
                              '#19202D',
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.pushNamed(Routes.allNewsScreen);
                          },
                          child: Text(
                            'عرض المزيد',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: HexColor.fromHex(
                                '#9397A0',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const VerticalSpacing(height: 10),
                  BlocBuilder<NewsBloc, NewsState>(
                    builder: (context, state) {
                      return state.when(initial: () {
                        return Container();
                      }, loading: () {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }, success: (data) {
                        List<newsModel.News> news = data;
                        return SizedBox(
                          height: 320.h,
                          child: ListView.builder(
                            clipBehavior: Clip.none,
                            scrollDirection: Axis.horizontal,
                            itemCount: news.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  context.pushNamed(
                                    Routes.newsDetailScreen,
                                    arguments: news[index],
                                  );
                                },
                                child: Container(
                                  height: 304.h,
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
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 185.h,
                                        width: 231.w,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(25.r),
                                          child: FittedBox(
                                            fit: BoxFit.cover,
                                            child: Image.network(
                                              news[index].images!.first.path,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const VerticalSpacing(height: 10),
                                      SizedBox(
                                        height: 36.h,
                                        child: Text(
                                          news[index].title,
                                          maxLines: 2,
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.bold,
                                            color: HexColor.fromHex(
                                              '#19202D',
                                            ),
                                          ),
                                        ),
                                      ),
                                      const VerticalSpacing(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 20.r,
                                                foregroundColor: Colors.white,
                                                backgroundColor: Colors.white,
                                                backgroundImage: AssetImage(
                                                  getSectionImage(
                                                    news[index].section,
                                                  ),
                                                ),
                                              ),
                                              const HorizontalSpacing(
                                                  width: 12),
                                              SizedBox(
                                                width: 140.w,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      news[index].section,
                                                      maxLines: 2,
                                                      style: TextStyle(
                                                        fontSize: 10.sp,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        color: HexColor.fromHex(
                                                          '#19202D',
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      intl.DateFormat(
                                                              intl.DateFormat
                                                                  .ABBR_MONTH_WEEKDAY_DAY,
                                                              'ar')
                                                          .format(
                                                        DateTime.parse(
                                                          news[index]
                                                              .date
                                                              .substring(0, 10),
                                                        ),
                                                      ),
                                                      style: TextStyle(
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: HexColor.fromHex(
                                                          '#9397A0',
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          Container(
                                            width: 37.w,
                                            height: 37.h,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12.r),
                                              color: HexColor.fromHex(
                                                '#EFF5F4',
                                              ),
                                            ),
                                            child: Center(
                                              child: Icon(
                                                Icons.share,
                                                color:
                                                    HexColor.fromHex('#5474FD'),
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }, error: (String error) {
                        return Container();
                      });
                    },
                  ),
                  const VerticalSpacing(height: 30),
                  Padding(
                    padding: EdgeInsets.only(left: 18.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'اخر الفيديوهات',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: HexColor.fromHex(
                              '#19202D',
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.pushNamed(Routes.videosScreen);
                          },
                          child: Text(
                            'عرض المزيد',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: HexColor.fromHex(
                                '#9397A0',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const VerticalSpacing(height: 10),
                  BlocBuilder<VideosBloc, VideosState>(
                    builder: (context, state) {
                      return state.when(initial: () {
                        return Container();
                      }, loading: () {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }, success: (videos) {
                        return SizedBox(
                          height: 120.h,
                          child: ListView.builder(
                            clipBehavior: Clip.none,
                            scrollDirection: Axis.horizontal,
                            itemCount: videos.length > 6 ? 6 : videos.length,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        fit: StackFit.loose,
                                        children: [
                                          SizedBox(
                                            height: 100.h,
                                            width: 110.w,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(25.r),
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
                                              color:
                                                  Colors.black.withOpacity(.15),
                                              borderRadius:
                                                  BorderRadius.circular(25.r),
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const VerticalSpacing(height: 10),
                                            Text(
                                              videos[index].title,
                                              maxLines: 3,
                                              textAlign: TextAlign.right,
                                              textDirection: TextDirection.rtl,
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
                                              intl.DateFormat(
                                                      intl.DateFormat
                                                          .ABBR_MONTH_WEEKDAY_DAY,
                                                      'ar')
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
                          ),
                        );
                      }, error: (String error) {
                        return Container();
                      });
                    },
                  ),
                  const VerticalSpacing(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
