import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/transparent_top_navigation_bar.dart';
import '../widgets/bottom_navigation_bar.dart';

class DoctorProfilePage extends StatelessWidget {
  final VoidCallback? onBackPressed;
  final VoidCallback? onProfileTap;
  final VoidCallback? onSearchTap;
  final VoidCallback? onNotificationTap;

  const DoctorProfilePage({
    super.key,
    this.onBackPressed,
    this.onProfileTap,
    this.onSearchTap,
    this.onNotificationTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth,
      height: screenHeight,
      clipBehavior: Clip.antiAlias,
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
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: screenWidth,
              height: 336,
              decoration: ShapeDecoration(
                color: const Color(0xFFCF6F59),
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
              child: Stack(
                children: [
                  // Brick pattern overlay
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: screenWidth,
                      height: 336,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("public/images/Rectangle.png"),
                          fit: BoxFit.cover,
                          opacity: 0.3,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 24,
                    bottom: 52,
                    child: Container(
                      width: 167,
                      height: 189,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              "public/images/lovely-couple-have-warm-cuddle-modified 1.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 24,
                    top: 92,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 8,
                      children: [
                        Text(
                          'Dr. Dianne McCoy',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontFamily: 'Mulish',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          '124 Active Members',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Mulish',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 24,
                    top: 176,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
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
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 10,
                        children: [
                          Text(
                            'Book Now',
                            style: TextStyle(
                              color: const Color(0xFFCF6F59),
                              fontSize: 16,
                              fontFamily: 'Mulish',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 258,
            child: Container(
              width: screenWidth,
              height: screenHeight - 258,
              decoration: ShapeDecoration(
                color: const Color(0xFFFAF8F1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 24,
                    top: 25,
                    child: Text(
                      'About this Doctor ',
                      style: TextStyle(
                        color: const Color(0xFF565656),
                        fontSize: 12,
                        fontFamily: 'Mulish',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 24,
                    top: 52,
                    child: SizedBox(
                      width: screenWidth - 48,
                      child: Text(
                        'Relationships can be confusing sometimes, and lots of people have relationship questions. Join this group to get answers to your relationship questions that will give you some direction, and real help for your relationship.',
                        style: TextStyle(
                          color: const Color(0xFF7C7C7C),
                          fontSize: 14,
                          fontFamily: 'Mulish',
                          fontWeight: FontWeight.w500,
                          height: 1.43,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 24,
                    top: 192,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 32,
                      children: [
                        Text(
                          'Education',
                          style: TextStyle(
                            color: const Color(0xFFCE6E59),
                            fontSize: 16,
                            fontFamily: 'Mulish',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'Availability',
                          style: TextStyle(
                            color: const Color(0xFF7C7C7C),
                            fontSize: 16,
                            fontFamily: 'Mulish',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Sessions',
                          style: TextStyle(
                            color: const Color(0xFF7C7C7C),
                            fontSize: 16,
                            fontFamily: 'Mulish',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 228,
                    child: Container(
                      width: screenWidth,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignCenter,
                            color: const Color(0xFFECECEC),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 24,
                    top: 224,
                    child: Container(
                      width: 90,
                      height: 4,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFCE6E59),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4),
                            topRight: Radius.circular(4),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 24,
                    top: 252,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 8,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: ShapeDecoration(
                            color: const Color(0xFFFAF8F1),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                color: const Color(0xFFD7D7D7),
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            '#marriage',
                            style: TextStyle(
                              color: const Color(0xFF565656),
                              fontSize: 12,
                              fontFamily: 'Mulish',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                color: const Color(0xFFCF6F59),
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Text(
                            '#longdistance',
                            style: TextStyle(
                              color: const Color(0xFFCF6F59),
                              fontSize: 12,
                              fontFamily: 'Mulish',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: ShapeDecoration(
                            color: const Color(0xFFFAF8F1),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                color: const Color(0xFFD7D7D7),
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            '#intimacy',
                            style: TextStyle(
                              color: const Color(0xFF565656),
                              fontSize: 12,
                              fontFamily: 'Mulish',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // First discussion card
                  Positioned(
                    left: 24,
                    top: 307,
                    child: Container(
                      width: screenWidth - 48,
                      height: 193,
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
                      child: Stack(
                        children: [
                          Positioned(
                            left: 24,
                            top: 24,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 12,
                              children: [
                                Container(
                                  width: 32,
                                  height: 32,
                                  decoration: ShapeDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "public/images/Rectangle 20.png"),
                                      fit: BoxFit.cover,
                                    ),
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
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: 4,
                                  children: [
                                    Text(
                                      'Theresa Webb',
                                      style: TextStyle(
                                        color: const Color(0xFFCF6F59),
                                        fontSize: 12,
                                        fontFamily: 'Mulish',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      '2 hours ago',
                                      style: TextStyle(
                                        color: const Color(0xFF7C7C7C),
                                        fontSize: 12,
                                        fontFamily: 'Mulish',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            left: 24,
                            top: 74,
                            child: SizedBox(
                              width: 294,
                              child: Text(
                                'How will I know if he is serious or just pass time?',
                                style: TextStyle(
                                  color: const Color(0xFF242424),
                                  fontSize: 18,
                                  fontFamily: 'Mulish',
                                  fontWeight: FontWeight.w700,
                                  height: 1.33,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 24,
                            top: 144,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 8,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFFFFF5D4),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.location_on,
                                    size: 12,
                                    color: const Color(0xFFCF9A17),
                                  ),
                                ),
                                Text(
                                  'Long Distance',
                                  style: TextStyle(
                                    color: const Color(0xFFCF9A17),
                                    fontSize: 12,
                                    fontFamily: 'Mulish',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            right: 24,
                            top: 142,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              decoration: ShapeDecoration(
                                color: const Color(0xFFFFF5F3),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text(
                                '42 responses',
                                style: TextStyle(
                                  color: const Color(0xFFCF6F59),
                                  fontSize: 12,
                                  fontFamily: 'Mulish',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Second discussion card
                  Positioned(
                    left: 24,
                    top: 524,
                    child: Container(
                      width: screenWidth - 48,
                      height: 185,
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
                      child: Stack(
                        children: [
                          Positioned(
                            left: 24,
                            top: 24,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 12,
                              children: [
                                Container(
                                  width: 32,
                                  height: 32,
                                  decoration: ShapeDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "public/images/Rectangle 20-1.png"),
                                      fit: BoxFit.cover,
                                    ),
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
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: 4,
                                  children: [
                                    Text(
                                      'Cameron Williamson',
                                      style: TextStyle(
                                        color: const Color(0xFFCF6F59),
                                        fontSize: 12,
                                        fontFamily: 'Mulish',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      '6 hours ago',
                                      style: TextStyle(
                                        color: const Color(0xFF7C7C7C),
                                        fontSize: 12,
                                        fontFamily: 'Mulish',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            left: 24,
                            top: 74,
                            child: SizedBox(
                              width: screenWidth - 96,
                              child: Text(
                                'Feeling down over long distance. Can anyone give advice?',
                                style: TextStyle(
                                  color: const Color(0xFF242424),
                                  fontSize: 16,
                                  fontFamily: 'Mulish',
                                  fontWeight: FontWeight.w700,
                                  height: 1.38,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 24,
                            top: 133,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 8,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFFFFF5D4),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.location_on,
                                    size: 12,
                                    color: const Color(0xFFEAB01F),
                                  ),
                                ),
                                Text(
                                  'Long Distance',
                                  style: TextStyle(
                                    color: const Color(0xFFEAB01F),
                                    fontSize: 12,
                                    fontFamily: 'Mulish',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            right: 24,
                            top: 131,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              decoration: ShapeDecoration(
                                color: const Color(0xFFFFF5F3),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text(
                                '103 responses',
                                style: TextStyle(
                                  color: const Color(0xFFCF6F59),
                                  fontSize: 12,
                                  fontFamily: 'Mulish',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Third discussion card
                  Positioned(
                    left: 24,
                    top: 733,
                    child: Container(
                      width: screenWidth - 48,
                      height: 185,
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
                      child: Stack(
                        children: [
                          Positioned(
                            left: 24,
                            top: 24,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 12,
                              children: [
                                Container(
                                  width: 32,
                                  height: 32,
                                  decoration: ShapeDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "public/images/Rectangle 20-2.png"),
                                      fit: BoxFit.cover,
                                    ),
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
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: 4,
                                  children: [
                                    Text(
                                      'Brooklyn Simmons',
                                      style: TextStyle(
                                        color: const Color(0xFFCF6F59),
                                        fontSize: 12,
                                        fontFamily: 'Mulish',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      '2 Days Back',
                                      style: TextStyle(
                                        color: const Color(0xFF7C7C7C),
                                        fontSize: 12,
                                        fontFamily: 'Mulish',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            left: 24,
                            top: 74,
                            child: SizedBox(
                              width: 294,
                              child: Text(
                                'Girlfriend of 3 years is considering ending it due to long distance',
                                style: TextStyle(
                                  color: const Color(0xFF242424),
                                  fontSize: 16,
                                  fontFamily: 'Mulish',
                                  fontWeight: FontWeight.w700,
                                  height: 1.38,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 24,
                            top: 133,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 8,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFFFFF5D4),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.location_on,
                                    size: 12,
                                    color: const Color(0xFFEAB01F),
                                  ),
                                ),
                                Text(
                                  'Long Distance',
                                  style: TextStyle(
                                    color: const Color(0xFFEAB01F),
                                    fontSize: 12,
                                    fontFamily: 'Mulish',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            right: 24,
                            top: 131,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              decoration: ShapeDecoration(
                                color: const Color(0xFFFFF5F3),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text(
                                '21 responses',
                                style: TextStyle(
                                  color: const Color(0xFFCF6F59),
                                  fontSize: 12,
                                  fontFamily: 'Mulish',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Transparent Top Navigation Bar - positioned to overlay on coral container
          Positioned(
            left: 0,
            top: 0,
            child: TransparentTopNavigationBar(
              onBackTap: onBackPressed,
              onProfileTap: onProfileTap,
              onSearchTap: onSearchTap,
              onNotificationTap: onNotificationTap,
              showBackButton: onBackPressed != null,
              showNotificationDot: true,
            ),
          ),
        ],
      ),
    );
  }
}
