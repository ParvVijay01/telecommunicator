import 'package:lookme/utils/constants/colors.dart';
import 'package:lookme/utils/constants/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BorderInput extends StatefulWidget {
  final String? hintText;
  final String? type;
  final dynamic prefixIcon;
  final dynamic keyboardType;
  final Function(String?)? onChangeEvent;

  const BorderInput(
      {super.key,
      this.hintText,
      this.type,
      this.onChangeEvent,
      this.prefixIcon,
      this.keyboardType});

  @override
  // ignore: library_private_types_in_public_api
  _BorderInputState createState() => _BorderInputState();
}

class _BorderInputState extends State<BorderInput> {
  bool _showPassword = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChangeEvent,
      obscureText: widget.type == 'password' ? _showPassword : false,
      style: Theme.of(context).textTheme.titleMedium,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.bodyMedium,
        enabledBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(color: Theme.of(context).dividerColor, width: 2),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: IKColors.primary, width: 2),
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
