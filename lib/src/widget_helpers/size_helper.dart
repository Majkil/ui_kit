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

double verticalViewHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double getScreenPercentSize(BuildContext context, double percent) {
  return (MediaQuery.of(context).size.height * percent) / 100;
}

class ResponsiveSizer {
  static ScalingQuery of(context) {
    return ScalingQuery(context);
  }
}

class ScalingQuery {
  final _guidelineBaseWidth = 350;
  final _guidelineBaseHeight = 680;

  double _shortDimension = 0;
  double _longDimension = 0;

  ScalingQuery(context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    _shortDimension = width < height ? width : height;
    _longDimension = width < height ? height : width;
  }

  double fontSize(double size) {
    var tempLongDimension = (16 / 9) * _shortDimension;
    return sqrt(pow(tempLongDimension, 2) + pow(_shortDimension, 2)) *
        (size / 100);
  }

  double scale(double size) {
    return _shortDimension / _guidelineBaseWidth * size;
  }

  double verticalScale(double size) {
    return _longDimension / _guidelineBaseHeight * size;
  }

  double moderateScale(double size, [double factor = 0.5]) {
    return size + (scale(size) - size) * factor;
  }

  double hp(size) {
    return (_longDimension * size) / 100;
  }

  double wp(size) {
    return (_shortDimension * size) / 100;
  }
}
