import 'package:flutter/material.dart';
import 'app_background.dart';
import 'top_navigation_bar.dart';
import 'bottom_navigation_bar.dart';

class AppLayout extends StatelessWidget {
  final Widget child;
  final int selectedIndex;
  final Function(int) onItemTapped;
  final VoidCallback? onProfileTap;
  final VoidCallback? onSearchTap;
  final VoidCallback? onNotificationTap;
  final bool showNotificationDot;

  const AppLayout({
    super.key,
    required this.child,
    required this.selectedIndex,
    required this.onItemTapped,
    this.onProfileTap,
    this.onSearchTap,
    this.onNotificationTap,
    this.showNotificationDot = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF8F1),
      body: AppBackground(
        child: Column(
          children: [
            // Add top padding to match original positioning
            SizedBox(height: 26),
            // Top Navigation Bar
            TopNavigationBar(
              onProfileTap: onProfileTap,
              onSearchTap: onSearchTap,
              onNotificationTap: onNotificationTap,
              showNotificationDot: showNotificationDot,
            ),
            // Main content area
            Expanded(
              child: child,
            ),
            // Bottom Navigation Bar
            CustomBottomNavigationBar(
              selectedIndex: selectedIndex,
              onItemTapped: onItemTapped,
            ),
          ],
        ),
      ),
    );
  }
}
