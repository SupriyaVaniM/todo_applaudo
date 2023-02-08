import 'package:flutter/material.dart';
import 'package:todo_applaudo/ui/style/theme_color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.onPressed,
    this.child,
  }) : super(key: key);
  final VoidCallback? onPressed;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(ThemeColors.blue),
      ),
      child: child,
    );
  }
}