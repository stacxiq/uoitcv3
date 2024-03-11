import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ArtCardWidget extends StatelessWidget {
  final String title, description, image;

  const ArtCardWidget({
    required this.title,
    required this.description,
    required this.image,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Column(
            children: [
              SizedBox(height: 15.h),
              Expanded(
                child: buildImage(image: image),
              ),
              const SizedBox(height: 4),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
              ),
              const SizedBox(height: 10),
              Text(
                DateFormat(DateFormat.ABBR_MONTH_WEEKDAY_DAY, 'ar').format(
                  DateTime.parse(
                    description.substring(0, 10),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      );

  Widget buildImage({required String image}) => Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          child: FittedBox(
            fit: BoxFit.cover,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: image,
            ),
          ),
        ),
      );
}
