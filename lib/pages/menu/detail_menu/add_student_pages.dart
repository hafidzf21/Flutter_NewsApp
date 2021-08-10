import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/student.dart';

class AddStudent extends StatelessWidget {
  static const routeName = '/add-student';
  final TextEditingController nameController = TextEditingController();
  final TextEditingController positionController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final students = Provider.of<Students>(context, listen: false);
    final Function addStudent = () {
      students
          .addStudent(
        nameController.text,
        positionController.text,
        imageController.text,
      )
          .then(
        (response) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Berhasil ditambahkan"),
              duration: Duration(seconds: 2),
            ),
          );
          Navigator.pop(context);
        },
      ).catchError(
        (error) => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Terjadi Error $error!"),
            content: Text("Tidak dapat menambahkan data siswa"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Okey"),
              ),
            ],
          ),
        ),
      );
    };

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add Student"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: addStudent,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            children: [
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
                onEditingComplete: addStudent,
              ),
              SizedBox(height: 50),
              Container(
                width: double.infinity,
                alignment: Alignment.centerRight,
                child: OutlinedButton(
                  onPressed: addStudent,
                  child: Text(
                    "Submit",
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
