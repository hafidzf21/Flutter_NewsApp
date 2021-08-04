import 'package:flutter/material.dart';
import 'package:newsapp/models/article_model.dart';

class ArticlePage extends StatelessWidget {
  final Article article;

  ArticlePage({this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Detail News"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200.0,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(article.urlToImage), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Container(
              padding: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Text(
                article.source.name,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Container(
              child: Text( 
                article.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
             Container(
              child: Text( "Published At: " +
                article.publishedAt,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
             SizedBox(
              height: 8.0,
            ),
            //  Container(
            //   child: Text( "Author: " +
            //     article.author,
            //     textAlign: TextAlign.center,
            //     style: TextStyle(
            //       fontSize: 16.0,
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 8.0,
            ),
            Container(
              child: Text("Descriptions: ",
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Container(
              child: Text( 
                article.content,
                maxLines: 4,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
