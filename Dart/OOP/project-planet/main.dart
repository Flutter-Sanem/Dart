import 'planet.dart';

void main() {
  print("Main çalıştı");

  Planet earth = Planet("Dünya", false, true, false, 40000);

  print(earth.toString());
  earth.kendiEtrafindaDon();
}
