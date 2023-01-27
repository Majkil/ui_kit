part of ui_kit;

Color darkenColor(Color c, {double v = 0.5}) {
  return Color.fromARGB(c.alpha, (c.red * v).round(), (c.green * v).round(),
      (c.blue * v).round());
}

Color lightenColor(Color c,{ double v = 0.3}) {
  return Color.fromARGB(
      c.alpha,
      (c.red + ((255 - c.red) * v).round()),
      (c.green + ((255 - c.green) * v).round()),
      (c.blue + ((255 - c.blue) * v).round()));
}
