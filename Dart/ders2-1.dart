// Döngüler - Loops

void main() {
  // List<String> kisiler = ["Ali", "Veli", "Ayşe", "Fatma", "Hasan", "Hüseyin"];

  // print("Listedeki ilk kişiye davetiyeyi ver");
  // print("Listedeki ikinci kişiye davetiyeyi ver");
  // print("Listedeki üçüncü kişiye davetiyeyi ver");

  // kisiler.length - 1 = 5
  // print(kisiler[kisiler.length - 1]); // Hüseyin

  // while(koşul) {
  // eğer koşul doğruysa çalışır ve koşul doğru olduğu müddetçe çalışmaya devam eder
  // }

  // İLK ÖRNEK

  // int sayac = 0;
  // while (sayac < kisiler.length) {
  //   print("${sayac + 1}. kişiye davetiye ver");
  //   sayac = sayac + 1;
  // }

  // Bir listedeki elemanları tek tek yazdıran kod
  var myList = ["a", "b", "c", 1, 2, 3, true, false];

  int sayac = 0;
  while (sayac < myList.length) {
    print(myList[sayac]);
    sayac = sayac + 1;
  }
}
