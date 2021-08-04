import 'package:flutter/material.dart';
import 'package:newsapp/models/student_model.dart';

class Students with ChangeNotifier {
  List<Student> _allStudent = [];

  List<Student> get allStudent => _allStudent;

  int get jumlahStudent => _allStudent.length;

  Student selectById(String id) =>
      _allStudent.firstWhere((element) => element.id == id);

  void addStudent(
      String name, String position, String image, BuildContext context) {
    DateTime dateTimeNow = DateTime.now();
    _allStudent.add(
      Student(
        id: dateTimeNow.toString(),
        name: name,
        position: position,
        imageUrl: image,
        createdAt: dateTimeNow,
      ),
    );
    notifyListeners();
  }

  void editStudent(String id, String name, String position, String image,
      BuildContext context) {
    Student selectStudent =
        _allStudent.firstWhere((element) => element.id == id);
    selectStudent.name = name;
    selectStudent.position = position;
    selectStudent.imageUrl = image;
  
    notifyListeners();
  }

  void deleteStudent(String id, BuildContext context) {
    _allStudent.removeWhere((element) => element.id == id);
   
    notifyListeners();
  }
}
