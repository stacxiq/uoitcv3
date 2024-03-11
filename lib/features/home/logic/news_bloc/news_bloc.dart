import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uoitc_new_app/features/home/data/models/news.dart';
import 'package:uoitc_new_app/features/home/logic/news_bloc/news_event.dart';
import 'package:uoitc_new_app/features/home/logic/news_bloc/news_state.dart';
import 'package:uoitc_new_app/features/home/data/repositories/news_repository.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  int page = 1;
  List<News> news = [];
  final NewsRepository _newsRepository;
  NewsBloc(this._newsRepository) : super(const NewsState.loading()) {
    on<NewsEvent>(
      (NewsEvent event, emit) async {
        await event.map(fetch: (_) async {
          emit(const NewsState.loading());

          final response = await _newsRepository.fetchNews(page);
          page++;
          response.when(success: (data) {
            news.addAll(data);
            emit(NewsState.success(news));
          }, failure: (err) {
            emit(NewsState.error(error: err.apiErrorModel.message!));
          });
        }, fetchMore: (_) async {
          page++;
          final response = await _newsRepository.fetchNews(page);
          emit(const NewsState.loading());

          response.when(
            success: (data) {
              news.addAll(data);

              List<News> newsList = news;
              emit(NewsState.success(newsList));
            },
            failure: (err) {},
          );
        });
      },
    );
  }
}
