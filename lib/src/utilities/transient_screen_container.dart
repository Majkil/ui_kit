import 'dart:async';

import 'package:flutter/cupertino.dart';

class TransientScreen extends StatefulWidget {
  //Specified duration in seconds
  final int duration;

  //Action to be exectute after duration has passed
  final Function executable;

  const TransientScreen({Key? key, required this.duration, required this.executable})
      : super(key: key);

  @override
  TransientScreenState createState() => TransientScreenState();
}

class TransientScreenState extends State<TransientScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: widget.duration), () {widget.executable();});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
