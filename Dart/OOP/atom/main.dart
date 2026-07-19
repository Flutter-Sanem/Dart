import 'atom.dart';
import 'element.dart';
import 'molekul.dart';

void main() {
  Atom hydrogen = Atom(element: Element.hydrogen, neutronCount: 0);
  Atom oxygen = Atom(element: Element.oxygen, neutronCount: 8);
  List<Atom> atoms = [hydrogen, hydrogen, oxygen];

  Molekul water = Molekul(name: "Water", atoms: atoms);

  print(water.formul());
  print("-----------------");
  water.printMolekulInfo();
}
