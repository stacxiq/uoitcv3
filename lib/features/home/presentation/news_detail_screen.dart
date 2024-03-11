import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:uoitc_new_app/core/shared/widgets/vertical_spacing.dart';
import 'package:uoitc_new_app/core/static/colors.dart';
import 'package:uoitc_new_app/features/home/data/models/news.dart';

class NewsDetailScreen extends StatelessWidget {
  NewsDetailScreen({super.key, required this.news});

  final News news;

  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(news.section),
      ),
      body: Column(
        children: [
          Stack(
            fit: StackFit.loose,
            children: [
              SizedBox(
                height: 280.h,
                child: PageView.builder(
                  itemCount: news.images!.length,
                  controller: _pageController,
                  itemBuilder: (context, int index) {
                    return SizedBox(
                      width: double.infinity,
                      height: 280.h,
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: CachedNetworkImage(
                          imageUrl: news.images![index].path,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 20.h,
                child: SizedBox(
                  width: 375.w,
                  child: Center(
                    child: SizedBox(
                      height: 15.h,
                      child: SmoothPageIndicator(
                        controller: _pageController, // PageController
                        count: news.images!.length,
                        effect: WormEffect(
                          radius: 12.r,
                          dotHeight: 12.h,
                          dotWidth: 12.w,
                          activeDotColor: primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const VerticalSpacing(height: 15),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  news.title,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const VerticalSpacing(height: 10),
                Row(
                  children: [
                    Text(
                      '${news.section} - ',
                    ),
                    Text(
                      news.date.substring(0, 10),
                    ),
                  ],
                ),
                const VerticalSpacing(height: 0),
                SizedBox(
                  height: 280.h,
                  child: SingleChildScrollView(
                    child: Linkify(
                      text: news.content,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
