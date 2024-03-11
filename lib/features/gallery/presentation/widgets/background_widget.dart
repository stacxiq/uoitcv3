import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:uoitc_new_app/features/gallery/data/models/gallery.dart'
    as gallery;

// ignore: must_be_immutable
class BackgroundWidget extends StatelessWidget {
  final PageController controller;
  List<gallery.GalleryModel> galleryList;

  BackgroundWidget(
      {super.key, required this.controller, required this.galleryList});

  @override
  Widget build(BuildContext context) => PageView.builder(
        reverse: true,
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        itemBuilder: (context, index) {
          return buildBackground(image: galleryList[index].images!.first.path);
        },
        itemCount: galleryList.length,
      );

  Widget buildBackground({required String image}) => Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: CachedNetworkImage(imageUrl: image, fit: BoxFit.cover),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.4, 0.8],
                colors: [
                  const Color.fromARGB(255, 248, 199, 3).withOpacity(0.01),
                  Colors.white
                ],
              ),
            ),
          )
        ],
      );
}
