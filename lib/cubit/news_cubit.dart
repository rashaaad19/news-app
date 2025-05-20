import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/data/models/news_model.dart';
import 'package:newsapp/repos/news_repo.dart';
import 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final NewsRepo newsRepo;
  //* Recieve the repo in the constructor, and initialize the state with NewsInitial
  NewsCubit(this.newsRepo) : super(NewsInitial());

  Future<void> fetchNews() async {
    //*Our business logic
    emit(NewsLoading());
    try {
      final NewsResponseModel? response = await newsRepo.getNews();
      if (response != null) {
        emit(NewsLoaded(response));
      }
    } catch (e) {
      throw Exception('Error fetching news: $e');
    }
  }
}
