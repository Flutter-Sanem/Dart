void main() {
  // bir sayının faktoriyelini almak
  // ornek: 5! = 5*4*3*2*1 = 120

  int number = 3;

  int sayac = 2;
  int faktoriyel = 1;

  while (sayac <= number) {
    faktoriyel = sayac * faktoriyel;
    sayac++;
  }

  print(faktoriyel);
}


// 1. aşama: 1*1 = 1
// 2. aşama: 1 = 2*1 = 2
// 3. aşama: 2 = 3*2 = 6
// 4. aşama: 6 = 4*6 = 24
// 5. aşama: 24 = 5*24 = 120

// 120