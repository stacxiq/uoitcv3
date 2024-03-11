import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uoitc_new_app/core/shared/widgets/vertical_spacing.dart';
import 'package:uoitc_new_app/core/static/colors.dart';
import 'package:uoitc_new_app/features/colleges/data/models/college.dart';

// ignore: must_be_immutable
class CollegeDetailScreen extends StatelessWidget {
  final College college;
  CollegeDetailScreen({super.key, required this.college});
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    List locations = college.location.split(',');
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(college.title),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 140.h,
                  child: CachedNetworkImage(
                    imageUrl: college.images,
                    fit: BoxFit.cover,
                  ),
                ),
                const VerticalSpacing(height: 15),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 80.h,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            stops: const [0.25, 1],
                            colors: [
                              primaryColor,
                              primaryColor.withOpacity(.4),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(
                            10.r,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 14.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'تآسست',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const VerticalSpacing(height: 5),
                                Text(
                                  college.year,
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'نوع الدراسة',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const VerticalSpacing(height: 5),
                                Text(
                                  college.isEvening,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const VerticalSpacing(height: 10),
                      const TabBar(
                        tabs: [
                          Tab(
                            text: 'التفاصيل',
                          ),
                          Tab(
                            text: 'الموقع',
                          ),
                        ],
                      ),
                      const VerticalSpacing(height: 10),
                      SizedBox(
                        height: 160.h,
                        child: TabBarView(
                          children: [
                            Text(
                              college.description,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.2,
                              child: GoogleMap(
                                mapType: MapType.normal,
                                myLocationEnabled: true,
                                initialCameraPosition: CameraPosition(
                                    target: LatLng(double.parse(locations[0]),
                                        double.parse(locations[1])),
                                    zoom: 13),
                                onMapCreated: (GoogleMapController controller) {
                                  _controller.complete(controller);
                                },
                                markers: {
                                  Marker(
                                    markerId: const MarkerId('newyork1'),
                                    position: LatLng(double.parse(locations[0]),
                                        double.parse(locations[1])),
                                    infoWindow:
                                        InfoWindow(title: college.title),
                                  ),
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: college.departments!.length,
                          itemBuilder: (context, index) {
                            return ExpansionTile(
                              collapsedBackgroundColor: Colors.white,
                              tilePadding: EdgeInsets.symmetric(
                                  horizontal: 6.w, vertical: 6.h),
                              title: Text(
                                college.departments![index].title,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              children: <Widget>[
                                Text(
                                  college.departments![index].description,
                                  textAlign: TextAlign.justify,
                                )
                              ],
                            );
                          }),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
