part of ui_kit;
class PieChartPainter extends CustomPainter {
  List<double> sections;
  bool stacked;
  List<double> fractions;
  BuildContext context;
  List<Color>? colors;
  PieChartPainter(
      {required this.sections,
        required this.stacked,
        required this.context,
        required this.fractions,
        this.colors})
      : super();

  @override
  void paint(Canvas canvas, Size size) {
    if (!stacked &&
        sections.reduce((value, element) =>
        double.parse(value.toStringAsPrecision(3)) +
            double.parse(element.toStringAsPrecision(3))) >
            1) {
      throw Exception('Sections total value must not exceed 1');
    }
    var gap = math.pi * 2 / 360;
    if (sections.reduce((value, element) =>
    double.parse(value.toStringAsPrecision(3)) +
        double.parse(element.toStringAsPrecision(3))) ==
        1) {
      gap = 0;
    }

    double containerThickness = size.width / 4;
    double stackedThickness = containerThickness / sections.length;
    double centreX = size.width / 2;
    double centreY = size.height / 2;
    Offset offset = Offset(centreX, centreY);
    double circumference = 2 * math.pi * (size.width / 2);
    var roundbuttAngle =
        (((containerThickness * 0.7) / 2) / circumference) * math.pi * 2;
    roundbuttAngle = 0;
    var position = -math.pi / 2 + gap + roundbuttAngle;

    colors ??= [
      Colors.green,
      Colors.blue,
      Colors.red,
      Colors.purple,
      Colors.pink,
    ];
    // draw background container
    final Paint containerPaint = Paint()
      ..color = const Color.fromRGBO(0, 0, 0, 0.04)
      ..style = PaintingStyle.stroke
      ..strokeWidth = containerThickness;

    canvas.drawCircle(offset, size.width / 2, containerPaint);

    //draw sections
    for (var x = 0; x < sections.length; x++) {
      //stacked pie into gauge
      if (!stacked) {
        var paint = Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = containerThickness * 0.7
          ..strokeCap = StrokeCap.butt;

        Rect drawingRect =
        Rect.fromCircle(center: offset, radius: (size.width / 2));

        canvas.drawArc(
            drawingRect,
            position,
            (((math.pi * 2) * (sections[x])) - 2 * roundbuttAngle) *
                fractions[x],
            false,
            paint..color = colors![x % colors!.length]);

        position = (position + math.pi * 2 * sections[x]) + gap;
      } else if (stacked) {
        var paint = Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = containerThickness / (sections.length + 2)
          ..strokeCap = StrokeCap.butt;

        Rect drawingRect = Rect.fromCircle(
            center: offset,
            radius: (size.width / 2) -
                (stackedThickness / 2 * (sections.length / 2)) +
                ((stackedThickness / 2) * x));

        canvas.drawArc(
            drawingRect,
            position,
            ((math.pi * 2) * sections[x] * fractions[x]),
            false,
            paint..color = colors![x]);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
