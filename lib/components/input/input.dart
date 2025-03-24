import 'package:jctelecaller/utils/constants/colors.dart';
import 'package:jctelecaller/utils/constants/sizes.dart';
import 'package:jctelecaller/utils/constants/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Input extends StatefulWidget {
  final String? hintText;
  final String? type;
  final String? size;
  final dynamic prefixIcon;
  final Function(String?)? onChangeEvent;

  const Input(
      {super.key,
      this.hintText,
      this.type,
      this.size,
      this.onChangeEvent,
      this.prefixIcon});

  @override
  // ignore: library_private_types_in_public_api
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  bool _showPassword = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChangeEvent,
      obscureText: widget.type == 'password' ? _showPassword : false,
      style: Theme.of(context).textTheme.titleMedium,
      decoration: InputDecoration(
        hintText: widget.hintText,
        filled: true,
        fillColor: Theme.of(context).dividerColor.withOpacity(.3),
        hintStyle: Theme.of(context).textTheme.bodyMedium,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).dividerColor),
          borderRadius: BorderRadius.circular(IKSizes.borderRadiusSm),
        ),
        contentPadding: EdgeInsets.symmetric(
            vertical: widget.size == 'sm'
                ? 2
                : widget.size == 'lg'
                    ? 18
                    : 12,
            horizontal: 15),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: IKColors.primary),
          borderRadius: BorderRadius.circular(IKSizes.borderRadiusSm),
        ),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.type == 'password'
            ? IconButton(
                // ignore: deprecated_member_use
                icon: _showPassword
                    ?
                    // ignore: deprecated_member_use
                    SvgPicture.string(IKSvg.eyeoff,
                        height: 18,
                        width: 18,
                        color: Theme.of(context).textTheme.bodyLarge?.color)
                    :
                    // ignore: deprecated_member_use
                    SvgPicture.string(IKSvg.eye,
                        height: 18,
                        width: 18,
                        color: Theme.of(context).textTheme.bodyLarge?.color),
                onPressed: () {
                  setState(() {
                    _showPassword = !_showPassword;
                  });
                },
              )
            : null,
      ),
    );
  }
}
