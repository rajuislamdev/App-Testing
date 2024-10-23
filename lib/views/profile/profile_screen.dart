import 'package:app_test/views/profile/widgets/setting_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 40.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _UserProfileInfo(),
            _UserProfileSettings(),
          ],
        ),
      ),
    );
  }
}

class _UserProfileSettings extends StatelessWidget {
  const _UserProfileSettings();

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SettingCard(
            leadingIcon: Icons.dark_mode_outlined,
            title: 'Dark Mode',
            widget: Switch(
              value: true,
              onChanged: (_) {},
            ),
          ),
          SettingCard(
            leadingIcon: Icons.language_outlined,
            title: 'Language',
            widget: Text(
              'English',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
          ),
          SettingCard(
            leadingIcon: Icons.person,
            title: 'Logout',
            widget: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.logout,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _UserProfileInfo extends StatelessWidget {
  const _UserProfileInfo();

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
            child: Center(
              child: Text(
                'P',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          Gap(10.h),
          Text(
            'MD. Abdur Rouf',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            '017xxxxxxx',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
