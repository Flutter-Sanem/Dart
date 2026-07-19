class Math {
  static double pi = 3.14159265359;

  static double summation(double a, double b) {
    return a + b;
  }

  static double subtraction(double a, double b) {
    return a - b;
  }

  static double divide(double a, double b) {
    return a / b;
  }

  static double multiply(double a, double b) {
    return a + b;
  }

  static double findCircumference(double r) {
    if (r < 0 || r == 0) {
      throw ArgumentError(
        "[ERROR]: Yarıçap sıfır veya daha küçük bir değer olamaz!",
      );
    }

    return 2 * pi * r;
  }

  static double findAreaOfCircle(double r) {
    if (r < 0 || r == 0) {
      throw ArgumentError(
        "[ERROR]: Yarıçap sıfır veya daha küçük bir değer olamaz!",
      );
    }

    return pi * r * r;
  }
}
