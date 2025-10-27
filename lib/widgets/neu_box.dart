import 'package:flutter/material.dart';

class NeuBox extends StatelessWidget {
  final Color color;
  final double height, width, radius;
  final Widget child;
  const NeuBox({
    super.key,
    required this.color,
    required this.child,
    required this.height,
    required this.width,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: color.withOpacity(0.8),
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            offset: Offset(2, 2),
            color: Colors.grey.shade400,
            spreadRadius: 1,
          ),
          BoxShadow(
            blurRadius: 2,
            offset: Offset(-2, -2),
            color: Colors.grey.shade200,
            spreadRadius: 1,
          ),
        ],
      ),
      child: SizedBox(
        height: height,
        width: width,
        child: Center(child: child),
      ),
    );
  }
}
