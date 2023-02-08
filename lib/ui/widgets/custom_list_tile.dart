import 'package:flutter/material.dart';
import 'package:todo_applaudo/ui/style/inter_style.dart';
import 'package:todo_applaudo/ui/style/theme_color.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool disabled;
  final ValueChanged<bool?>? onChanged;
  final Color? fillColor;
  final Color? checkColor;
  final bool value;
  final Widget? titleWidget;

  const CustomListTile({
    Key? key,
    required this.title,
    required this.subtitle,
    this.disabled = false,
    this.onChanged,
    this.fillColor,
    this.checkColor,
    this.value = false,
    this.titleWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isChecked = ValueNotifier<bool>(value);

    return ValueListenableBuilder<bool>(
      valueListenable: isChecked,
      builder: (ctx, checked, _) {
        return LayoutBuilder(
          builder: (context, size) {
            final span = TextSpan(
              text: title,
              style: InterStyle.s3,
            );
            final textPainter = TextPainter(
              text: span,
              maxLines: 1,
              textDirection: TextDirection.ltr,
            );
            textPainter.layout(
              maxWidth: size.maxWidth - 60,
            );
            return MaterialButton(
              onPressed: disabled
                  ? null
                  : () {
                      onChanged?.call(checked);
                      isChecked.value = checked ? false : true;
                    },
              padding: const EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: textPainter.didExceedMaxLines
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 16,
                    ),
                    child: SizedBox(
                      width: 8,
                      height: 8,
                      child: Checkbox(
                        side: MaterialStateBorderSide.resolveWith(
                          (states) => const BorderSide(
                              width: 1.0, color: ThemeColors.ghost),
                        ),
                        checkColor: checkColor ?? ThemeColors.comet,
                        fillColor: MaterialStateProperty.all<Color>(
                          disabled ? Colors.grey : fillColor ?? Colors.white,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            2,
                          ),
                        ),
                        value: disabled ? false : checked,
                        onChanged: (bool? newVal) {
                          isChecked.value = newVal ?? false;
                          onChanged?.call(newVal);
                        },
                      ),
                    ),
                  ),
                  Flexible(
                    child: titleWidget != null
                        ? titleWidget!
                        : Column(
                            children: [
                              Text(
                                title,
                                style: InterStyle.s3.copyWith(
                                  color: disabled ? ThemeColors.comet : null,
                                ),
                              ),
                              Text(
                                subtitle,
                                style: InterStyle.s3.copyWith(
                                  color: disabled ? ThemeColors.ghost : null,
                                ),
                              ),
                            ],
                          ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
