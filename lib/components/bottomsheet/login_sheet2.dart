import 'package:lookme/utils/constants/colors.dart';
import 'package:lookme/utils/constants/images.dart';
import 'package:lookme/utils/constants/sizes.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class LoginSheet2 extends StatefulWidget {
  const LoginSheet2({super.key});

  @override
  State<LoginSheet2> createState() => _LoginSheet2State();
}

class _LoginSheet2State extends State<LoginSheet2> {
  String activeInput = 'phone';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        color: Theme.of(context).cardColor,
        height: 500,
        width: MediaQuery.of(context).size.width > IKSizes.container
            ? IKSizes.container
            : double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    IKImages.logo,
                    height: 25,
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      iconSize: 26,
                      icon: Icon(Icons.close,
                          color:
                              Theme.of(context).textTheme.bodyMedium?.color)),
                ],
              ),
            ),
            Image.asset(IKImages.banner1),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Unlock personalized content \ntailored just for you',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Enter Mobile number',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      activeInput == 'email'
                          ? TextButton(
                              onPressed: () {
                                setState(() {
                                  activeInput = 'phone';
                                });
                              },
                              child: Text(
                                'Use Phone Number',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall
                                    ?.merge(const TextStyle(
                                        color: IKColors.primary)),
                              ))
                          : TextButton(
                              onPressed: () {
                                setState(() {
                                  activeInput = 'email';
                                });
                              },
                              child: Text(
                                'Use Email Id',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall
                                    ?.merge(const TextStyle(
                                        color: IKColors.primary)),
                              )),
                    ],
                  ),
                  activeInput == 'email'
                      ? TextField(
                          decoration: InputDecoration(
                              hintText: 'Enter your email',
                              contentPadding: const EdgeInsets.all(18),
                              prefixIcon: const Icon(Icons.email_outlined,
                                  color: IKColors.primary),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).dividerColor,
                                    width: 2.0),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: IKColors.primary, width: 2.0))),
                          keyboardType: TextInputType.phone,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.merge(
                                  const TextStyle(fontWeight: FontWeight.w400)),
                        )
                      : TextField(
                          maxLength: 10,
                          decoration: InputDecoration(
                              hintText: 'Phone number',
                              counterText: "",
                              contentPadding: const EdgeInsets.all(18),
                              prefixIcon: SizedBox(
                                height: 50,
                                width: 125,
                                child: CountryCodePicker(
                                  dialogSize: Size(IKSizes.container - 40,
                                      MediaQuery.of(context).size.height - 200),
                                  boxDecoration: BoxDecoration(
                                      color: Theme.of(context).cardColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  onChanged: print,
                                  showFlagMain: true,
                                  initialSelection: 'IN',
                                  alignLeft: true,
                                  padding: const EdgeInsets.all(0),
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).dividerColor,
                                    width: 2.0),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: IKColors.primary, width: 2.0))),
                          keyboardType: TextInputType.phone,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.merge(
                                  const TextStyle(fontWeight: FontWeight.w400)),
                        ),
                  const SizedBox(height: 12),
                  RichText(
                    text: TextSpan(
                      text: "By continuing, you agree to lookme's",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.merge(const TextStyle(fontWeight: FontWeight.w400)),
                      children: const <TextSpan>[
                        TextSpan(
                            text: ' Terms of Use',
                            style: TextStyle(
                                color: IKColors.primary,
                                fontWeight: FontWeight.w600)),
                        TextSpan(text: ' and'),
                        TextSpan(
                            text: ' Privacy Policy.',
                            style: TextStyle(
                                color: IKColors.primary,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: IKColors.secondary,
                        side: const BorderSide(color: IKColors.secondary),
                        foregroundColor: IKColors.title),
                    child: const Text('Continue'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
