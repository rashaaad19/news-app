import 'package:dio/dio.dart';
import 'package:newsapp/data/models/news_model.dart';

class NewsRepo {
  Dio dio = Dio();
  Future<NewsResponseModel?> getNews() async {
    try {
      var response = await dio.get(
        'https://newsapi.org/v2/everything?q=tesla&from=2025-04-18&sortBy=publishedAt&apiKey=024a2e8d9ec84a21b5c6b181ac0b4c08',
      );
      if (response.statusCode! > 299) {
        return null;
      } else {
        NewsResponseModel newsResponseModel = NewsResponseModel.fromJson(
          response.data,
        );
        return newsResponseModel;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
