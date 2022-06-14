// //part of ui_kit;
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
//
//
