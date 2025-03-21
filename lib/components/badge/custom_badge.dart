import 'package:lookme/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomBadge extends StatelessWidget {
  final String title;
  final dynamic backgroundColor;
  final dynamic textColor;
  final bool? rounded;
  final String? size;

  const CustomBadge(
      {super.key,
      required this.title,
      this.backgroundColor,
      this.textColor,
      this.size,
      this.rounded});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: size == 'lg'
              ? 12
              : size == 'md'
                  ? 10
                  : 8,
          vertical: size == 'lg'
              ? 6
              : size == 'md'
                  ? 4
                  : 2),
      decoration: BoxDecoration(
          color: backgroundColor ?? IKColors.primary,
          borderRadius: BorderRadius.circular(rounded == true ? 20 : 4)),
      child: Text(title,
          style: size == 'lg'
              ? Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.merge(TextStyle(color: textColor ?? Colors.white))
              : size == 'md'
                  ? Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.merge(TextStyle(color: textColor ?? Colors.white))
                  : Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.merge(TextStyle(color: textColor ?? Colors.white))),
    );
  }
}
