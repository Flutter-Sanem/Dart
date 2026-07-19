import 'element_category.dart';

/// Chemical element with identity and common bonding capacity.
enum Element {
  hydrogen(
    displayName: 'Hydrogen',
    symbol: 'H',
    atomicNumber: 1,
    category: ElementCategory.nonMetal,
    maxValence: 1,
  ),
  helium(
    displayName: 'Helium',
    symbol: 'He',
    atomicNumber: 2,
    category: ElementCategory.nobleGas,
    maxValence: 0,
  ),
  lithium(
    displayName: 'Lithium',
    symbol: 'Li',
    atomicNumber: 3,
    category: ElementCategory.alkaliMetal,
    maxValence: 1,
  ),
  carbon(
    displayName: 'Carbon',
    symbol: 'C',
    atomicNumber: 6,
    category: ElementCategory.nonMetal,
    maxValence: 4,
  ),
  oxygen(
    displayName: 'Oxygen',
    symbol: 'O',
    atomicNumber: 8,
    category: ElementCategory.nonMetal,
    maxValence: 2,
  );

  final String displayName;
  final String symbol;

  /// Proton count for a neutral atom of this element.
  final int atomicNumber;

  final ElementCategory category;

  /// Maximum sum of bond orders this element typically forms.
  final int maxValence;

  const Element({
    required this.displayName,
    required this.symbol,
    required this.atomicNumber,
    required this.category,
    required this.maxValence,
  });
}
