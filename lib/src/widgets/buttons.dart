part of ui_kit;
//
// class ActionButton extends StatelessWidget {
//   final String? text;
//   final IconData? icon;
//   final Function action;
//
//   const ActionButton({Key? key, this.text, this.icon, required this.action})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var temp = <Widget>[];
//     if (icon != null) {
//       temp.add(Icon(icon));
//
//       temp.add(const SizedBox(width: 10, height: 10));
//     }
//     if (text != null) {
//       temp.add(Text(text!));
//     }
//     var row = Row(
//       mainAxisSize: MainAxisSize.min,
//       children: temp,
//     );
//     return RawMaterialButton(
//         onPressed: () => {action()},
//         splashColor: const Color.fromARGB(128, 15, 54, 256),
//         fillColor: const Color.fromARGB(128, 15, 54, 38),
//         shape: const StadiumBorder(),
//         child: Padding(padding: const EdgeInsets.all(8.0), child: row));
//   }
// }
//
// class RoutingButton extends StatelessWidget {
//   final IconData? icon;
//   final String? text;
//   final Widget targetRoute;
//
//   const RoutingButton(
//       {Key? key, this.text, this.icon, required this.targetRoute})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var temp = <Widget>[];
//     if (icon != null) {
//       temp.add(Icon(icon!));
//
//       temp.add(const SizedBox(width: 10, height: 10));
//     }
//     if (text != null) {
//       temp.add(Text(text!));
//     }
//
//     var row = Row(mainAxisSize: MainAxisSize.min, children: temp);
//     return RawMaterialButton(
//         onPressed: () {
//           Navigator.of(context).push(_createRoute());
//         },
//         splashColor: const Color.fromARGB(128, 15, 54, 256),
//         fillColor: const Color.fromARGB(128, 15, 54, 38),
//         shape: const StadiumBorder(),
//         child: Padding(padding: const EdgeInsets.all(8.0), child: row));
//   }
//
//   Route _createRoute() {
//     return PageRouteBuilder(
//       pageBuilder: (context, animation, secondaryAnimation) =>
//           AppFrame(title: '', contents: targetRoute, menuHeader: Text('header'),),
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         return child;
//       },
//     );
//   }
// }


var _default_offset = 13.0;
var _default_blur_radius = 18.0;
class MomentaryNeumorphicButton extends StatefulWidget {
  final Function buttonAction;
  final bool indentedPush;
  final Widget contents;
  final Color backgroundColor;
  const MomentaryNeumorphicButton(
      {Key? key,
      required this.indentedPush,
      required this.buttonAction,
      required this.backgroundColor,
      required this.contents})
      : super(key: key);

  @override
  State<MomentaryNeumorphicButton> createState() =>
      _MomentaryNeumorphicButtonState();
}

class _MomentaryNeumorphicButtonState extends State<MomentaryNeumorphicButton> {
  bool isPressed = true;

  @override
  Widget build(BuildContext context) {
    double blurRadius = isPressed ? 5.0 : _default_blur_radius;
    Offset distance = isPressed ? const Offset(5, 5) : Offset(_default_offset, _default_offset);

    Color shadow = darkenColor(widget.backgroundColor, v: 0.5);

    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Listener(
        onPointerUp: (_) => setState(() {
          isPressed = false;
        }),
        onPointerDown: (_) => setState(() {
          isPressed = true;
          widget.buttonAction();
        }),
        child: AnimatedContainer(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: widget.backgroundColor,
                boxShadow: [
                  BoxShadow(
                      offset: distance,
                      blurRadius: blurRadius,
                      color: shadow,
                      inset: widget.indentedPush ? isPressed : false),
                  BoxShadow(
                      offset: -distance,
                      blurRadius: blurRadius,
                      color: lightenColor(widget.backgroundColor,  v:0.15),
                      inset: widget.indentedPush ? isPressed : false),
                ]),
            duration: const Duration(milliseconds: 100),
            child: widget.contents),
      ),
    );
  }
}

class ToggleableNeumorphicButton extends StatefulWidget {
  final Function buttonAction;
  final Widget contents;
  final Color backgroundColor;

  const ToggleableNeumorphicButton(
      {Key? key,
      required this.buttonAction,
      required this.contents,
      required this.backgroundColor})
      : super(key: key);

  @override
  State<ToggleableNeumorphicButton> createState() =>
      _ToggleableNeumorphicButtonState();
}

class _ToggleableNeumorphicButtonState
    extends State<ToggleableNeumorphicButton> {
  bool isPressed = true;

  @override
  Widget build(BuildContext context) {
    double blurRadius = isPressed ? 5.0 : _default_blur_radius;
    Offset distance = isPressed ? const Offset(5, 5) :  Offset(_default_offset, _default_offset);

    Color shadow = darkenColor(widget.backgroundColor, v: 0.5);

    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isPressed = !isPressed;
          });
          widget.buttonAction();
        },
        child: AnimatedContainer(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: widget.backgroundColor,
                boxShadow: [
                  BoxShadow(
                      offset: distance,
                      blurRadius: blurRadius,
                      color: shadow,
                      inset: isPressed),
                  BoxShadow(
                      offset: -distance,
                      blurRadius: blurRadius,
                      color: lightenColor(widget.backgroundColor,v:0.15),
                      inset: isPressed),
                ]),
            duration: const Duration(milliseconds: 100),
            child: widget.contents),
      ),
    );
  }
}
