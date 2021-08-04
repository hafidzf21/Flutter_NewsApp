import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/student.dart';

class DetailStudent extends StatelessWidget {
  static const routeName = '/detail-student';

  @override
  Widget build(BuildContext context) {
    final students = Provider.of<Students>(context, listen: false);
    final studentId = ModalRoute.of(context).settings.arguments as String;
    final selectStudent = students.selectById(studentId);
    final TextEditingController imageController = TextEditingController(text: selectStudent.imageUrl);
    final TextEditingController nameController = TextEditingController(text: selectStudent.name);
    final TextEditingController positionController = TextEditingController(text: selectStudent.position);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Detail Student"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(imageController.text),
                    ),
                  ),
                ),
              ),
              TextFormField(
                autocorrect: false,
                autofocus: true,
                decoration: InputDecoration(labelText: "Nama"),
                textInputAction: TextInputAction.next,
                controller: nameController,
              ),
              TextFormField(
                autocorrect: false,
                decoration: InputDecoration(labelText: "Posisi"),
                textInputAction: TextInputAction.next,
                controller: positionController,
              ),
              TextFormField(
                autocorrect: false,
                decoration: InputDecoration(labelText: "Image URL"),
                textInputAction: TextInputAction.done,
                controller: imageController,
                onEditingComplete: () {
                  students.editStudent(
                    studentId,
                    nameController.text,
                    positionController.text,
                    imageController.text,
                    context,
                  );
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 50),
              Container(
                width: double.infinity,
                alignment: Alignment.centerRight,
                child: OutlinedButton(
                  onPressed: () {
                    students.editStudent(
                      studentId,
                      nameController.text,
                      positionController.text,
                      imageController.text,
                      context,
                    );
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Edit",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
