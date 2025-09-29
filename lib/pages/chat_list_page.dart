import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatListPage extends StatelessWidget {
  const ChatListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // Header section
          Container(
            width: double.infinity,
            height: 56,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(color: const Color(0xFFFAF8F1)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Edit',
                  style: TextStyle(
                    color: const Color(0xFFCF6F59),
                    fontSize: 16,
                    fontFamily: 'Mulish',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Chats',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF242424),
                    fontSize: 16,
                    fontFamily: 'Mulish',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print('Create new chat tapped');
                    // TODO: Navigate to create new chat page
                  },
                  child: Container(
                    width: 32,
                    height: 32,
                    child: Center(
                      child: SvgPicture.asset(
                        'public/images/Right Button.svg',
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Search bar
          GestureDetector(
            onTap: () {
              print('Search tapped');
              // TODO: Navigate to search page or show search functionality
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: ShapeDecoration(
                color: const Color(0xFFF7F8FD),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'public/images/search.svg',
                    width: 16,
                    height: 16,
                    colorFilter: ColorFilter.mode(
                      const Color(0xFF2E3036),
                      BlendMode.srcIn,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      'Search',
                      style: TextStyle(
                        color: const Color(0xFF8F9098),
                        fontSize: 14,
                        fontFamily: 'Mulish',
                        fontWeight: FontWeight.w400,
                        height: 1.43,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Chat list
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ListView(
                children: [
                  _buildChatItem(
                    context: context,
                    name: 'Haley James',
                    message: 'Stand up for what you believe in',
                    unreadCount: 9,
                  ),
                  _buildChatItem(
                    context: context,
                    name: 'Nathan Scott',
                    message:
                        'One day you\'re seventeen and planning for someday. And then quietly and without...',
                    unreadCount: null,
                  ),
                  _buildChatItem(
                    context: context,
                    name: 'Brooke Davis',
                    message: 'I am who I am. No excuses.',
                    unreadCount: 2,
                  ),
                  _buildChatItem(
                    context: context,
                    name: 'Jamie Scott',
                    message:
                        'Some people are a little different. I think that\'s cool.',
                    unreadCount: null,
                  ),
                  _buildChatItem(
                    context: context,
                    name: 'Marvin McFadden',
                    message:
                        'Last night in the NBA the Charlotte Bobcats quietly made a move that most sports fans...',
                    unreadCount: null,
                  ),
                  _buildChatItem(
                    context: context,
                    name: 'Antwon Taylor',
                    message: 'Meet me at the Rivercourt',
                    unreadCount: null,
                  ),
                  _buildChatItem(
                    context: context,
                    name: 'Jake Jagielski',
                    message:
                        'In your life, you\'re gonna go to some great places, and do some wonderful things.',
                    unreadCount: null,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatItem({
    required BuildContext context,
    required String name,
    required String message,
    int? unreadCount,
  }) {
    return GestureDetector(
      onTap: () {
        print('Chat with $name tapped');
        Navigator.pushNamed(
          context,
          '/chat',
          arguments: name,
        );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Row(
        children: [
          // Avatar
          Container(
            width: 40,
            height: 40,
            decoration: ShapeDecoration(
              color: const Color(0xFFEAF2FF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Center(
              child: SvgPicture.asset(
                'public/images/Avatar.svg',
                width: 24,
                height: 24,
              ),
            ),
          ),
          SizedBox(width: 16),

          // Chat content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: const Color(0xFF1F2024),
                    fontSize: 16,
                    fontFamily: 'Mulish',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  message,
                  style: TextStyle(
                    color: const Color(0xFF71727A),
                    fontSize: 14,
                    fontFamily: 'Mulish',
                    fontWeight: FontWeight.w400,
                    height: 1.33,
                    letterSpacing: 0.12,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          // Unread count badge (if any)
          if (unreadCount != null)
            Container(
              width: 24,
              height: 24,
              decoration: ShapeDecoration(
                color: const Color(0xFFCF6F59),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Center(
                child: Text(
                  unreadCount.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontFamily: 'Mulish',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.50,
                  ),
                ),
              ),
            ),
        ],
        ),
      ),
    );
  }
}
