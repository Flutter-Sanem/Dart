void main() {
  List<int> numberList = [1, 2, 3, 4, 50, 90, -20];

  // Listedeki elemanları toplayınız.

  // numberList[0] + numberList[1] + numberList[2] + ... + numberList[numberList.length -1]

  int toplam = 0;

  for (var sayac = 0; sayac < numberList.length; sayac++) {
    toplam = numberList[sayac] + toplam;
  }

  print(toplam);
}

//          1 , 2 , 3 , 4 , 5 , 6  ,  7 ,  8
// toplam:  1   3   6   10  60  150   130         
// sayac:   0   1   2   3   4   5     6     