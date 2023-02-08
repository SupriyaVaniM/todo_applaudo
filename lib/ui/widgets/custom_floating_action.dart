import 'package:flutter/material.dart';
import 'package:todo_applaudo/ui/style/theme_color.dart';

class CustomfloatingButton extends StatelessWidget {
  const CustomfloatingButton({
    Key? key,
    this.onPressed,
    this.child,
  }) : super(key: key);
  final VoidCallback? onPressed;
  final Widget? child;
  

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: ThemeColors.blue,
      child: child,);
  }
}