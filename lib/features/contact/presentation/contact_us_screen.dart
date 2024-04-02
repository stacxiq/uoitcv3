import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uoitc_new_app/core/shared/functions/launcher_function.dart';
import 'package:uoitc_new_app/core/shared/widgets/vertical_spacing.dart';
import 'package:uoitc_new_app/features/colleges/data/models/college.dart';
import 'package:uoitc_new_app/features/contact/logic/utilityBloc/utility_bloc.dart';
import 'package:uoitc_new_app/features/contact/logic/utilityBloc/utility_state.dart';
import 'package:uoitc_new_app/features/contact/presentation/widgets/social_icon_widget.dart';

class ContactUsScreen extends StatelessWidget {
  Completer<GoogleMapController> _controller = Completer();

  ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocBuilder<UtilityBloc, UtilityState>(
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
            success: (List<Utility> utilities) {
              for (var element in utilities) {
                print('location ${element.property}');
              }
              final locations = utilities
                  .firstWhere(
                    (element) => element.property == 'uoitc_location',
                  )
                  .value
                  .split(',');

              return Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.42,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25.r),
                            bottomRight: Radius.circular(25.r),
                          ),
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Image.network(utilities
                                .firstWhere((element) =>
                                    element.property == 'uoitc_image')
                                .value),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 0.55,
                      ),
                    ],
                  ),
                  Positioned(
                    top: 170.h,
                    left: 20.w,
                    right: 20.w,
                    child: Container(
                      height: size.height * 0.55,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          20.r,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 6.h,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const VerticalSpacing(height: 10),
                          Text(
                            utilities
                                .firstWhere((element) =>
                                    element.property == 'about_app')
                                .value,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const VerticalSpacing(height: 5),
                          Text(
                            utilities
                                .firstWhere((element) =>
                                    element.property == 'about_app')
                                .extraInformation,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const VerticalSpacing(height: 15),
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
                                  infoWindow: const InfoWindow(title: 'UOITC'),
                                ),
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 40.h,
                    child: SizedBox(
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SocialIconWidget(
                            cmargin: EdgeInsets.only(left: 15.0.w),
                            icon: FontAwesomeIcons.x,
                            onTap: () {
                              String twitterUrl = utilities
                                  .firstWhere((element) =>
                                      element.property == 'twitter')
                                  .extraInformation;
                              launchInBrowser(twitterUrl);
                            },
                          ),
                          SocialIconWidget(
                            cmargin: EdgeInsets.only(left: 15.0.w),
                            icon: FontAwesomeIcons.facebookF,
                            onTap: () {
                              String facebookUrl = utilities
                                  .firstWhere((element) =>
                                      element.property == 'facebook')
                                  .extraInformation;
                              launchInBrowser(facebookUrl);
                            },
                          ),
                          SocialIconWidget(
                            cmargin: EdgeInsets.only(left: 15.0.w),
                            icon: FontAwesomeIcons.telegram,
                            onTap: () {
                              String telegramUrl = utilities
                                  .firstWhere((element) =>
                                      element.property == 'telegram')
                                  .extraInformation;
                              launchInBrowser(telegramUrl);
                            },
                          ),
                          SocialIconWidget(
                            cmargin: EdgeInsets.only(left: 15.0.w),
                            icon: FontAwesomeIcons.youtube,
                            onTap: () {
                              String youtubeUrl = utilities
                                  .firstWhere((element) =>
                                      element.property == 'youtube')
                                  .extraInformation;
                              launchInBrowser(youtubeUrl);
                            },
                          ),
                          SocialIconWidget(
                            cmargin: EdgeInsets.only(left: 15.0.w),
                            icon: FontAwesomeIcons.instagram,
                            onTap: () {
                              String instagramUrl = utilities
                                  .firstWhere((element) =>
                                      element.property == 'instagram')
                                  .extraInformation;
                              launchInBrowser(instagramUrl);
                            },
                          ),
                          SocialIconWidget(
                            cmargin: EdgeInsets.zero,
                            icon: Iconsax.chrome,
                            onTap: () {
                              String url = utilities
                                  .firstWhere(
                                      (element) => element.property == 'url')
                                  .value;
                              launchInBrowser(url);
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );
              // return ListTile(
              //   title: Text(utilities[index].property),
              //   subtitle: Text(utilities[index].value),
              // );
            },
            error: (error) {
              return Center(
                child: Text(error),
              );
            },
          );
        },
      ),
    );
  }
}
