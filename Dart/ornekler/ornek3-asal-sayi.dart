// Asal sayı nedir: yalnızca kendisine ve 1'e bölünen sayıalra salan denir.
// Örneğin: 2,3,5,7,11,13,17

void main() {
  int number = 10;
  int sayac = 2;
  bool asalMi = true;

  while (sayac < number) {
    if (number % sayac == 0) {
      asalMi = false;
      break;
    }
    sayac++;
  }

  print("Sayaç ${sayac - 1} kez çalıştı");

  if (asalMi) {
    print("Sayı asaldır");
  } else {
    print("Sayı asal değildir.");
  }
}
