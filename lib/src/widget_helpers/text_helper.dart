part of ui_kit;

TextStyle listTileTextStyle(context) => Theme.of(context)
    .textTheme
    .bodyMedium!
    .copyWith(fontSize: ResponsiveSizer.of(context).fontSize(2));

extension StringExtension on String {
  String capitalizeFirstLetter() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
