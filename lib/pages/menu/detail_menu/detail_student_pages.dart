import 'package:cached_network_image/cached_network_image.dart';
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

    final TextEditingController imageController =
        TextEditingController(text: selectStudent.imageUrl);
    final TextEditingController nameController =
        TextEditingController(text: selectStudent.name);
    final TextEditingController positionController =
        TextEditingController(text: selectStudent.position);
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                borderRadius: BorderRadius.circular(150),
                child: Container(
                  width: 150,
                  height: 150,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: imageController.text,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Container(
                      width: 50,
                      height: 50,
                      child: Image.network(
                          "https://www.joyonlineschool.com/static/emptyuserphoto.png"),
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
                  students
                      .editStudent(
                    studentId,
                    nameController.text,
                    positionController.text,
                    imageController.text,
                  )
                      .then(
                    (value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Berhasil Diubah!"),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      Navigator.pop(context);
                    },
                  );
                },
              ),
              SizedBox(height: 50),
              Container(
                width: double.infinity,
                alignment: Alignment.centerRight,
                child: OutlinedButton(
                  onPressed: () {
                    students
                        .editStudent(
                      studentId,
                      nameController.text,
                      positionController.text,
                      imageController.text,
                    )
                        .then(
                      (value) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Berhasil Diubah!"),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        Navigator.pop(context);
                      },
                    );
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
