import 'package:newsapp/data/models/news_model.dart';

abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final NewsResponseModel newsResponse;
  NewsLoaded(this.newsResponse);
}

