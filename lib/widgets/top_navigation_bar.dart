import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BellIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF7C7C7C)
      ..style = PaintingStyle.fill;

    final strokePaint = Paint()
      ..color = const Color(0xFF7C7C7C)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final center = Offset(size.width / 2, size.height / 2);

    // Bell body (main bell shape)
    final bellPath = Path();
    final bellWidth = size.width * 0.6;
    final bellHeight = size.height * 0.5;

    // Create bell shape using curves
    bellPath.moveTo(center.dx - bellWidth / 2, center.dy + bellHeight / 4);
    bellPath.quadraticBezierTo(center.dx - bellWidth / 2,
        center.dy - bellHeight / 2, center.dx, center.dy - bellHeight / 2);
    bellPath.quadraticBezierTo(
        center.dx + bellWidth / 2,
        center.dy - bellHeight / 2,
        center.dx + bellWidth / 2,
        center.dy + bellHeight / 4);
    bellPath.lineTo(center.dx - bellWidth / 2, center.dy + bellHeight / 4);

    canvas.drawPath(bellPath, strokePaint);

    // Bell bottom line
    canvas.drawLine(
      Offset(center.dx - bellWidth / 2, center.dy + bellHeight / 4),
      Offset(center.dx + bellWidth / 2, center.dy + bellHeight / 4),
      strokePaint,
    );

    // Bell top (small rectangle for the bell top)
    final topRect = Rect.fromCenter(
      center: Offset(center.dx, center.dy - bellHeight / 2 - 2),
      width: 4,
      height: 3,
    );
    canvas.drawRect(topRect, paint);

    // Bell clapper (small circle at bottom)
    canvas.drawCircle(
      Offset(center.dx, center.dy + bellHeight / 4 + 3),
      1.5,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class TopNavigationBar extends StatelessWidget {
  final VoidCallback? onProfileTap;
  final VoidCallback? onSearchTap;
  final VoidCallback? onNotificationTap;
  final bool showNotificationDot;

  const TopNavigationBar({
    super.key,
    this.onProfileTap,
    this.onSearchTap,
    this.onNotificationTap,
    this.showNotificationDot = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 66, // 26 (top) + 40 (icon height)
      child: Stack(
        children: [
          // Profile icon
          Positioned(
            left: 16,
            top: 26,
            child: GestureDetector(
              onTap: onProfileTap,
              child: Container(
                width: 40,
                height: 40,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x28000000),
                      blurRadius: 4,
                      offset: Offset(0, 2),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'public/images/user 1.svg',
                    width: 22,
                    height: 22,
                  ),
                ),
              ),
            ),
          ),
          // Search icon
          Positioned(
            right: 68,
            top: 26,
            child: GestureDetector(
              onTap: onSearchTap,
              child: Container(
                width: 40,
                height: 40,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x28000000),
                      blurRadius: 4,
                      offset: Offset(0, 2),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'public/images/search.svg',
                    width: 22,
                    height: 22,
                  ),
                ),
              ),
            ),
          ),
          // Notification bell icon
          Positioned(
            right: 16,
            top: 26,
            child: GestureDetector(
              onTap: onNotificationTap,
              child: Container(
                width: 40,
                height: 40,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x28000000),
                      blurRadius: 4,
                      offset: Offset(0, 2),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Center(
                  child: CustomPaint(
                    size: Size(22, 22),
                    painter: BellIconPainter(),
                  ),
                ),
              ),
            ),
          ),
          // Notification dot
          if (showNotificationDot)
            Positioned(
              right: 14,
              top: 24,
              child: Container(
                width: 8,
                height: 8,
                decoration: ShapeDecoration(
                  color: const Color(0xFFCF6F59),
                  shape: OvalBorder(),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
