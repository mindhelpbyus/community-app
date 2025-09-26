import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                index: 2,
                iconPath: 'public/images/UsersThree.svg',
                label: 'Explore',
              ),
              _buildNavItem(
                index: 1,
                iconPath: 'public/images/ChatTeardropDots.svg',
                label: 'Chat',
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
    );
  }

  Widget _buildNavItem({
    required int index,
    required String iconPath,
    required String label,
  }) {
    final bool isSelected = selectedIndex == index;
    final Color color =
        isSelected ? const Color(0xFFCE6E59) : const Color(0xFF7C7C7C);
    final FontWeight fontWeight =
        isSelected ? FontWeight.w800 : FontWeight.w600;

    return Expanded(
      child: GestureDetector(
        onTap: () => onItemTapped(index),
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
                colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
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
