import 'package:flutter/material.dart';

class SettingCard extends StatelessWidget {
  final String title;
  final IconData leadingIcon;
  final Widget widget;
  final double bottomPadding;
  const SettingCard({
    super.key,
    required this.title,
    required this.leadingIcon,
    required this.widget,
    this.bottomPadding = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        tileColor: Theme.of(context).colorScheme.surfaceContainer,
        title: Text(title, style: Theme.of(context).textTheme.bodyMedium),
        leading: Icon(leadingIcon),
        trailing: widget,
      ),
    );
  }
}
