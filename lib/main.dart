import 'package:flutter/material.dart';
import 'package:flutter_application_ogrenci_takip/models/student.dart';
import 'package:flutter_application_ogrenci_takip/screens/student_add.dart';
import 'package:flutter_application_ogrenci_takip/screens/student_update.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark()
            .copyWith(scaffoldBackgroundColor: Colors.cyan[900]),
        home: const HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State {
  List<Student> students = [
    Student.withId(firstName: 'Hasret', lastName: 'Karci', grade: 95, id: 1),
    Student.withId(firstName: 'Ali Cem', lastName: 'Karci', grade: 45, id: 2),
    Student.withId(id: 3, firstName: 'Mehmet Ali', lastName: 'Karci', grade: 25)
  ];
  Student selectedStudent =
      Student.withId(id: 0, firstName: 'Hiç Kimse', lastName: '', grade: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Öğrenci Takip Sistemi'),
          backgroundColor: Colors.black,
        ),
        body: buildBody());
  }

  Widget buildBody() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: students.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(
                    '${students[index].firstName} ${students[index].lastName}'),
                subtitle: Text(
                    'Sınavdan aldığı not: ${students[index].grade} [${students[index].getStatus}]'),
                leading: const CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(
                      "https://cdn-icons-png.flaticon.com/512/1157/1157034.png"),
                ),
                trailing: buildStatusIcon(students[index].grade),
                onTap: () {
                  setState(() {
                    selectedStudent = students[index];
                  });
                },
                onLongPress: () {},
              );
            },
          ),
        ),
        Text('Seçili öğrenci : ${selectedStudent.firstName}'),
        Row(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(Colors.green.value)),
                child: Row(
                  children: const <Widget>[
                    Icon(Icons.add),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text('Yeni Öğrenci'),
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StudentAdd(students)))
                      .then((value) => setState(() {}));
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(Colors.orangeAccent.value)),
                child: Row(
                  children: const <Widget>[
                    Icon(Icons.update),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text('Güncelle'),
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  StudentUpdate(students, selectedStudent)))
                      .then((value) => setState(() {}));
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(Colors.redAccent.value)),
                child: Row(
                  children: const <Widget>[
                    Icon(Icons.delete),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text('Sil'),
                  ],
                ),
                onPressed: () {
                  students.remove(selectedStudent);
                  setState(() {});
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 50) {
      return const Icon(Icons.done);
    } else if (grade >= 40) {
      return const Icon(Icons.album);
    } else {
      return const Icon(Icons.clear);
    }
  }
}
