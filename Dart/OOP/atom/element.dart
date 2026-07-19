import 'element-category.dart';

enum Element {
  hydrogen(
    displayName: "Hidrojen",
    symbol: "H",
    atomicNumber: 1,
    category: ElementCategory.nonMetal,
  ),
  helium(
    displayName: "Helyum",
    symbol: "He",
    atomicNumber: 2,
    category: ElementCategory.nobleGas,
  ),
  lithium(
    displayName: "Lityum",
    symbol: "Li",
    atomicNumber: 3,
    category: ElementCategory.alkaliMetal,
  ),
  carbon(
    displayName: "Karbon",
    symbol: "C",
    atomicNumber: 6,
    category: ElementCategory.nonMetal,
  ),
  oxygen(
    displayName: "Oksijen",
    symbol: "O",
    atomicNumber: 8,
    category: ElementCategory.nonMetal,
  );

  final String displayName;
  final String symbol;

  /// Aynı zamanda proton sayısıdır.
  final int atomicNumber;

  final ElementCategory category;

  const Element({
    required this.displayName,
    required this.symbol,
    required this.atomicNumber,
    required this.category,
  });
}
