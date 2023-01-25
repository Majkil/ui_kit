part of ui_kit;

class DashboardPainter extends CustomPainter {
  late Color? color1;
  late Color? color2;
  late Color? color3;
  Color? emptyColor;
  Size size;
  List<double> values;
  double startAngle;
  double rangeAngle;
  String? centreText;
  DashboardPainter(
      {this.color1,
      this.color2,
      this.color3,
      this.emptyColor,
      this.centreText,
      required this.size,
      this.startAngle = top,
      this.rangeAngle = fullTurn,
      required this.values}) {
    color1 ??= Colors.blue.shade700;
    color2 ??= Colors.purple.shade700;
    color3 ??= Colors.yellow.shade600;
    emptyColor ??= Colors.grey.shade100;
  }

  @override
  void paint(Canvas canvas, Size size) {
    double maxStroke = size.width / 10;
    print(maxStroke);
    var emptyPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = maxStroke < 20 ? maxStroke : 20
      ..strokeCap = StrokeCap.round
      ..color = emptyColor!;

    var paint1 = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = maxStroke < 20 ? maxStroke : 20
      ..strokeCap = StrokeCap.round
      ..color = color1!;

    var paint2 = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = maxStroke < 20 ? maxStroke : 20
      ..strokeCap = StrokeCap.round
      ..color = color2!;

    var paint3 = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = maxStroke < 20 ? maxStroke : 20
      ..strokeCap = StrokeCap.round
      ..color = color3!;

    //getting centre point for guage as the centre of the given size
    Offset centrePoint = Offset(size.width / 2, size.height / 2);
    // maximum radius leaving 0.05 padding
    double maxRadius = size.width * 0.45;

    Rect drawingRect1 = Rect.fromCircle(center: centrePoint, radius: maxRadius);
    // draws a full empty circle
    canvas.drawArc(drawingRect1, startAngle, rangeAngle, false, emptyPaint);
    //canvas.drawCircle(centrePoint, maxRadius, emptyPaint);
    // draws the first value
    canvas.drawArc(
        drawingRect1, startAngle, rangeAngle * values[0], false, paint1);

    if (values.length >= 2 && values[1] != null) {
      Rect drawingRect2 =
          Rect.fromCircle(center: centrePoint, radius: maxRadius - maxStroke);
      canvas.drawArc(drawingRect2, startAngle, rangeAngle, false, emptyPaint);
      canvas.drawArc(
          drawingRect2, startAngle, rangeAngle * values[1], false, paint2);
    }
    if (values.length >= 3 && values[2] != null) {
      //canvas.drawCircle(centrePoint, maxRadius - 60, emptyPaint);
      Rect drawingRect3 = Rect.fromCircle(
          center: centrePoint, radius: maxRadius - maxStroke * 2);
      canvas.drawArc(drawingRect3, startAngle, rangeAngle, false, emptyPaint);
      canvas.drawArc(
          drawingRect3, startAngle, rangeAngle * values[2], false, paint3);
    }
    if (centreText != null) {
      TextSpan span = TextSpan(
          text: centreText,
          style: TextStyle(fontSize: 30, color: Colors.black));
      TextPainter tp = TextPainter(textDirection: TextDirection.ltr)
        ..text = span
        ..textAlign = TextAlign.justify
        ..layout();
      var textpos =
          Offset(centrePoint.dx - tp.width / 2, centrePoint.dy - tp.height / 2);
      tp.paint(canvas, textpos);
    }

    // final ParagraphBuilder paragraphBuilder = ParagraphBuilder(ParagraphStyle(
    //   fontSize: 20,
    //   fontFamily: "montserrrat",
    //   fontStyle: FontStyle.normal,
    //   fontWeight: FontWeight.w400,
    //   textAlign: TextAlign.justify,
    // ))
    //   ..addText("sad");

    // canvas.drawParagraph(paragraphBuilder.build(), Offset.zero);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
