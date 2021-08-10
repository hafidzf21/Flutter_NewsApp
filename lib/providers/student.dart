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

  addStudent(String name, String position, String image) async {
    DateTime dateTimeNow = DateTime.now();

    Uri url = Uri.parse(
        "https://http-req-flutter-default-rtdb.firebaseio.com/students.json");

    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            "name": name,
            "position": position,
            "imageUrl": image,
            "createdAt": dateTimeNow.toString(),
          },
        ),
      );
      if (response.statusCode >= 200 && response.statusCode < 300) {
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
      } else {
        throw ("${response.statusCode}");
      }
    } catch (error) {
      throw (error);
    }
  }

  editStudent(String id, String name, String position, String image) async {
    Uri url = Uri.parse(
        "https://http-req-flutter-default-rtdb.firebaseio.com/students/$id.json");

    try {
      final response = await http.patch(
        // Jika menggunakan PUT maka data akan di replace dan createAt akan hilang didalam database
        url,
        body: json.encode(
          {
            "name": name,
            "position": position,
            "imageUrl": image,
          },
        ),
      );
      if (response.statusCode >= 200 && response.statusCode < 300) {
        Student selectStudent =
          _allStudent.firstWhere((element) => element.id == id);
        selectStudent.name = name;
        selectStudent.position = position;
        selectStudent.imageUrl = image;
        notifyListeners();
      } else {
        throw ("${response.statusCode}");
      }
    } catch (error) {
      throw (error);
    }
  }

  deleteStudent(String id) async{
    Uri url = Uri.parse(
        "https://http-req-flutter-default-rtdb.firebaseio.com/students/$id.json");

    try {
      final response = await http.delete(url).then(
      (response) {
        _allStudent.removeWhere((element) => element.id == id);
        notifyListeners();
      },
    );
      if (response.statusCode < 200 && response.statusCode >= 300) {
        throw ("${response.statusCode}");
      } 
    } catch (error) {
      throw (error);
    }    
  }

  Future<void> initialData() async {
    Uri url = Uri.parse(
        "https://http-req-flutter-default-rtdb.firebaseio.com/students.json");

    var getData = await http.get(url);

    var dataResponse = json.decode(getData.body) as Map<String, dynamic>;

    if (dataResponse != null) {
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
}
