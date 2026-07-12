class Student {
  String name = "";
  String familyName = "";
  int number = 0;
  int _age = 0;

  Student(this.familyName, this.name, this._age, this.number);

  int saySchoolNumber() {
    return number;
  }

  String objeyiOku() {
    return "Student: $name $familyName, $_age, $number";
  }

  int get age {
    return _age;
  }

  set age(int newAge) {
    if (newAge > 0) {
      _age = newAge;
    } else {
      print("HATA: Bu işlem gerçekleşemez çünkü yaş sıfırdan büyük olmalıdır.");
    }
  }
}
