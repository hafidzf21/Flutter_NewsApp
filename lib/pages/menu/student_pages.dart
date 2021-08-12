import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../../providers/student.dart';

import './detail_menu/add_student_pages.dart';
import './detail_menu/detail_student_pages.dart';

class StudentPage extends StatefulWidget {
  @override
  _StudentPageState createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  // Cara 1
  // bool isInit = true;
  // @override
  // void didChangeDependencies() {
  //   if (isInit) {
  //     Provider.of<Students>(context).initialData();
  //   }
  //   isInit = false;
  //   super.didChangeDependencies();
  // }

  // Cara 2
  @override
  void initState() {
  Future.delayed(Duration.zero).then((value) {
    Provider.of<Students>(context, listen: false).initialData();
  });
  super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final allStudentsProvider = Provider.of<Students>(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("All Students"),
          actions: [
            IconButton(
              icon: Icon(Icons.person_add),
              onPressed: () {
                Navigator.pushNamed(context, AddStudent.routeName);
              },
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () {
            Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (a, b, c) => StudentPage(),
                  transitionDuration: Duration(seconds: 3),
                ));
            return;
          },
          child: (allStudentsProvider.jumlahStudent == 0)
              ? Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "No Data",
                        style: TextStyle(fontSize: 25),
                      ),
                      SizedBox(height: 20),
                      OutlinedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, AddStudent.routeName);
                          },
                          child: Text(
                            "Add Student",
                            style: TextStyle(fontSize: 20),
                          )),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: allStudentsProvider.jumlahStudent,
                  itemBuilder: (context, index) {
                    var id = allStudentsProvider.allStudent[index].id;
                    return ListTile(
                      onTap: () {
                        Navigator.pushNamed(context, DetailStudent.routeName,
                            arguments: id);
                      },
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          width: 50,
                          height: 50,
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl:
                                allStudentsProvider.allStudent[index].imageUrl,
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) => Container(
                              width: 50,
                              height: 50,
                              child: Image.network(
                                  "https://www.joyonlineschool.com/static/emptyuserphoto.png"),
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        allStudentsProvider.allStudent[index].name,
                      ),
                      subtitle: Text(
                        allStudentsProvider.allStudent[index].position,
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          allStudentsProvider.deleteStudent(id).then(
                            (_) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Berhasil Dihapus!"),
                                  duration: Duration(milliseconds: 500),
                                ),
                              );
                            },
                          );
                        },
                        icon: Icon(Icons.delete),
                      ),
                    );
                  },
                ),
        ));
  }
}
