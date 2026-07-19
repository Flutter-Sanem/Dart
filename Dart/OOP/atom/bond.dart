import 'atom.dart';

/// Covalent bond multiplicity.
enum BondOrder {
  single(1),
  double(2),
  triple(3);

  final int value;

  const BondOrder(this.value);

  @override
  String toString() => name;
}

/// Undirected covalent bond between two distinct atom instances.
class Bond {
  final Atom a;
  final Atom b;
  final BondOrder order;

  Bond({
    required this.a,
    required this.b,
    this.order = BondOrder.single,
  }) {
    if (identical(a, b)) {
      throw ArgumentError('A bond cannot connect an atom to itself');
    }
  }

  bool involves(Atom atom) => identical(a, atom) || identical(b, atom);

  Atom other(Atom atom) {
    if (identical(a, atom)) return b;
    if (identical(b, atom)) return a;
    throw ArgumentError('Atom is not an endpoint of this bond');
  }

  /// Same endpoints (either order) and same bond order.
  bool sameConnectionAs(Bond other) {
    final samePair =
        (identical(a, other.a) && identical(b, other.b)) ||
        (identical(a, other.b) && identical(b, other.a));
    return samePair && order == other.order;
  }

  /// Same undirected endpoints, ignoring bond order.
  bool connectsSameAtomsAs(Bond other) {
    return (identical(a, other.a) && identical(b, other.b)) ||
        (identical(a, other.b) && identical(b, other.a));
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Bond && sameConnectionAs(other);
  }

  @override
  int get hashCode {
    final ha = identityHashCode(a);
    final hb = identityHashCode(b);
    final pair = ha <= hb ? Object.hash(ha, hb) : Object.hash(hb, ha);
    return Object.hash(pair, order);
  }

  @override
  String toString() => '${a.element.symbol}-${b.element.symbol} (${order.name})';
}
