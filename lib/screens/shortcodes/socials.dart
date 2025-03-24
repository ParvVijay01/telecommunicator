import 'package:jctelecaller/components/social/social_button.dart';
import 'package:jctelecaller/utils/constants/colors.dart';
import 'package:jctelecaller/utils/constants/sizes.dart';
import 'package:jctelecaller/utils/constants/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Socials extends StatelessWidget {
  const Socials({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(IKSizes.container, IKSizes.headerHeight),
          child: Container(
            alignment: Alignment.center,
            child: Container(
              constraints: const BoxConstraints(maxWidth: IKSizes.container),
              child: AppBar(
                leading: Builder(
                  builder: (context) {
                    return IconButton(
                      icon: Icon(Icons.arrow_back_ios, size: 20),
                      iconSize: 28,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    );
                  },
                ),
                title: const Text('Socials'),
                centerTitle: true,
                bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(1.0),
                    child: Container(
                      color: IKColors.light,
                      height: 1.0,
                    )),
              ),
            ),
          )),
      body: Container(
        alignment: Alignment.topCenter,
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: IKSizes.container,
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(15),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius:
                            BorderRadius.circular(IKSizes.borderRadiusSm)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 12),
                          child: Text('Social Icons',
                              style: Theme.of(context).textTheme.titleLarge),
                        ),
                        Divider(
                            height: 1, color: Theme.of(context).dividerColor),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Wrap(
                            children: [
                              IconButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF3f6eeb)),
                                iconSize: 30,
                                // ignore: deprecated_member_use
                                icon: SvgPicture.string(
                                  IKSvg.facebook,
                                  height: 22,
                                  width: 22,
                                  color: Colors.white,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Theme.of(context)
                                        .dividerColor
                                        .withOpacity(.5)),
                                iconSize: 28,
                                icon: SvgPicture.string(IKSvg.google,
                                    height: 22, width: 22),
                              ),
                              IconButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 0, 0, 0)),
                                iconSize: 28,
                                // ignore: deprecated_member_use
                                icon: SvgPicture.string(
                                  IKSvg.twitter,
                                  height: 22,
                                  width: 22,
                                  color: Colors.white,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFd51a2b)),
                                iconSize: 28,
                                // ignore: deprecated_member_use
                                icon: SvgPicture.string(
                                  IKSvg.pinterest,
                                  height: 22,
                                  width: 22,
                                  color: Colors.white,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Theme.of(context)
                                        .dividerColor
                                        .withOpacity(.5)),
                                iconSize: 28,
                                icon: SvgPicture.string(IKSvg.instagram,
                                    height: 22, width: 22),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius:
                            BorderRadius.circular(IKSizes.borderRadiusSm)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 12),
                          child: Text('Social Buttons',
                              style: Theme.of(context).textTheme.titleLarge),
                        ),
                        Divider(
                            height: 1, color: Theme.of(context).dividerColor),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Wrap(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, bottom: 10),
                                child: SocialButton(
                                  onTap: () {},
                                  type: 'facebook',
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, bottom: 10),
                                child: SocialButton(
                                  onTap: () {},
                                  type: 'google',
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, bottom: 10),
                                child: SocialButton(
                                  onTap: () {},
                                  type: 'twitter',
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, bottom: 10),
                                child: SocialButton(
                                  onTap: () {},
                                  type: 'pinterest',
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, bottom: 10),
                                child: SocialButton(
                                  onTap: () {},
                                  type: 'instagram',
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
