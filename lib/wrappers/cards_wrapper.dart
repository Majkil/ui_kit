part of ui_kit;

class UiCards {
  static GlassCard glassCard(
          {Key? key,
          required child,
          required gradientColors,
          required height,
          required width,
          blurIntensity = 4,
          opacity = 0.4,
          borderRadius = 20.0}) =>
      GlassCard(
          child: child,
          gradientColors: gradientColors,
          height: height,
          width: width);

  static NeumorphicCard neumorphicCard(
          {Key? key,
          required neushadows,
          required child,
          required height,
          required width,
          required backgroundColor,
          required borderRadius}) =>
      NeumorphicCard(
          neushadows: neushadows,
          child: child,
          height: height,
          width: width,
          backgroundColor: backgroundColor,
          borderRadius: borderRadius);
}
