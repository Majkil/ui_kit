part of ui_kit;

class GlassCard extends StatelessWidget {
  final double blurIntensity;
  final List<Color> gradientColors;
  final double opacity;
  final double borderRadius;
  final Widget child;
  final double height;
  final double width;
  const GlassCard(
      {Key? key,
      required this.child,
      required this.gradientColors,
      required this.height,
      required this.width,
      this.blurIntensity = 4,
      this.opacity = 0.4,
      this.borderRadius = 20.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: SizedBox(
          width: width,
          height: height,
          child: Stack(
            children: [
              //blur
              BackdropFilter(
                  filter: ImageFilter.blur(
                      sigmaX: blurIntensity, sigmaY: blurIntensity)),
              //gradient
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadius),
                    border:
                        Border.all(color: Colors.white.withOpacity(opacity)),
                        
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: gradientColors.map((element) {
                          return element.withOpacity(opacity);
                        }).toList())),
              ),
              //content
              child
            ],
          ),
        ),
      ),
    );
  }
}

class NeumorphicCard extends StatelessWidget {
  const NeumorphicCard(
      {Key? key,
      required this.neushadows,
      required this.child,
      required this.height,
      required this.width,
      required this.backgroundColor,
      required this.borderRadius})
      : super(key: key);
  final Color backgroundColor;
  final double neushadows;
  final double borderRadius;
  final Widget child;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    Offset distance = Offset(neushadows, neushadows);
    return Center(
        child: Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: lightenColor(backgroundColor, v: 0.3),
              width: 1,
              style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(borderRadius),
          color:  backgroundColor,
          boxShadow: [
            BoxShadow(
                offset: distance,
                blurRadius: borderRadius,
                color: darkenColor(backgroundColor, v: 0.5)),
            BoxShadow(
                offset: -distance,
                blurRadius: neushadows,
                color: lightenColor(backgroundColor, v: 0.3)),
          ]),
      width: width,
      height: height,
      child: child,
    ));
  }
}
