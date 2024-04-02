import 'package:flutter/material.dart';
import 'package:grocery_admin_panel/consts/constants.dart';
import 'package:grocery_admin_panel/providers/dark_theme_provider.dart';
import 'package:grocery_admin_panel/services/utils.dart';
import 'package:provider/provider.dart';

import '../responsive.dart';



class ButtonsWidget extends StatelessWidget {
  const ButtonsWidget({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.icon,
    required this.backgroundColor,
  }) : super(key: key);
  final VoidCallback onPressed;
  final String text;
  final IconData icon;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    Color color = themeState.getDarkTheme? Colors.black : Colors.white ;
    return ElevatedButton.icon(
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: EdgeInsets.symmetric(
          horizontal: defaultPadding * 1.5,
          vertical: defaultPadding / (Responsive.isDesktop(context) ? 1 : 2),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5)
        )
      ),
      onPressed: () {
        onPressed();
      },
      icon: Icon(icon, size: 20, color: color,),
      label: Text(
        text,
        style: TextStyle(
          color: color
        ),),
    );
  }
}
