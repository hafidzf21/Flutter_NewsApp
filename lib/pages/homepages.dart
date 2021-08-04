import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:newsapp/components/customListTile.dart';
import 'package:newsapp/model/article_model.dart';
import 'package:newsapp/pages/auth_page.dart';
import 'package:newsapp/providers/api_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Top Headlines"),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(child: Icon(Icons.person)),
                accountName: Text('Hafidz Fadhillah'),
                accountEmail: Text('hafidzfadhillah606@gmail.com'),
                decoration: BoxDecoration(
                  color: Colors.white30,
                ),
              ),
              ListTile(
                onTap: () => Navigator.of(context).pushNamed('/home'),
                title: Text('Home'),
                leading: Icon(Icons.dashboard),
              ),
              ListTile(
                onTap: () => Navigator.of(context).pushNamed('/kategori'),
                title: Text('List Kategori'),
                leading: Icon(Icons.sort),
              ),
              ListTile(
                onTap: () {},
                title: Text('Berita Terbaru'),
                leading: Icon(Icons.event_note_rounded),
              ),
              ListTile(
                onTap: () => Navigator.of(context).pushNamed('/lottie'),
                title: Text('Kamu Pasti Suka'),
                leading: Icon(Icons.favorite),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, bottom: 5.0),
                child: Text('Labels',
                    style: TextStyle(fontSize: 14, color: Colors.white)),
              ),
              ListTile(
                onTap: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginPage())),
                title: Text('Logout'),
                leading: Icon(Icons.logout),
              ),
              ListTile(
                onTap: () {},
                title: Text('Pengaturan'),
                leading: Icon(Icons.settings),
              ),
            ],
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () {
            Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (a, b, c) => HomePage(),
                  transitionDuration: Duration(seconds: 3),
                ));
            return;
          },
          child: FutureBuilder(
            future: client.getArticle(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
              // check if we got a response or not
              if (snapshot.hasData) {
                // make a list of articles
                List<Article> articles = snapshot.data;
                return ListView.builder(
                  // create our custom List tile
                  itemCount: articles.length,
                  itemBuilder: (context, index) =>
                      customListTile(articles[index], context),
                );
              }
              return Center(
                child: SpinKitFadingCircle(color: Colors.black26),
              );
            },
          ),
        ));
  }
}
