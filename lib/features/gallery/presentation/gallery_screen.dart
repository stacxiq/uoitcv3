import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uoitc_new_app/core/extensions/extensions.dart';
import 'package:uoitc_new_app/core/routing/routes.dart';
import 'package:uoitc_new_app/features/gallery/data/models/gallery.dart';
import 'package:uoitc_new_app/features/gallery/logic/gallery_bloc/gallery_bloc.dart';
import 'package:uoitc_new_app/features/gallery/logic/gallery_bloc/gallery_state.dart';
import 'package:uoitc_new_app/features/gallery/presentation/widgets/art_card_widget.dart';
import 'package:uoitc_new_app/features/gallery/presentation/widgets/background_widget.dart';
import 'package:uoitc_new_app/features/gallery/presentation/widgets/buy_button_widget.dart';

class GalleryScreen extends StatefulWidget {
  GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  final controller = PageController();

  GalleryModel? galleryModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GalleryBloc, GalleryState>(
        builder: (context, state) {
          return state.when(initial: () {
            return Container();
          }, loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }, success: (gallery) {
            return Stack(children: [
              BackgroundWidget(
                controller: controller,
                galleryList: gallery,
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CarouselSlider.builder(
                        itemCount: gallery.length,
                        itemBuilder:
                            (BuildContext context, int index, int realIndex) {
                          return ArtCardWidget(
                            title: gallery[index].title,
                            description: gallery[index].date,
                            image: gallery[index].images![1].path,
                          );
                        },
                        options: CarouselOptions(
                          enableInfiniteScroll: false,
                          viewportFraction: 0.98,
                          height: MediaQuery.of(context).size.height * 0.7,
                          enlargeCenterPage: true,
                          onPageChanged: (index, reason) {
                            setState(() {
                              galleryModel = gallery[index];
                            });
                            controller.animateToPage(
                              index,
                              duration: const Duration(seconds: 1),
                              curve: Curves.ease,
                            );
                          },
                        ),
                      ),
                      BuyButtonWidget(
                        ontap: () {
                          final data = galleryModel ?? gallery.first;
                          print(data);
                          context.pushNamed(
                            Routes.galleryDetailScreen,
                            arguments: data,
                          );
                        },
                      ),
                      const SizedBox(height: 30)
                    ],
                  ))
            ]);
          }, error: (error) {
            return Center(
              child: Text(error),
            );
          });
        },
      ),
    );
  }
}
