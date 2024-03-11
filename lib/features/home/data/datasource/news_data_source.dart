import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:uoitc_new_app/core/networking/dio_factory.dart';
import 'package:uoitc_new_app/features/home/data/models/news.dart';

abstract class NewsDataSource {
  Future<List<News>> getNews(int page);
}

class NewsDataSourceImpl implements NewsDataSource {
  @override
  Future<List<News>> getNews(int page) async {
    try {
      final requestData = {
        'operation': 'news',
        'page': page,
      };
      final response =
          await NetworkManager.dio.post('news.php', data: requestData);

      Map<String, dynamic> result = json.decode(response.data);

      final newsData = result["news"];
      print(newsData);

      List<News> newsList = [];
      for (var e in newsData) {
        newsList.add(News.fromJson(e));
      }
      return newsList;
    } on DioException catch (e) {
      throw Exception(e);
    }
  }
}
