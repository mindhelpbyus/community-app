import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  final Widget child;

  const AppBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: const Color(0xFFFAF8F1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x051F1F1F),
            blurRadius: 120,
            offset: Offset(0, 24),
            spreadRadius: 0,
          )
        ],
      ),
      child: child,
    );
  }
}
