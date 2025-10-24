import 'package:flutter/material.dart';

class DecoratedCard extends StatelessWidget {
  final Color color;
  final Widget child;
  final double height, width, radius;
  const DecoratedCard({
    super.key,
    required this.color,
    required this.child,
    required this.height,
    required this.width,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      elevation: 4,
      shadowColor: color.withOpacity(0.8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      child: SizedBox(
        height: height,
        width: width,
        child: Center(child: child),
      ),
    );
  }
}
