import 'atom.dart';
import 'bond.dart';
import 'element.dart';
import 'molecule.dart';

void main() {
  final water = _buildWater();
  water.describe();

  print('-----------------');

  final methane = _buildMethane();
  methane.describe();

  print('-----------------');
  print('Invalid valence attempt (3 hydrogens on oxygen):');

  try {
    _buildInvalidWater();
  } on ArgumentError catch (error) {
    print('  Rejected: ${error.message}');
  }
}

Molecule _buildWater() {
  final h1 = Atom(element: Element.hydrogen, neutronCount: 0);
  final h2 = Atom(element: Element.hydrogen, neutronCount: 0);
  final o = Atom(element: Element.oxygen, neutronCount: 8);

  return Molecule(
    name: 'Water',
    atoms: [h1, h2, o],
    bonds: [
      Bond(a: h1, b: o),
      Bond(a: h2, b: o),
    ],
  );
}

Molecule _buildMethane() {
  final c = Atom(element: Element.carbon, neutronCount: 6);
  final h1 = Atom(element: Element.hydrogen, neutronCount: 0);
  final h2 = Atom(element: Element.hydrogen, neutronCount: 0);
  final h3 = Atom(element: Element.hydrogen, neutronCount: 0);
  final h4 = Atom(element: Element.hydrogen, neutronCount: 0);

  return Molecule(
    name: 'Methane',
    atoms: [c, h1, h2, h3, h4],
    bonds: [
      Bond(a: c, b: h1),
      Bond(a: c, b: h2),
      Bond(a: c, b: h3),
      Bond(a: c, b: h4),
    ],
  );
}

Molecule _buildInvalidWater() {
  final h1 = Atom(element: Element.hydrogen, neutronCount: 0);
  final h2 = Atom(element: Element.hydrogen, neutronCount: 0);
  final h3 = Atom(element: Element.hydrogen, neutronCount: 0);
  final o = Atom(element: Element.oxygen, neutronCount: 8);

  return Molecule(
    name: 'Invalid water',
    atoms: [h1, h2, h3, o],
    bonds: [
      Bond(a: h1, b: o),
      Bond(a: h2, b: o),
      Bond(a: h3, b: o),
    ],
  );
}
