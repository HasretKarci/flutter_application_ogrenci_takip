import 'package:flutter/material.dart';
import '../models/student.dart';

class StudentAdd extends StatefulWidget {
  late List<Student> students;
  StudentAdd(this.students, {super.key});
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState();
  }
}

class _StudentAddState extends State<StudentAdd> {
  var formKey = GlobalKey<FormState>();
  Student student = Student(firstName: '', lastName: '', grade: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yeni Öğrenci Ekleme'),
      ),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              buildFirstNameField(),
              buildLastNameField(),
              buildGradeField(),
              buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFirstNameField() {
    return TextFormField(
      decoration:
          const InputDecoration(labelText: 'Öğrenci Adı', hintText: 'Hasret'),
      onSaved: (newValue) {
        if (newValue == null) {
          student.firstName = '';
        } else {
          student.firstName = newValue;
        }
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      decoration:
          const InputDecoration(labelText: 'Öğrenci Soyadı', hintText: 'Karci'),
      onSaved: (newValue) {
        if (newValue == null) {
          student.lastName = '';
        } else {
          student.lastName = newValue;
        }
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      decoration:
          const InputDecoration(labelText: 'Aldığı not', hintText: '55'),
      onSaved: (newValue) {
        if (newValue == null) {
          student.grade = 0;
        } else {
          student.grade = int.parse(newValue);
        }
      },
    );
  }

  Widget buildSubmitButton() {
    return ElevatedButton(
      child: const Text('Kaydet'),
      onPressed: () {
        formKey.currentState?.save();
        student.id = widget.students.length + 1;
        widget.students.add(student);
        Navigator.pop(context);
      },
    );
  }
}
