// for(sayac; koşul; sayacın artış mik){
//    işlemler...
// }
void main() {
  List<int> sayilar = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  for (int sayac = 0; sayac < sayilar.length; sayac = sayac + 1) {
    print(sayilar[sayac]);
  }
}
