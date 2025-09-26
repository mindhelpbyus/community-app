import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExplorePage extends StatefulWidget {
  final VoidCallback? onDoctorTap;
  
  const ExplorePage({super.key, this.onDoctorTap});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  int selectedTabIndex = 0; // 0 for Therapists, 1 for Mental Health Centers

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      height: 844,
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
          // Header section
          Positioned(
            left: 24,
            top: 5,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                Text(
                  'Explore care ',
                  style: TextStyle(
                    color: const Color(0xFF242424),
                    fontSize: 24,
                    fontFamily: 'Mulish',
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  width: 345,
                  child: Text(
                    'Discuss with a therapist your feelings and resolve your issues.',
                    style: TextStyle(
                      color: const Color(0xFF7C7C7C),
                      fontSize: 16,
                      fontFamily: 'Mulish',
                      fontWeight: FontWeight.w500,
                      height: 1.38,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Tab section
          Positioned(
            left: 24,
            top: 120,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 6,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTabIndex = 0;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    decoration: ShapeDecoration(
                      color: selectedTabIndex == 0
                          ? const Color(0xFFCF6F59)
                          : Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      shadows: selectedTabIndex == 0
                          ? [
                              BoxShadow(
                                color: Color(0x28000000),
                                blurRadius: 4,
                                offset: Offset(0, 2),
                                spreadRadius: 0,
                              )
                            ]
                          : null,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 10,
                      children: [
                        Text(
                          '🧑‍⚕️ Therapists',
                          style: TextStyle(
                            color: selectedTabIndex == 0
                                ? Colors.white
                                : const Color(0xFF7C7C7C),
                            fontSize: 16,
                            fontFamily: 'Mulish',
                            fontWeight: selectedTabIndex == 0
                                ? FontWeight.w800
                                : FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTabIndex = 1;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    decoration: ShapeDecoration(
                      color: selectedTabIndex == 1
                          ? const Color(0xFFCF6F59)
                          : Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      shadows: selectedTabIndex == 1
                          ? [
                              BoxShadow(
                                color: Color(0x28000000),
                                blurRadius: 4,
                                offset: Offset(0, 2),
                                spreadRadius: 0,
                              )
                            ]
                          : null,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 10,
                      children: [
                        Text(
                          '☝️ Mental Health Centers',
                          style: TextStyle(
                            color: selectedTabIndex == 1
                                ? Colors.white
                                : const Color(0xFF7C7C7C),
                            fontSize: 16,
                            fontFamily: 'Mulish',
                            fontWeight: selectedTabIndex == 1
                                ? FontWeight.w800
                                : FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Filter section
          Positioned(
            left: 24,
            top: 190,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 12,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: const Color(0xFFDEDEDE),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Text(
                        'Languages',
                        style: TextStyle(
                          color: const Color(0xFF565656),
                          fontSize: 14,
                          fontFamily: 'Mulish',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SvgPicture.asset(
                        'public/images/CaretDown.svg',
                        width: 12,
                        height: 12,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: const Color(0xFFDEDEDE),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Text(
                        'Specialties',
                        style: TextStyle(
                          color: const Color(0xFF565656),
                          fontSize: 14,
                          fontFamily: 'Mulish',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SvgPicture.asset(
                        'public/images/CaretDown.svg',
                        width: 12,
                        height: 12,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: const Color(0xFFDEDEDE),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Text(
                        'Gender',
                        style: TextStyle(
                          color: const Color(0xFF565656),
                          fontSize: 14,
                          fontFamily: 'Mulish',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SvgPicture.asset(
                        'public/images/CaretDown.svg',
                        width: 12,
                        height: 12,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Content section (Therapist cards or Mental Health Centers)
          Positioned(
            left: 24,
            top: 260,
            child: selectedTabIndex == 0
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 24,
                    children: [
                      // Dr. Arlene McCoy card
                      GestureDetector(
                        onTap: widget.onDoctorTap,
                        child: Container(
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
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 16,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    spacing: 6,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        spacing: 8,
                                        children: [
                                          Text(
                                            'Dr. Arlene McCoy',
                                            style: TextStyle(
                                              color: const Color(0xFF242424),
                                              fontSize: 16,
                                              fontFamily: 'Mulish',
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          SvgPicture.asset(
                                            'public/images/CheckCircle.svg',
                                            width: 16,
                                            height: 16,
                                          ),
                                        ],
                                      ),
                                      Text(
                                        'Clinical Psychologist',
                                        style: TextStyle(
                                          color: const Color(0xFF242424),
                                          fontSize: 14,
                                          fontFamily: 'Mulish',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        'New York, NY',
                                        style: TextStyle(
                                          color: const Color(0xFF7C7C7C),
                                          fontSize: 12,
                                          fontFamily: 'Mulish',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    spacing: 8,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 8),
                                        decoration: ShapeDecoration(
                                          color: const Color(0xFFFFF6D4),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          spacing: 4,
                                          children: [
                                            Text(
                                              '4.7',
                                              style: TextStyle(
                                                color: const Color(0xFFCF9A17),
                                                fontSize: 12,
                                                fontFamily: 'Mulish',
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Icon(
                                              Icons.star,
                                              size: 12,
                                              color: const Color(0xFFCF9A17),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 8),
                                        decoration: ShapeDecoration(
                                          color: const Color(0xFFFFF5F3),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                        ),
                                        child: Text(
                                          '8 yrs exp.',
                                          style: TextStyle(
                                            color: const Color(0xFFCF6F59),
                                            fontSize: 12,
                                            fontFamily: 'Mulish',
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 16),
                            Container(
                              width: 68,
                              height: 102,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image:
                                      AssetImage("public/images/doctor 1.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                        ),
                      ),
                      // Dr. Dianne Russell card
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
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 16,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    spacing: 6,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        spacing: 8,
                                        children: [
                                          Text(
                                            'Dr. Dianne Russell',
                                            style: TextStyle(
                                              color: const Color(0xFF242424),
                                              fontSize: 16,
                                              fontFamily: 'Mulish',
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          SvgPicture.asset(
                                            'public/images/CheckCircle.svg',
                                            width: 16,
                                            height: 16,
                                          ),
                                        ],
                                      ),
                                      Text(
                                        'Counselling Psychologist',
                                        style: TextStyle(
                                          color: const Color(0xFF242424),
                                          fontSize: 14,
                                          fontFamily: 'Mulish',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        'New York, NY',
                                        style: TextStyle(
                                          color: const Color(0xFF7C7C7C),
                                          fontSize: 12,
                                          fontFamily: 'Mulish',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    spacing: 8,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 8),
                                        decoration: ShapeDecoration(
                                          color: const Color(0xFFFFF6D4),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          spacing: 4,
                                          children: [
                                            Text(
                                              '4.8',
                                              style: TextStyle(
                                                color: const Color(0xFFCF9A17),
                                                fontSize: 12,
                                                fontFamily: 'Mulish',
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Icon(
                                              Icons.star,
                                              size: 12,
                                              color: const Color(0xFFCF9A17),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 8),
                                        decoration: ShapeDecoration(
                                          color: const Color(0xFFFFF5F3),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                        ),
                                        child: Text(
                                          '4 yrs exp.',
                                          style: TextStyle(
                                            color: const Color(0xFFCF6F59),
                                            fontSize: 12,
                                            fontFamily: 'Mulish',
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 16),
                            Container(
                              width: 72,
                              height: 103,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image:
                                      AssetImage("public/images/doctor 2.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 24,
                    children: [
                      // Mental Health Centers content
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 16,
                          children: [
                            Icon(
                              Icons.business,
                              size: 48,
                              color: const Color(0xFFCF6F59),
                            ),
                            Text(
                              'Mental Health Centers',
                              style: TextStyle(
                                color: const Color(0xFF242424),
                                fontSize: 18,
                                fontFamily: 'Mulish',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              'Coming Soon',
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
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
