import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uoitc_new_app/core/extensions/extensions.dart';
import 'package:uoitc_new_app/core/routing/routes.dart';
import 'package:uoitc_new_app/core/shared/functions/section_image_function.dart';
import 'package:uoitc_new_app/core/shared/widgets/horizantol_spacing.dart';
import 'package:uoitc_new_app/core/shared/widgets/vertical_spacing.dart';
import 'package:uoitc_new_app/features/home/logic/news_bloc/news_bloc.dart';
import 'package:uoitc_new_app/features/home/logic/news_bloc/news_event.dart';
import 'package:uoitc_new_app/features/home/logic/news_bloc/news_state.dart';
import 'package:uoitc_new_app/features/home/data/models/news.dart' as newsModel;
import 'package:intl/intl.dart' as intl;

class NewsScreen extends StatefulWidget {
  NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        // here
        BlocProvider.of<NewsBloc>(context).add(NewsEvent.fetchMore());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('قائمة الاخبار'),
        ),
        body: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            return state.when(initial: () {
              return Container();
            }, loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }, success: (data) {
              List<newsModel.News> news = data;
              return ListView.builder(
                clipBehavior: Clip.none,
                itemCount: news.length,
                controller: _scrollController,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      context.pushNamed(
                        Routes.newsDetailScreen,
                        arguments: news[index],
                      );
                    },
                    child: Container(
                      height: 344.h,
                      width: 255.w,
                      margin: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 6.h,
                      ),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 220.h,
                            width: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25.r),
                              child: FittedBox(
                                fit: BoxFit.fill,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  const HorizontalSpacing(width: 12),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        news[index].section,
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w900,
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
                                            news[index].date.substring(0, 10),
                                          ),
                                        ),
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.normal,
                                          color: HexColor.fromHex(
                                            '#9397A0',
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                width: 37.w,
                                height: 37.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.r),
                                  color: HexColor.fromHex(
                                    '#EFF5F4',
                                  ),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.share,
                                    color: HexColor.fromHex('#5474FD'),
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
              );
            }, error: (String error) {
              return Container();
            });
          },
        ));
  }
}
