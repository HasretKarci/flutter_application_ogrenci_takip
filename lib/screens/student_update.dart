import 'package:flutter/material.dart';
import '../models/student.dart';

class StudentUpdate extends StatefulWidget {
  late List<Student> students;
  late Student selectedStudent;
  StudentUpdate(this.students, this.selectedStudent, {super.key});
  @override
  State<StatefulWidget> createState() {
    return _StudentUpdateState();
  }
}

class _StudentUpdateState extends State<StudentUpdate> {
  var formKey = GlobalKey<FormState>();
  Student student = Student(firstName: '', lastName: '', grade: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Öğrenci Güncelleme'),
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
      child: const Text('Güncelle'),
      onPressed: () {
        formKey.currentState?.save();
        widget.students[widget.selectedStudent.id - 1].firstName =
            student.firstName;
        widget.students[widget.selectedStudent.id - 1].lastName =
            student.lastName;
        widget.students[widget.selectedStudent.id - 1].grade = student.grade;
        Navigator.pop(context);
      },
    );
  }
}
