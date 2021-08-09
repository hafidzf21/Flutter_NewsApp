import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:newsapp/models/student_model.dart';

class Students with ChangeNotifier {
  List<Student> _allStudent = [];

  List<Student> get allStudent => _allStudent;

  int get jumlahStudent => _allStudent.length;

  Student selectById(String id) =>
      _allStudent.firstWhere((element) => element.id == id);

  Future<void> addStudent(String name, String position, String image) {
    DateTime dateTimeNow = DateTime.now();

    Uri url = Uri.parse(
        "https://http-req-flutter-default-rtdb.firebaseio.com/students.json");
    return http
        .post(
      url,
      body: json.encode(
        {
          "name": name,
          "position": position,
          "imageUrl": image,
          "createdAt": dateTimeNow.toString(),
        },
      ),
    )
        .then(
      (response) {
        _allStudent.add(
          Student(
            id: json.decode(response.body)["name"].toString(),
            name: name,
            position: position,
            imageUrl: image,
            createdAt: dateTimeNow,
          ),
        );
        notifyListeners();
      },
    );
  }

  Future<void> editStudent(
      String id, String name, String position, String image) {
    Uri url = Uri.parse(
        "https://http-req-flutter-default-rtdb.firebaseio.com/students/$id.json");
    return http
        .patch(
      // Jika menggunakan PUT maka data akan di replace dan createAt akan hilang didalam database
      url,
      body: json.encode(
        {
          "name": name,
          "position": position,
          "imageUrl": image,
        },
      ),
    )
        .then(
      (response) {
        Student selectStudent =
            _allStudent.firstWhere((element) => element.id == id);
        selectStudent.name = name;
        selectStudent.position = position;
        selectStudent.imageUrl = image;
        notifyListeners();
      },
    );
  }

  Future<void> deleteStudent(String id) {
    Uri url = Uri.parse(
        "https://http-req-flutter-default-rtdb.firebaseio.com/students/$id.json");

    return http.delete(url).then(
      (response) {
        _allStudent.removeWhere((element) => element.id == id);
        notifyListeners();
      },
    );
  }

  Future <void> initialData() async {
    Uri url = Uri.parse(
        "https://http-req-flutter-default-rtdb.firebaseio.com/students.json");

    var getData = await http.get(url);

    var dataResponse = json.decode(getData.body) as Map<String, dynamic>;

    dataResponse.forEach(
      (key, value) {
        DateTime dateTimeParse =
            DateFormat("yyyy-mm-dd hh:mm:ss").parse(value["createdAt"]);
        _allStudent.add(
          Student(
            id: key,
            createdAt: dateTimeParse,
            imageUrl: value["imageUrl"],
            name: value["name"],
            position: value["position"],
          ),
        );
      },
    );
    
    notifyListeners();
  }
}
