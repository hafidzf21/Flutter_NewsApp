import 'dart:convert';

import 'package:http/http.dart';
import 'package:newsapp/models/article_model.dart';

class ApiService {
  final endPointUrl =
      "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=1b77d1a498144c9aa6a1775ca566563a";

  Future<List<Article>> getArticle() async {
    Response res = await get(endPointUrl);

    // check that we got a 200 statu code succes
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      // this line will allow us to get the different articles from the json file and putting them into a list
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}
