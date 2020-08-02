import 'package:flutter/material.dart';

class SlidingBody extends StatelessWidget {
  SlidingBody({
    Key key,
    @required this.initialOffsetX,
    @required this.initialOffsetY,
    @required this.child,
    @required this.curve,
    @required this.animation,
  }) : super(key: key);

  final double initialOffsetX;
  final double initialOffsetY;
  final Curve curve;
  final Widget child;
  final Animation animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset(initialOffsetX, initialOffsetY),
              end: Offset(0, 0),
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: curve,
              ),
            ),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
