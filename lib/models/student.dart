class Student {
  late int id;
  late String firstName;
  late String lastName;
  late int grade;
  late String _status;

  String get getStatus {
    String statusMessage = '';
    if (grade >= 50) {
      statusMessage = 'Geçti';
    } else if (grade >= 40) {
      statusMessage = 'Bütünlemeye kaldı';
    } else {
      statusMessage = 'Kaldı';
    }
    return statusMessage;
  }

  set setStatus(String status) {
    _status = status;
  }

  Student(
      {required this.firstName, required this.lastName, required this.grade});

  Student.withId(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.grade});
}
