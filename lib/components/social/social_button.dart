import 'package:lookme/utils/constants/sizes.dart';
import 'package:lookme/utils/constants/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialButton extends StatelessWidget {
  final String type;
  final Function() onTap;
  final dynamic title;

  const SocialButton(
      {super.key, required this.type, required this.onTap, this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:
            const EdgeInsets.only(left: 25, right: 25, top: 12, bottom: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(type == 'google'
                ? 0
                : type == 'facebook'
                    ? 0
                    : IKSizes.radiusMd),
            color: type == 'facebook'
                ? Theme.of(context).canvasColor
                : type == 'twitter'
                    ? const Color.fromARGB(255, 0, 0, 0)
                    : type == 'pinterest'
                        ? const Color(0xFFd51a2b)
                        : type == 'instagram'
                            ? Theme.of(context).dividerColor.withOpacity(.5)
                            : type == 'google'
                                ? Theme.of(context).canvasColor
                                : Colors.black),
        alignment: Alignment.center,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                type == 'facebook'
                    ? title ?? 'Facebook'
                    : type == 'twitter'
                        ? title ?? 'Twitter'
                        : type == 'pinterest'
                            ? title ?? 'Pinterest'
                            : type == 'instagram'
                                ? title ?? 'Instagram'
                                : type == 'google'
                                    ? title ?? 'Google'
                                    : '',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: (type == 'google' ||
                            type == 'instagram' ||
                            type == 'facebook')
                        ? Theme.of(context).textTheme.bodyLarge?.color
                        : Colors.white),
              ),
            ),
            Positioned(
              top: 2,
              left: 0,
              child: SvgPicture.string(
                type == 'facebook'
                    ? IKSvg.facebook
                    : type == 'twitter'
                        ? IKSvg.twitter
                        : type == 'pinterest'
                            ? IKSvg.pinterest
                            : type == 'instagram'
                                ? IKSvg.instagram
                                : type == 'google'
                                    ? IKSvg.google
                                    : '',
                height: 20,
                width: 20,
                // ignore: deprecated_member_use
                color: (type == 'instagram' ||
                        type == 'google' ||
                        type == 'facebook')
                    ? null
                    : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
