import 'package:uoitc_new_app/core/networking/api_result.dart';
import 'package:uoitc_new_app/core/networking/error_handler.dart';
import 'package:uoitc_new_app/features/home/data/datasource/news_data_source.dart';
import 'package:uoitc_new_app/features/home/data/models/news.dart';

class NewsRepository {
  final NewsDataSource newsDataSource;
  NewsRepository({
    required this.newsDataSource,
  });
  Future<ApiResult<List<News>>> fetchNews(int page) async {
    try {
      final response = await newsDataSource.getNews(page);
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro));
    }
  }
}
