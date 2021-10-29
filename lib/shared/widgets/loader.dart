import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loader extends StatefulWidget {
  final Color color;
  final double size;
  final bool withBgOverlay;

  Loader({this.color = Colors.blue, this.size = 50, this.withBgOverlay = true});

  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: widget.withBgOverlay
            ? Colors.black.withOpacity(0.5)
            : Colors.transparent,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
            child: SpinKitThreeBounce(
                color: widget.color,
                size: widget.size,
                controller: animationController)));
  }
}
