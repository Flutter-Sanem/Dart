class Planet {
  String name = "";
  bool circle = false;
  bool light = false;
  bool life = false;
  double perimeterLength = 0;

  void kendiEtrafindaDon() {
    print("Gezegen dönüyor.");
  }

  Planet(this.name, this.circle, this.life, this.light, this.perimeterLength);

  @override
  String toString() {
    return "$name, circle: $circle, light: $light, life: $life, perimeterLength: $perimeterLength";
  }
}
