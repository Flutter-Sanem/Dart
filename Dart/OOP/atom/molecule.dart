import 'atom.dart';
import 'bond.dart';
import 'element.dart';

/// Connected graph of atoms and covalent bonds.
class Molecule {
  final String name;
  final List<Atom> atoms;
  final List<Bond> bonds;

  Molecule({
    required this.name,
    required List<Atom> atoms,
    required List<Bond> bonds,
  }) : atoms = List.unmodifiable(atoms),
       bonds = List.unmodifiable(bonds) {
    if (atoms.isEmpty) {
      throw ArgumentError('A molecule must contain at least one atom');
    }
    _validateBondEndpoints();
    _validateNoDuplicateBonds();
    _validateValence();
    _validateConnectivity();
  }

  /// Hill-system molecular formula (ASCII counts, e.g. H2O, CH4).
  String get formula {
    final counts = <Element, int>{};
    for (final atom in atoms) {
      counts[atom.element] = (counts[atom.element] ?? 0) + 1;
    }

    final parts = <String>[];

    void append(Element element) {
      final count = counts.remove(element);
      if (count == null) return;
      parts.add(count == 1 ? element.symbol : '${element.symbol}$count');
    }

    // Hill order: C, then H, then remaining symbols alphabetically.
    append(Element.carbon);
    append(Element.hydrogen);

    final remaining = counts.keys.toList()
      ..sort((a, b) => a.symbol.compareTo(b.symbol));
    for (final element in remaining) {
      append(element);
    }

    return parts.join();
  }

  int usedValence(Atom atom) {
    _requireMember(atom);
    var total = 0;
    for (final bond in bonds) {
      if (bond.involves(atom)) {
        total += bond.order.value;
      }
    }
    return total;
  }

  List<Bond> bondsOf(Atom atom) {
    _requireMember(atom);
    return bonds.where((bond) => bond.involves(atom)).toList(growable: false);
  }

  void describe() {
    print('$name ($formula)');
    print('Atoms (${atoms.length}):');
    for (final atom in atoms) {
      print(
        '  - ${atom.describe()} | valence ${usedValence(atom)}/${atom.maxValence}',
      );
    }
    print('Bonds (${bonds.length}):');
    for (final bond in bonds) {
      print('  - $bond');
    }
  }

  void _requireMember(Atom atom) {
    if (!_containsAtom(atom)) {
      throw ArgumentError('Atom is not part of this molecule');
    }
  }

  bool _containsAtom(Atom atom) {
    for (final candidate in atoms) {
      if (identical(candidate, atom)) return true;
    }
    return false;
  }

  void _validateBondEndpoints() {
    for (final bond in bonds) {
      if (!_containsAtom(bond.a) || !_containsAtom(bond.b)) {
        throw ArgumentError(
          'Bond endpoints must be atoms that belong to the molecule',
        );
      }
    }
  }

  void _validateNoDuplicateBonds() {
    for (var i = 0; i < bonds.length; i++) {
      for (var j = i + 1; j < bonds.length; j++) {
        if (bonds[i].connectsSameAtomsAs(bonds[j])) {
          throw ArgumentError(
            'Duplicate bond between the same pair of atoms: ${bonds[i]}',
          );
        }
      }
    }
  }

  void _validateValence() {
    for (final atom in atoms) {
      final used = usedValence(atom);
      if (used > atom.maxValence) {
        throw ArgumentError(
          'Valence exceeded for ${atom.element.displayName}: '
          'used $used, max ${atom.maxValence}',
        );
      }
    }
  }

  /// All atoms must form a single connected component via bonds.
  void _validateConnectivity() {
    if (atoms.length == 1) {
      if (bonds.isNotEmpty) {
        throw ArgumentError('A single-atom molecule cannot have bonds');
      }
      return;
    }

    if (bonds.isEmpty) {
      throw ArgumentError(
        'Molecule with multiple atoms must include bonds connecting them',
      );
    }

    final visited = <Atom>{};
    final queue = <Atom>[atoms.first];
    visited.add(atoms.first);

    while (queue.isNotEmpty) {
      final current = queue.removeAt(0);
      for (final bond in bonds) {
        if (!bond.involves(current)) continue;
        final neighbor = bond.other(current);
        if (visited.add(neighbor)) {
          queue.add(neighbor);
        }
      }
    }

    if (visited.length != atoms.length) {
      throw ArgumentError(
        'Molecule atoms must form one connected component '
        '(found ${visited.length} of ${atoms.length})',
      );
    }
  }
}
