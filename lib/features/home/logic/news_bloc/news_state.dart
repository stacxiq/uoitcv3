

import 'package:freezed_annotation/freezed_annotation.dart';
part 'news_state.freezed.dart';

@freezed
class  NewsState<T> with _$NewsState<T> {
  const factory NewsState.initial() = _Initial;
  
  const factory NewsState.loading() = Loading;
  const factory NewsState.success(T data) = Success<T>;
  const factory NewsState.error({required String error}) = Error;
}