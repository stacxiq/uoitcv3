import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uoitc_new_app/core/static/colors.dart';
import 'package:uoitc_new_app/features/colleges/data/datasource/college_remote_datasource.dart';
import 'package:uoitc_new_app/features/colleges/data/repositories/colleges_repository.dart';
import 'package:uoitc_new_app/features/colleges/logic/college_bloc.dart';
import 'package:uoitc_new_app/features/colleges/logic/college_event.dart';
import 'package:uoitc_new_app/features/colleges/presentation/college_screen.dart';
import 'package:uoitc_new_app/features/contact/data/datasource/utility_remote_data_source.dart';
import 'package:uoitc_new_app/features/contact/data/repositories/utilities_repository.dart';
import 'package:uoitc_new_app/features/contact/logic/utilityBloc/utility_bloc.dart';
import 'package:uoitc_new_app/features/contact/logic/utilityBloc/utility_event.dart';
import 'package:uoitc_new_app/features/contact/presentation/contact_us_screen.dart';
import 'package:uoitc_new_app/features/gallery/data/datasource/gallery_datasource.dart';
import 'package:uoitc_new_app/features/gallery/data/repositories/gallery_repository.dart';
import 'package:uoitc_new_app/features/gallery/logic/gallery_bloc/gallery_bloc.dart';
import 'package:uoitc_new_app/features/gallery/logic/gallery_bloc/gallery_event.dart';
import 'package:uoitc_new_app/features/gallery/presentation/gallery_screen.dart';
import 'package:uoitc_new_app/features/home/data/datasource/news_data_source.dart';
import 'package:uoitc_new_app/features/home/data/datasource/video_data_source.dart';
import 'package:uoitc_new_app/features/home/data/repositories/news_repository.dart';
import 'package:uoitc_new_app/features/home/data/repositories/videos_repository.dart';
import 'package:uoitc_new_app/features/home/presentation/home_screen.dart';
import 'package:uoitc_new_app/features/home/logic/news_bloc/news_bloc.dart';
import 'package:uoitc_new_app/features/home/logic/news_bloc/news_event.dart';
import 'package:uoitc_new_app/features/home/logic/videos_bloc/videos_bloc.dart';
import 'package:uoitc_new_app/features/home/logic/videos_bloc/videos_event.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _currentPage = 0;
  final pages = [
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              NewsBloc(NewsRepository(newsDataSource: NewsDataSourceImpl()))
                ..add(const NewsEvent.fetch()),
        ),
        BlocProvider(
          create: (context) => VideosBloc(
            VideosRepository(
              videosDataSource: VideosDataSourceImpl(),
            ),
          )..add(
              const VideosEvent.fetch(),
            ),
        ),
      ],
      child:  HomePage(),
    ),
    BlocProvider(
      create: (context) => GalleryBloc(
        GalleryRepository(
          galleryDataSource: GalleryDataSourceImpl(),
        ),
      )..add(const GalleryEvent.fetch()),
      child: GalleryScreen(),
    ),
    BlocProvider(
      create: (context) => CollegeBloc(
        CollegeRepository(
          collegeRemoteDataSource: CollegeRemoteDataSourceImpl(),
        ),
      )..add(const CollegeEvent.fetch()),
      child: const CollegeScreen(),
    ),
    BlocProvider(
      create: (context) => UtilityBloc(
        UtilityRepository(
          utiliyRemoteDataSource: UtiliyRemoteDataSourceImpl(),
        ),
      )..add(const UtilityEvent.fetch()),
      child:  ContactUsScreen(),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPage,
        selectedFontSize: 12.sp,
        unselectedFontSize: 12.sp,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/home.svg',
              colorFilter: ColorFilter.mode(
                _currentPage == 0 ? primaryColor : greyColor,
                BlendMode.srcIn,
              ),
            ),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/photo.svg',
              colorFilter: ColorFilter.mode(
                _currentPage == 1 ? primaryColor : greyColor,
                BlendMode.srcIn,
              ),
            ),
            label: 'صور',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/college.svg',
              colorFilter: ColorFilter.mode(
                _currentPage == 2 ? primaryColor : greyColor,
                BlendMode.srcIn,
              ),
            ),
            label: 'الكليات',
            
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/contact.svg',
              colorFilter: ColorFilter.mode(
                _currentPage == 3 ? primaryColor : greyColor,
                BlendMode.srcIn,
              ),
            ),
            label: 'تواصل',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        selectedItemColor: primaryColor,
        unselectedItemColor: greyColor,
      ),
    );
  }
}
