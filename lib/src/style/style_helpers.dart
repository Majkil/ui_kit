part of ui_kit;

Color darkenColor(Color c, double v) {
  return Color.fromARGB(c.alpha, (c.red * v).round(), (c.green * v).round(),
      (c.blue * v).round());
}

Color lightenColor(Color c, double v) {
  return Color.fromARGB(
      c.alpha,
      (c.red + ((255 - c.red) * v).round()),
      (c.green + ((255 - c.green) * v).round()),
      (c.blue + ((255 - c.blue) * v).round()));
}
