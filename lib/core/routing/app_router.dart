import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uoitc_new_app/core/routing/routes.dart';
import 'package:uoitc_new_app/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:uoitc_new_app/features/auth/data/repository/auth_repository.dart';
import 'package:uoitc_new_app/features/auth/logic/auth_bloc.dart';
import 'package:uoitc_new_app/features/auth/presentation/login_screen.dart';
import 'package:uoitc_new_app/features/colleges/data/models/college.dart';
import 'package:uoitc_new_app/features/colleges/presentation/college_detail_screen.dart';
import 'package:uoitc_new_app/features/gallery/data/models/gallery.dart';
import 'package:uoitc_new_app/features/gallery/presentation/gallery_detail_screen.dart';
import 'package:uoitc_new_app/features/home/data/datasource/news_data_source.dart';
import 'package:uoitc_new_app/features/home/data/datasource/video_data_source.dart';
import 'package:uoitc_new_app/features/home/data/models/news.dart';
import 'package:uoitc_new_app/features/home/data/repositories/news_repository.dart';
import 'package:uoitc_new_app/features/home/data/repositories/videos_repository.dart';
import 'package:uoitc_new_app/features/home/logic/videos_bloc/videos_bloc.dart';
import 'package:uoitc_new_app/features/home/logic/videos_bloc/videos_event.dart';
import 'package:uoitc_new_app/features/home/presentation/home_screen.dart';
import 'package:uoitc_new_app/features/home/logic/news_bloc/news_bloc.dart';
import 'package:uoitc_new_app/features/home/logic/news_bloc/news_event.dart';
import 'package:uoitc_new_app/features/home/presentation/news_detail_screen.dart';
import 'package:uoitc_new_app/features/home/presentation/news_screen_page.dart';
import 'package:uoitc_new_app/features/home/presentation/video_screen_page.dart';
import 'package:uoitc_new_app/features/salary/presentation/salary_screen.dart';
import 'package:uoitc_new_app/features/tabs/tabs.dart';
import 'package:uoitc_new_app/features/update_employee/data/datasource/structure_data_source.dart';
import 'package:uoitc_new_app/features/update_employee/data/repository/structure_repository.dart';
import 'package:uoitc_new_app/features/update_employee/logic/structure_bloc/structure_bloc.dart';
import 'package:uoitc_new_app/features/update_employee/logic/structure_bloc/structure_event.dart';
import 'package:uoitc_new_app/features/update_employee/presentation/employee_form.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                NewsBloc(NewsRepository(newsDataSource: NewsDataSourceImpl()))
                  ..add(const NewsEvent.fetch()),
            child: const TabsScreen(),
          ),
        );
      case Routes.galleryDetailScreen:
        return MaterialPageRoute(
          builder: (_) => GalleryDetailScreen(
            galleryModel: arguments as GalleryModel,
          ),
        );
      case Routes.collegeDetailScreen:
        return MaterialPageRoute(
          builder: (_) => CollegeDetailScreen(
            college: arguments as College,
          ),
        );
      case Routes.videosScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => BlocProvider(
            create: (context) => VideosBloc(
                VideosRepository(videosDataSource: VideosDataSourceImpl()))
              ..add(
                const VideosEvent.fetch(),
              ),
            child: const VideoScreen(),
          ),
        );
      case Routes.newsDetailScreen:
        return MaterialPageRoute(
          builder: (context) => NewsDetailScreen(
            news: arguments as News,
          ),
        );
      case Routes.allNewsScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                NewsBloc(NewsRepository(newsDataSource: NewsDataSourceImpl()))
                  ..add(const NewsEvent.fetch()),
            child: NewsScreen(),
          ),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create: (context) => AuthBloc(
                    AuthRepository(
                      authRemoteDataSource: AuthRemoteDataSourceImpl(),
                    ),
                  ),
              child: LoginScreen()),
        );
      case Routes.salaryScreen:
        return MaterialPageRoute(
          builder: (_) => const SalaryScreen(),
        );
      case Routes.employeeFormScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => StructureBloc(
              StructureRepository(
                remoteDataSource: StructureDataSourceImpl(),
              ),
            )..add(const StructureEvent.fetch()),
            child: EmployeeFormScreen(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
