part of ui_kit;

// ignore: must_be_immutable
class PieChart extends StatefulWidget {
  final bool stacked;
  final List<double> sections;
  final List<Color>? colors;
  Size? size;
  PieChart(
      {Key? key,
      required this.sections,
      this.stacked = false,
      this.size,
      this.colors})
      : super(key: key);

  @override
  State<PieChart> createState() => _PieChartState();
}

class _PieChartState extends State<PieChart>
    with SingleTickerProviderStateMixin {
  List<double> fractions = [];
  late List<Animation<double>> animations = [];
  late AnimationController _controller;

  static const int animationDuration = 1500;

  @override
  void initState() {
    super.initState();
    fractions = List<double>.filled(widget.sections.length, 0.0);
    _controller = AnimationController(
      duration: const Duration(milliseconds: animationDuration),
      vsync: this,
    );
    for (var x = 0; x < widget.sections.length; x++) {
      animations.add(Tween(
              begin: (animationDuration / widget.sections.length) * x,
              end: (animationDuration / widget.sections.length) * x + 1)
          .animate(_controller)
        ..addListener(() {
          setState(() {
            fractions[x] = animations[x].value;
          });
        }));
      animations[x] = CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      );
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    widget.size ??= Size(
        MediaQuery.of(context).size.width > MediaQuery.of(context).size.height
            ? MediaQuery.of(context).size.height
            : MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.width > MediaQuery.of(context).size.height
            ? MediaQuery.of(context).size.height
            : MediaQuery.of(context).size.width);
    var arcer = PieChartPainter(
        colors: widget.colors,
        stacked: widget.stacked,
        sections: widget.sections,
        context: context,
        fractions: fractions);
    var obj2Render = CustomPaint(size: widget.size!, painter: arcer);
    return Container(
        height: widget.size?.height,
        width: widget.size?.width,
        color: Colors.transparent,
        child: Stack(children: [
          Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width >
                      MediaQuery.of(context).size.height
                  ? (widget.size!.height / 2)
                  : (widget.size!.width / 8)),
              child: obj2Render),
        ]));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
