import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/student.dart';
import './detail_menu/add_student_pages.dart';
import './detail_menu/detail_student_pages.dart';

class StudentPage extends StatelessWidget {
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
      body: (allStudentsProvider.jumlahStudent == 0) ? Container(
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
              )
            ),
          ],
        ),
      )
      : ListView.builder(
        itemCount: allStudentsProvider.jumlahStudent,
        itemBuilder: (context, index) {
          var id = allStudentsProvider.allStudent[index].id;
          return ListTile(
            onTap: () {
              Navigator.pushNamed(context, DetailStudent.routeName, arguments: id);
            },
            leading: CircleAvatar(
              backgroundImage: NetworkImage(allStudentsProvider.allStudent[index].imageUrl),
            ),
            title: Text(
              allStudentsProvider.allStudent[index].name,
            ),
            subtitle: Text(
              allStudentsProvider.allStudent[index].position,
            ),
            trailing: IconButton(
              onPressed: () {
                allStudentsProvider.deleteStudent(id, context);
              },
              icon: Icon(Icons.delete),
            ),
          );
        },
      )
    );
  }
}
