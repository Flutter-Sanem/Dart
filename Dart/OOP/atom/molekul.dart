import 'atom.dart';

class Molekul {
  final String name;
  final List<Atom> atoms;

  Molekul({required this.name, required this.atoms});

  void printMolekulInfo() {
    for (var atom in this.atoms) {
      print(atom.element.displayName);
      print(atom.showInfo());
      print("--------------");
    }
  }

  String formul() {
    List<String> symbols = [];
    for (var atom in this.atoms) {
      symbols.add(atom.element.symbol);
    }
    return symbols.join("-");
  }
}
