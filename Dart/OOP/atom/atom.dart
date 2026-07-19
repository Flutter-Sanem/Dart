import 'element.dart';

/// A concrete atom instance (isotope / ion via neutron and electron counts).
class Atom {
  final Element element;
  final int neutronCount;
  final int electronCount;

  Atom({
    required this.element,
    required this.neutronCount,
    int? electronCount,
  }) : electronCount = electronCount ?? element.atomicNumber {
    if (neutronCount < 0) {
      throw ArgumentError.value(
        neutronCount,
        'neutronCount',
        'Neutron count cannot be negative',
      );
    }
    if (this.electronCount < 0) {
      throw ArgumentError.value(
        this.electronCount,
        'electronCount',
        'Electron count cannot be negative',
      );
    }
  }

  int get protonCount => element.atomicNumber;
  int get massNumber => protonCount + neutronCount;
  int get charge => protonCount - electronCount;
  bool get isNeutral => charge == 0;
  int get maxValence => element.maxValence;

  String describe() {
    final chargeLabel = charge == 0
        ? 'neutral'
        : (charge > 0 ? 'charge +$charge' : 'charge $charge');
    return '${element.displayName} (${element.symbol}): '
        'Z=${element.atomicNumber}, A=$massNumber, '
        'e-=$electronCount ($chargeLabel)';
  }

  @override
  String toString() =>
      '${element.symbol}[A=$massNumber${charge == 0 ? '' : ', q=$charge'}]';
}
