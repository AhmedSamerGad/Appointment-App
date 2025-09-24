import 'package:flutter/material.dart';

class AnimationEffect extends StatefulWidget {
  const AnimationEffect({
    super.key,
    required this.controller,
    required this.child,
    required this.drawerWidth,
  });
  final AnimationController controller;
  final Widget child;
  final double drawerWidth;

  @override
  State<AnimationEffect> createState() => _AnimationEffectState();
}

class _AnimationEffectState extends State<AnimationEffect> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, child) {
        double slide = widget.drawerWidth * widget.controller.value * 0.8;
        double scale = 1 - (widget.controller.value * 0.2);
        double rotateY = -widget.controller.value * 0.5;

        return Transform(
          alignment: Alignment.centerLeft,
          transform:
              Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..translate(slide)
                ..scale(scale)
                ..rotateY(rotateY),
          child: widget.child,
        );
      },
    );
  }
}
