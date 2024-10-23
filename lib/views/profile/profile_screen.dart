import 'package:app_test/componants/confirmation_dialog.dart';
import 'package:app_test/componants/language_select_dialog.dart';
import 'package:app_test/config/hive_constants.dart';
import 'package:app_test/services/hive_service.dart';
import 'package:app_test/views/profile/widgets/setting_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';

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

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => ConfirmationDialog(
        title: 'Logout',
        message: 'Are you sure you want to logout?',
        negativeText: 'Cancel',
        positiveText: 'Logout',
      ),
    );
  }

  void _showLanguageSelectDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => const LanguageSelectDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ValueListenableBuilder(
              valueListenable: Hive.box(HiveConstants.settingsBox).listenable(),
              builder: (context, settingsBox, _) {
                final isDarkMode = settingsBox.get(HiveConstants.isDarkModeKey,
                    defaultValue: false) as bool;
                return SettingCard(
                  leadingIcon: Icons.dark_mode_outlined,
                  title: 'Dark Mode',
                  widget: Switch(
                    value: isDarkMode,
                    onChanged: (value) =>
                        HiveService().setAppThemeMode(isDarkMode: value),
                  ),
                );
              }),
          ValueListenableBuilder(
            valueListenable: Hive.box(HiveConstants.settingsBox).listenable(),
            builder: (context, settingsBox, _) {
              final languageCode = settingsBox.get(HiveConstants.languageKey, defaultValue: 'en') as String;
              return SettingCard(
                leadingIcon: Icons.language_outlined,
                title: 'Language',
                widget: Text(
                  languageCode == 'en' ? 'English' : 'Bangla',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
                onTap: () => _showLanguageSelectDialog(context),
              );
            }
          ),
          SettingCard(
            leadingIcon: Icons.person,
            title: 'Logout',
            widget: Icon(
              Icons.logout,
              color: Colors.red,
            ),
            onTap: () => _showConfirmationDialog(context),
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
