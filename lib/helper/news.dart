import '../models/article_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url = "https://newsapi.org/v2/top-headlines?country=in&apiKey=9e3dd2c834ff46dfb12a796f9d6def84";
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel article = ArticleModel(
              author: element['author']?? "",
              title: element['title']?? "",
              desc: element['description']?? "",
              url: element["url"]??"",
              urlToImage: element['urlToImage']??"",
              content: element["content"]??"");
          news.add(article);
        }
      });
    }
  }
}

class CategoryNews {
  List<ArticleModel> news = [];

  Future<void> getNewsForCategory(String category) async {
    String url = "http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=9e3dd2c834ff46dfb12a796f9d6def84";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel article = ArticleModel(
              author: element['author']?? "",
              title: element['title']?? "",
              desc: element['description']?? "",
              url: element["url"]??"",
              urlToImage: element['urlToImage']??"",
              content: element["content"]??"");
          news.add(article);
        }
      });
    }
  }
}
