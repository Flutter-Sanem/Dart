import 'element.dart';

class Atom {
  final Element element;
  final int neutronCount;
  final int electronCount;

  Atom({required this.element, required this.neutronCount, int? electronCount})
    : electronCount = electronCount ?? element.atomicNumber {
    if (neutronCount < 0) {
      throw ArgumentError("Nötron sayısı sıfırdan küçük olamaz");
    }

    if (this.electronCount < 0) {
      throw ArgumentError("Elektron sayısı sıfırdan küçük olamaz");
    }
  }

  int get protonCount => element.atomicNumber;
  int get massNumber => protonCount + neutronCount;
  int get charge => protonCount - electronCount;
  bool get isNeutral => charge == 0;

  String showInfo() {
    return "Atom Numarası: ${element.atomicNumber}\nProton Sayısı: ${protonCount}\nAtom Ağırlığı: $massNumber\nElektrik yükü: $charge";
  }
}
