import 'package:flutter/material.dart';
import 'package:newsapp/pages/listkategori/detail_list.dart';

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
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext _) => DetailList(),
            )),
            leading: CircleAvatar(
              child: Icon(Icons.restaurant, color: Colors.lightBlue),
              backgroundColor: Colors.lightBlueAccent.withOpacity(0.3),
            ),
            title: Text("Fast Food"),
          ),
          ListTile(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext _) => DetailList(),
            )),
            leading: CircleAvatar(
              child: Icon(Icons.two_wheeler, color: Colors.lightBlue),
              backgroundColor: Colors.lightBlueAccent.withOpacity(0.3),
            ),
            title: Text("Otomotif"),
          ),
          ListTile(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext _) => DetailList(),
            )),
            leading: CircleAvatar(
              child: Icon(Icons.music_note, color: Colors.lightBlue),
              backgroundColor: Colors.lightBlueAccent.withOpacity(0.3),
            ),
            title: Text("Musik"),
          ),
          ListTile(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext _) => DetailList(),
            )),
            leading: CircleAvatar(
              child: Icon(Icons.theaters, color: Colors.lightBlue),
              backgroundColor: Colors.lightBlueAccent.withOpacity(0.3),
            ),
            title: Text("Film"),
          ),
           ListTile(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext _) => DetailList(),
            )),
            leading: CircleAvatar(
              child: Icon(Icons.sports_esports, color: Colors.lightBlue),
              backgroundColor: Colors.lightBlueAccent.withOpacity(0.3),
            ),
            title: Text("eSport"),
          ),
           ListTile(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext _) => DetailList(),
            )),
            leading: CircleAvatar(
              child: Icon(Icons.shopping_cart, color: Colors.lightBlue),
              backgroundColor: Colors.lightBlueAccent.withOpacity(0.3),
            ),
            title: Text("Shopping"),
          ),
          ListTile(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext _) => DetailList(),
            )),
            leading: CircleAvatar(
              child: Icon(Icons.self_improvement, color: Colors.lightBlue),
              backgroundColor: Colors.lightBlueAccent.withOpacity(0.3),
            ),
            title: Text("Yoga"),
          ),
          ListTile(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext _) => DetailList(),
            )),
            leading: CircleAvatar(
              child: Icon(Icons.school, color: Colors.lightBlue),
              backgroundColor: Colors.lightBlueAccent.withOpacity(0.3),
            ),
            title: Text("Pendidikan"),
          ),
            ListTile(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext _) => DetailList(),
            )),
            leading: CircleAvatar(
              child: Icon(Icons.camera, color: Colors.lightBlue),
              backgroundColor: Colors.lightBlueAccent.withOpacity(0.3),
            ),
            title: Text("Fotografi"),
          ),
             ListTile(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext _) => DetailList(),
            )),
            leading: CircleAvatar(
              child: Icon(Icons.medical_services, color: Colors.lightBlue),
              backgroundColor: Colors.lightBlueAccent.withOpacity(0.3),
            ),
            title: Text("Kesehatan"),
          ),
        ],
      ),
    );
  }
}
