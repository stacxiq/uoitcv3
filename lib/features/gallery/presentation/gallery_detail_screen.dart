import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uoitc_new_app/core/extensions/extensions.dart';
import 'package:uoitc_new_app/features/gallery/data/models/gallery.dart';

class GalleryDetailScreen extends StatelessWidget {
  final GalleryModel galleryModel;
  const GalleryDetailScreen({super.key, required this.galleryModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CarouselSlider.builder(
            itemCount: galleryModel.images!.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return FittedBox(
                fit: BoxFit.cover,
                child: CachedNetworkImage(
                  imageUrl: galleryModel.images![index].path,
                ),
              );
            },
            options: CarouselOptions(
              enableInfiniteScroll: true,
              autoPlay: true,
              viewportFraction: 1,
              height: MediaQuery.of(context).size.height,
              enlargeCenterPage: false,
              onPageChanged: (index, reason) {},
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(
                .2,
              ),
            ),
          ),
          Positioned(
            top: 60.h,
            right: 20.w,
            child: GestureDetector(
              onTap: () {
                context.pop();
              },
              child: Container(
                width: 45.w,
                height: 45.h,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.38999998569488525),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Center(
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 18.h,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
