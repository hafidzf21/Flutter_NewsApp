import 'package:flutter/material.dart';
import 'package:newsapp/pages/menu/detail_menu/detail_list.dart';

class ListPages extends StatefulWidget {
  @override
  _ListPagesState createState() => _ListPagesState();
}

class _ListPagesState extends State<ListPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("List Kategori"),
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext _) => DetailList(),
            )),
            leading: CircleAvatar(
              child: Icon(Icons.restaurant),
            ),
            title: Text("Fast Food"),
          ),
          ListTile(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext _) => DetailList(),
            )),
            leading: CircleAvatar(
              child: Icon(Icons.two_wheeler),
            ),
            title: Text("Otomotif"),
          ),
          ListTile(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext _) => DetailList(),
            )),
            leading: CircleAvatar(
              child: Icon(Icons.music_note)
            ),
            title: Text("Musik"),
          ),
          ListTile(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext _) => DetailList(),
            )),
            leading: CircleAvatar(
              child: Icon(Icons.theaters),
            ),
            title: Text("Film"),
          ),
           ListTile(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext _) => DetailList(),
            )),
            leading: CircleAvatar(
              child: Icon(Icons.sports_esports),
            ),
            title: Text("eSport"),
          ),
           ListTile(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext _) => DetailList(),
            )),
            leading: CircleAvatar(
              child: Icon(Icons.shopping_cart),
            ),
            title: Text("Shopping"),
          ),
          ListTile(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext _) => DetailList(),
            )),
            leading: CircleAvatar(
              child: Icon(Icons.self_improvement),
            ),
            title: Text("Yoga"),
          ),
          ListTile(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext _) => DetailList(),
            )),
            leading: CircleAvatar(
              child: Icon(Icons.school),
            ),
            title: Text("Pendidikan"),
          ),
            ListTile(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext _) => DetailList(),
            )),
            leading: CircleAvatar(
              child: Icon(Icons.camera),
            ),
            title: Text("Fotografi"),
          ),
             ListTile(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext _) => DetailList(),
            )),
            leading: CircleAvatar(
              child: Icon(Icons.medical_services),
            ),
            title: Text("Kesehatan"),
          ),
        ],
      ),
    );
  }
}
