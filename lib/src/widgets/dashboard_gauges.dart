part of ui_kit;

class DashboardRoundGauge extends StatefulWidget {
  final List<double> values;
  final Color? color1;
  final Color? color2;
  final Color? color3;
  final Color? emptyColor;
  final Size? size;
  const DashboardRoundGauge(
      {Key? key,
      required this.values,
      this.color1,
      this.color2,
      this.color3,
      this.emptyColor,
      this.size})
      : assert(values.length > 0, "Chart values are required"),
        assert(values.length <= 3, "Chart has too many values, maximum of 3"),
        super(key: key);

  @override
  State<DashboardRoundGauge> createState() => _DashboardRoundGaugeState();
}

class _DashboardRoundGaugeState extends State<DashboardRoundGauge> {
  @override
  Widget build(BuildContext context) {
    var wSize = widget.size ?? maxSquare(context);
    var cPainter = DashboardPainter(
      values: widget.values,
      size: wSize,
      color1: widget.color1,
      color2: widget.color2,
      color3: widget.color3,
      emptyColor: widget.emptyColor,
    );
    return CustomPaint(size: wSize, painter: cPainter);
  }
}

class DashboardFlatBottomGauge extends StatefulWidget {
  final List<double> values;
  final Color? color1;
  final Color? color2;
  final Color? color3;
  final Color? emptyColor;
  final Size? size;

  const DashboardFlatBottomGauge({
    Key? key,
    required this.values,
    this.color1,
    this.color2,
    this.color3,
    this.emptyColor,
    this.size,
  })  : assert(values.length > 0, "Chart values are required"),
        assert(values.length <= 3, "Chart has too many values, maximum of 3"),
        super(key: key);
  @override
  State<DashboardFlatBottomGauge> createState() =>
      _DashboardFlatBottomGaugeState();
}

class _DashboardFlatBottomGaugeState extends State<DashboardFlatBottomGauge> {
  @override
  Widget build(BuildContext context) {
    var wSize = widget.size ?? maxSquare(context);

    var cPainter = DashboardPainter(
        color1: widget.color1,
        color2: widget.color2,
        color3: widget.color3,
        emptyColor: widget.emptyColor,
        values: widget.values,
        startAngle: 3 * math.pi / 4,
        rangeAngle: 270 * math.pi / 180,
        size: wSize);
    return CustomPaint(size: wSize, painter: cPainter);
  }
}
