import 'package:flutter/material.dart';
import 'widgets/logout_bottom_sheet.dart';
import 'widgets/profile_info.dart';
import 'widgets/profile_list_item.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const ProfileInfo(),
          const SizedBox(height: 26),
          ProfileListItem(
            icon: Icons.person_2_outlined,
            text: 'Account Preferences',
            onTap: () {},
          ),
          ProfileListItem(
            icon: Icons.payment_outlined,
            text: 'Subscription & Payment',
            onTap: () {},
          ),
          ProfileListItem(
            icon: Icons.notifications_outlined,
            text: 'App Notifications',
            isSwitch: true,
            onToggle: (value) {},
            value: true,
          ),
          ProfileListItem(
            icon: Icons.dark_mode_outlined,
            text: 'Dark Mode',
            isSwitch: true,
            onToggle: (value) {},
            value: false,
          ),
          ProfileListItem(
            icon: Icons.star_outline,
            text: 'Rate Us',
            onTap: () {},
          ),
          ProfileListItem(
            icon: Icons.feedback_outlined,
            text: 'Provide Feedback',
            onTap: () {},
          ),
          ProfileListItem(
            icon: Icons.logout_outlined,
            text: 'Log Out',
            isLogOut: true,
            onTap: () => showLogoutBottomSheet(context),
          ),
        ],
      ),
    );
  }
}
