part of ui_kit;

Size maxSquare(BuildContext context) {
  return Size(
      MediaQuery.of(context).size.width > MediaQuery.of(context).size.height
          ? MediaQuery.of(context).size.height
          : MediaQuery.of(context).size.width,
      MediaQuery.of(context).size.width > MediaQuery.of(context).size.height
          ? MediaQuery.of(context).size.height
          : MediaQuery.of(context).size.width);
}
