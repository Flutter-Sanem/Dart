import 'student.dart';

void main() {
  print("Okul Projesi");

  Student student1 = Student("Giden", "Bedirhan", 27, 471);

  student1.name = "Zeynep";

  print(student1.age);

  student1.age = -10;

  print(student1.age);
}
