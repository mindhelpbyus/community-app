import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BellIconPainter extends CustomPainter {
  final Color iconColor;
  
  const BellIconPainter({this.iconColor = Colors.white});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = iconColor
      ..style = PaintingStyle.fill;

    final strokePaint = Paint()
      ..color = iconColor
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

class TransparentTopNavigationBar extends StatelessWidget {
  final VoidCallback? onProfileTap;
  final VoidCallback? onSearchTap;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onBackTap;
  final bool showNotificationDot;
  final bool showBackButton;

  const TransparentTopNavigationBar({
    super.key,
    this.onProfileTap,
    this.onSearchTap,
    this.onNotificationTap,
    this.onBackTap,
    this.showNotificationDot = true,
    this.showBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    return SizedBox(
      width: screenWidth, // Use full screen width
      height: 92,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent, // Completely transparent background
        ),
        child: Stack(
        children: [
          // Back button (if needed)
          if (showBackButton)
            Positioned(
              left: 16,
              top: 46,
              child: GestureDetector(
                onTap: onBackTap,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
          // Profile icon
          if (!showBackButton)
            Positioned(
              left: 16,
              top: 46,
              child: GestureDetector(
                onTap: onProfileTap,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'public/images/user 1.svg',
                      width: 22,
                      height: 22,
                      colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    ),
                  ),
                ),
              ),
            ),
          // Search icon
          Positioned(
            right: 68,
            top: 46,
            child: GestureDetector(
              onTap: onSearchTap,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'public/images/search.svg',
                    width: 22,
                    height: 22,
                    colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                ),
              ),
            ),
          ),
          // Notification bell icon
          Positioned(
            right: 16,
            top: 46,
            child: GestureDetector(
              onTap: onNotificationTap,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Center(
                  child: CustomPaint(
                    size: Size(22, 22),
                    painter: BellIconPainter(iconColor: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          // Notification dot
          if (showNotificationDot)
            Positioned(
              right: 14,
              top: 44, // Adjusted for rounded top
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
      ),
    );
  }
}
