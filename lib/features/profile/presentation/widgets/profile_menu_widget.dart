import 'package:flutter/material.dart';

class ProfileMenuWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color? textColor;
  final bool endIcon;
  final VoidCallback onPress;

  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    this.textColor,
    this.endIcon = true,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: textColor),
      title: Text(title, style: TextStyle(color: textColor)),
      trailing: endIcon ? const Icon(Icons.arrow_forward_ios) : null,
      onTap: onPress,
    );
  }
}
