import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const FigmaToCodeApp());
}

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

class FigmaToCodeApp extends StatefulWidget {
  const FigmaToCodeApp({super.key});

  @override
  State<FigmaToCodeApp> createState() => _FigmaToCodeAppState();
}

class _FigmaToCodeAppState extends State<FigmaToCodeApp> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: const Color(0xFFFAF8F1),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFFFAF8F1),
        body: Column(
          children: [
            Expanded(
              child: ListView(children: [
                HomePageNew(),
              ]),
            ),
            // Sticky bottom navigation
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x28000000),
                    blurRadius: 4,
                    offset: Offset(0, -2),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: SafeArea(
                top: false,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildNavItem(
                        index: 0,
                        iconPath: 'public/images/HouseSimple.svg',
                        label: 'Home',
                      ),
                      _buildNavItem(
                        index: 1,
                        iconPath: 'public/images/ChatTeardropDots.svg',
                        label: 'Chat',
                      ),
                      _buildNavItem(
                        index: 2,
                        iconPath: 'public/images/UsersThree.svg',
                        label: 'Community',
                      ),
                      _buildNavItem(
                        index: 3,
                        iconPath: 'public/images/Tree.svg',
                        label: 'Plan',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required String iconPath,
    required String label,
  }) {
    final bool isSelected = _selectedIndex == index;
    final Color color = isSelected ? const Color(0xFFCE6E59) : const Color(0xFF7C7C7C);
    final FontWeight fontWeight = isSelected ? FontWeight.w800 : FontWeight.w600;

    return Expanded(
      child: GestureDetector(
        onTap: () => _onItemTapped(index),
        child: Container(
          height: 49,
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFFFF5F3) : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                iconPath,
                width: 20,
                height: 20,
                color: color,
              ),
              SizedBox(height: 4),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: color,
                  fontSize: 12,
                  fontFamily: 'Mulish',
                  fontWeight: fontWeight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePageNew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 1400,
          padding: EdgeInsets.symmetric(horizontal: 16),
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
          child: Stack(
            children: [
              // Header greeting section
              Positioned(
                left: 16,
                top: 90,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
                  children: [
                    Text(
                      'Vanakkam!',
                      style: TextStyle(
                        color: const Color(0xFF242424),
                        fontSize: 24,
                        fontFamily: 'Mulish',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      'How are you feeling today?',
                      style: TextStyle(
                        color: const Color(0xFF7C7C7C),
                        fontSize: 16,
                        fontFamily: 'Mulish',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              // Top navigation icons
              Positioned(
                left: 16,
                top: 26,
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
              Positioned(
                right: 68,
                top: 26,
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
              Positioned(
                right: 16,
                top: 26,
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
              // Notification dot
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
              // Main content section
              Positioned(
                left: 16,
                top: 160,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 24,
                  children: [
                    // Featured content card
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        // Rectangle container with brick pattern
                        Container(
                          width: 342,
                          height: 187,
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'public/images/0a4eb3feffb05c4b732ab135b919b2ede5262658.png'),
                              fit: BoxFit.none,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                        // Color overlay
                        Container(
                          width: 342,
                          height: 187,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFCF6F5A),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                        // Brick pattern with opacity
                        Container(
                          width: 342,
                          height: 187,
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'public/images/0a4eb3feffb05c4b732ab135b919b2ede5262658.png'),
                              fit: BoxFit.none,
                              opacity: 0.3,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                        // Text content
                        Positioned(
                          left: 24,
                          top: 24,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 150,
                                child: Text(
                                  'You have a new session today',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'Mulish',
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              SizedBox(height: 12),
                              Text(
                                'with Natalie James',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'Mulish',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 24),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFA5503E),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Text(
                                  'Today - 08:00 PM',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: 'Mulish',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Lady image - positioned as top layer
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            width: 161,
                            height: 207,
                            decoration: ShapeDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'public/images/confident-smiling-girl-young-professional-looking-upbeat-modified 1.png'),
                                fit: BoxFit.fill,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(20)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Horizontally scrollable containers
                    Container(
                      width: 342,
                      height: 312,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const AlwaysScrollableScrollPhysics(),
                        padding: const EdgeInsets.only(
                            left: 0,
                            right: 16,
                            top: 50),
                        child: Row(
                          children: [
                            // Relationships Card
                            Container(
                              margin: const EdgeInsets.only(right: 16),
                              width: 189,
                              height: 262,
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  // Base container
                                  Container(
                                    width: 189,
                                    height: 262,
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                        children: [
                                          // Image container (hidden behind positioned image)
                                          Container(
                                            width: 141,
                                            height: 150,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          // Text content
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'Relationships',
                                                style: TextStyle(
                                                  color: Color(0xFF242424),
                                                  fontSize: 16,
                                                  fontFamily: 'Mulish',
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              const SizedBox(height: 1),
                                              const Text(
                                                '124 Members',
                                                style: TextStyle(
                                                  color: Color(0xFF7C7C7C),
                                                  fontSize: 14,
                                                  fontFamily: 'Mulish',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const SizedBox(height: 6),
                                              Row(
                                                children: [
                                                  const Text(
                                                    'Join group',
                                                    style: TextStyle(
                                                      color: Color(0xFFCF6F59),
                                                      fontSize: 14,
                                                      fontFamily: 'Mulish',
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 4),
                                                  const Icon(
                                                    Icons.arrow_forward,
                                                    color: Color(0xFFCF6F59),
                                                    size: 16,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  // Pop-up effect - image extends above container
                                  Positioned(
                                    top: -30,
                                    left: 24,
                                    child: Container(
                                      width: 141,
                                      height: 180,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: const DecorationImage(
                                          image: AssetImage("public/images/Couple.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // LGBT Support Card
                            Container(
                              margin: const EdgeInsets.only(right: 16),
                              width: 189,
                              height: 262,
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  // Base container
                                  Container(
                                    width: 189,
                                    height: 262,
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                        children: [
                                          // Image container (hidden behind positioned image)
                                          Container(
                                            width: 141,
                                            height: 150,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          // Text content
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'LGBT Support',
                                                style: TextStyle(
                                                  color: Color(0xFF242424),
                                                  fontSize: 16,
                                                  fontFamily: 'Mulish',
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              const SizedBox(height: 1),
                                              const Text(
                                                '76 Members',
                                                style: TextStyle(
                                                  color: Color(0xFF7C7C7C),
                                                  fontSize: 14,
                                                  fontFamily: 'Mulish',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const SizedBox(height: 6),
                                              Row(
                                                children: [
                                                  const Text(
                                                    'Join group',
                                                    style: TextStyle(
                                                      color: Color(0xFFCF6F59),
                                                      fontSize: 14,
                                                      fontFamily: 'Mulish',
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 4),
                                                  const Icon(
                                                    Icons.arrow_forward,
                                                    color: Color(0xFFCF6F59),
                                                    size: 16,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  // Pop-up effect - image extends above container
                                  Positioned(
                                    top: -30,
                                    left: 24,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Container(
                                        width: 141,
                                        height: 180,
                                        child: Image.asset(
                                          "public/images/LGBT.png",
                                          fit: BoxFit.cover,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Anxiety Support Card
                            Container(
                              margin: const EdgeInsets.only(right: 16),
                              width: 189,
                              height: 262,
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  // Base container
                                  Container(
                                    width: 189,
                                    height: 262,
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                        children: [
                                          // Image container (hidden behind positioned image)
                                          Container(
                                            width: 141,
                                            height: 150,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          // Text content
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'Anxiety Support',
                                                style: TextStyle(
                                                  color: Color(0xFF242424),
                                                  fontSize: 16,
                                                  fontFamily: 'Mulish',
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              const SizedBox(height: 1),
                                              const Text(
                                                '203 Members',
                                                style: TextStyle(
                                                  color: Color(0xFF7C7C7C),
                                                  fontSize: 14,
                                                  fontFamily: 'Mulish',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const SizedBox(height: 6),
                                              Row(
                                                children: [
                                                  const Text(
                                                    'Join group',
                                                    style: TextStyle(
                                                      color: Color(0xFFCF6F59),
                                                      fontSize: 14,
                                                      fontFamily: 'Mulish',
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 4),
                                                  const Icon(
                                                    Icons.arrow_forward,
                                                    color: Color(0xFFCF6F59),
                                                    size: 16,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  // Pop-up effect - using a placeholder colored container
                                  Positioned(
                                    top: -30,
                                    left: 24,
                                    child: Container(
                                      width: 141,
                                      height: 180,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        gradient: const LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            Color(0xFF8B9DC3),
                                            Color(0xFF6B7FA3),
                                          ],
                                        ),
                                      ),
                                      child: const Center(
                                        child: Icon(
                                          Icons.psychology,
                                          size: 60,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Support section
                    Container(
                      width: 342,
                      height: 320,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
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
                      child: Padding(
                        padding: EdgeInsets.all(24),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'let us support you!!',
                              style: TextStyle(
                                color: const Color(0xFF565656),
                                fontSize: 12,
                                fontFamily: 'Mulish',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 24),
                            // Chat option
                            Row(
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFF62A1A8),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      'public/images/ChatTeardropDots.svg',
                                      width: 20,
                                      height: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Chat',
                                        style: TextStyle(
                                          color: const Color(0xFF242424),
                                          fontSize: 16,
                                          fontFamily: 'Mulish',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        'Connect 1-1 and group chat',
                                        style: TextStyle(
                                          color: const Color(0xFF7C7C7C),
                                          fontSize: 14,
                                          fontFamily: 'Mulish',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SvgPicture.asset(
                                  'public/images/CaretRight.svg',
                                  width: 16,
                                  height: 16,
                                ),
                              ],
                            ),
                            SizedBox(height: 24),
                            Container(
                              width: 294,
                              height: 1,
                              color: const Color(0xFFECECEC),
                            ),
                            SizedBox(height: 24),
                            // Community option
                            Row(
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFF6899CC),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      'public/images/UsersThree.svg',
                                      width: 20,
                                      height: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Community',
                                        style: TextStyle(
                                          color: const Color(0xFF242424),
                                          fontSize: 16,
                                          fontFamily: 'Mulish',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        'Ask questions, get support',
                                        style: TextStyle(
                                          color: const Color(0xFF7C7C7C),
                                          fontSize: 14,
                                          fontFamily: 'Mulish',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SvgPicture.asset(
                                  'public/images/CaretRight.svg',
                                  width: 16,
                                  height: 16,
                                ),
                              ],
                            ),
                            SizedBox(height: 24),
                            Container(
                              width: 294,
                              height: 1,
                              color: const Color(0xFFECECEC),
                            ),
                            SizedBox(height: 24),
                            // Plan option
                            Row(
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFF867ACA),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      'public/images/Tree.svg',
                                      width: 20,
                                      height: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Plan',
                                        style: TextStyle(
                                          color: const Color(0xFF242424),
                                          fontSize: 16,
                                          fontFamily: 'Mulish',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        'Take steps to grow & learn',
                                        style: TextStyle(
                                          color: const Color(0xFF7C7C7C),
                                          fontSize: 14,
                                          fontFamily: 'Mulish',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SvgPicture.asset(
                                  'public/images/CaretRight.svg',
                                  width: 16,
                                  height: 16,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Daily Check In section
                    Container(
                      width: 342,
                      padding: const EdgeInsets.all(24),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
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
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 24,
                        children: [
                          Text(
                            'Daily Check In',
                            style: TextStyle(
                              color: const Color(0xFF565656),
                              fontSize: 12,
                              fontFamily: 'Mulish',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'How are you feeling today?',
                            style: TextStyle(
                              color: const Color(0xFF242424),
                              fontSize: 16,
                              fontFamily: 'Mulish',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Container(
                            width: 294,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 12,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: 12,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 12),
                                      decoration: ShapeDecoration(
                                        color: const Color(0xFFFFF5F3),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                      child: Text(
                                        '😃 Great',
                                        style: TextStyle(
                                          color: const Color(0xFF242424),
                                          fontSize: 14,
                                          fontFamily: 'Mulish',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 12),
                                      decoration: ShapeDecoration(
                                        color: const Color(0xFFFFF5F3),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                      child: Text(
                                        '😊 Good',
                                        style: TextStyle(
                                          color: const Color(0xFF242424),
                                          fontSize: 14,
                                          fontFamily: 'Mulish',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: 12,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 12),
                                      decoration: ShapeDecoration(
                                        color: const Color(0xFFFFF5F3),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                      child: Text(
                                        '😕 Okay',
                                        style: TextStyle(
                                          color: const Color(0xFF242424),
                                          fontSize: 14,
                                          fontFamily: 'Mulish',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 12),
                                      decoration: ShapeDecoration(
                                        color: const Color(0xFFFFF5F3),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                      child: Text(
                                        '🙁 Sad',
                                        style: TextStyle(
                                          color: const Color(0xFF242424),
                                          fontSize: 14,
                                          fontFamily: 'Mulish',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 12),
                                      decoration: ShapeDecoration(
                                        color: const Color(0xFFFFF5F3),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                      child: Text(
                                        '😩 Awful',
                                        style: TextStyle(
                                          color: const Color(0xFF242424),
                                          fontSize: 14,
                                          fontFamily: 'Mulish',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
