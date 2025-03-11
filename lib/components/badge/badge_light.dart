import 'package:lookme/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class BadgeLight extends StatelessWidget {

  final String title;
  final dynamic color;
  final dynamic textColor;
  final bool? rounded;
  final String? size;


  const BadgeLight({ super.key, required this.title, this.color, this.textColor, this.size, this.rounded });

  @override
  Widget build(BuildContext context){
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: Opacity(
            opacity: .2,
            child: Container(
              decoration: BoxDecoration(
                color: color ?? IKColors.primary,
                borderRadius: BorderRadius.circular(rounded == true ? 20  : 4)
              ),
            ),
          )
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: size == 'lg' ? 12 : size == 'md' ? 10 : 8,
            vertical: size == 'lg' ? 6 : size == 'md' ? 4 : 2
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(rounded == true ? 20  : 4)
          ),
          child: Text(
            title,
            style: size == 'lg' ?
              Theme.of(context).textTheme.bodyLarge?.merge(TextStyle(color: textColor ?? color ?? IKColors.primary))
              :
              size == 'md' ?
              Theme.of(context).textTheme.bodyMedium?.merge(TextStyle(color: textColor ?? color ?? IKColors.primary))
              :
              Theme.of(context).textTheme.bodySmall?.merge(TextStyle(color: textColor ?? color ?? IKColors.primary))
          ),
        ),
      ],
    );
  }
}