import 'package:jctelecaller/utils/constants/colors.dart';
import 'package:jctelecaller/utils/constants/sizes.dart';
import 'package:jctelecaller/components/list/list_item.dart';
import 'package:jctelecaller/utils/constants/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Components extends StatelessWidget {
  const Components({super.key});

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
                title: const Text('Components'),
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
            child: Column(children: [
              ListItem(
                onTap: () {
                  Navigator.pushNamed(context, '/accordion');
                },
                icon: SvgPicture.string(
                  IKSvg.accordion,
                  width: 20,
                  height: 20,
                  // ignore: deprecated_member_use
                  color: IKColors.primary,
                ),
                title: "Accordion List",
              ),
              const SizedBox(height: 5),
              ListItem(
                onTap: () {
                  Navigator.pushNamed(context, '/bottomsheet');
                },
                icon: SvgPicture.string(
                  IKSvg.sheet,
                  width: 20,
                  height: 20,
                  // ignore: deprecated_member_use
                  color: IKColors.primary,
                ),
                title: "Bottom Sheets",
              ),
              const SizedBox(height: 5),
              ListItem(
                onTap: () {
                  Navigator.pushNamed(context, '/modalbox');
                },
                icon: SvgPicture.string(
                  IKSvg.cube,
                  width: 20,
                  height: 20,
                  // ignore: deprecated_member_use
                  color: IKColors.primary,
                ),
                title: "Modal Box",
              ),
              const SizedBox(height: 5),
              ListItem(
                onTap: () {
                  Navigator.pushNamed(context, '/buttons');
                },
                icon: SvgPicture.string(
                  IKSvg.accordion,
                  width: 20,
                  height: 20,
                  // ignore: deprecated_member_use
                  color: IKColors.primary,
                ),
                title: "Button Styles",
              ),
              const SizedBox(height: 5),
              ListItem(
                onTap: () {
                  Navigator.pushNamed(context, '/badges');
                },
                icon: SvgPicture.string(
                  IKSvg.badge,
                  width: 20,
                  height: 20,
                  // ignore: deprecated_member_use
                  color: IKColors.primary,
                ),
                title: "Badges",
              ),
              const SizedBox(height: 5),
              ListItem(
                onTap: () {
                  Navigator.pushNamed(context, '/charts');
                },
                icon: SvgPicture.string(
                  IKSvg.charts,
                  width: 20,
                  height: 20,
                  // ignore: deprecated_member_use
                  color: IKColors.primary,
                ),
                title: "Charts",
              ),
              const SizedBox(height: 5),
              ListItem(
                onTap: () {
                  Navigator.pushNamed(context, '/inputs');
                },
                icon: SvgPicture.string(
                  IKSvg.input,
                  width: 20,
                  height: 20,
                  // ignore: deprecated_member_use
                  color: IKColors.primary,
                ),
                title: "Inputs",
              ),
              const SizedBox(height: 5),
              ListItem(
                onTap: () {
                  Navigator.pushNamed(context, '/lists');
                },
                icon: SvgPicture.string(
                  IKSvg.list,
                  width: 20,
                  height: 20,
                  // ignore: deprecated_member_use
                  color: IKColors.primary,
                ),
                title: "List Styles",
              ),
              const SizedBox(height: 5),
              ListItem(
                onTap: () {
                  Navigator.pushNamed(context, '/pricings');
                },
                icon: SvgPicture.string(
                  IKSvg.pricing,
                  width: 20,
                  height: 20,
                  // ignore: deprecated_member_use
                  color: IKColors.primary,
                ),
                title: "Pricings",
              ),
              const SizedBox(height: 5),
              ListItem(
                onTap: () {
                  Navigator.pushNamed(context, '/snackbars');
                },
                icon: SvgPicture.string(
                  IKSvg.accordion,
                  width: 20,
                  height: 20,
                  // ignore: deprecated_member_use
                  color: IKColors.primary,
                ),
                title: "Snackbars",
              ),
              const SizedBox(height: 5),
              ListItem(
                onTap: () {
                  Navigator.pushNamed(context, '/socials');
                },
                icon: SvgPicture.string(
                  IKSvg.social,
                  width: 20,
                  height: 20,
                  // ignore: deprecated_member_use
                  color: IKColors.primary,
                ),
                title: "Socials",
              ),
              const SizedBox(height: 5),
              ListItem(
                onTap: () {
                  Navigator.pushNamed(context, '/swipeables');
                },
                icon: SvgPicture.string(
                  IKSvg.accordion,
                  width: 20,
                  height: 20,
                  // ignore: deprecated_member_use
                  color: IKColors.primary,
                ),
                title: "Swipeable",
              ),
              const SizedBox(height: 5),
              ListItem(
                onTap: () {
                  Navigator.pushNamed(context, '/tabs');
                },
                icon: SvgPicture.string(
                  IKSvg.tabs,
                  width: 20,
                  height: 20,
                  // ignore: deprecated_member_use
                  color: IKColors.primary,
                ),
                title: "Tabs",
              ),
              const SizedBox(height: 5),
              ListItem(
                onTap: () {
                  Navigator.pushNamed(context, '/tables');
                },
                icon: SvgPicture.string(
                  IKSvg.table,
                  width: 20,
                  height: 20,
                  // ignore: deprecated_member_use
                  color: IKColors.primary,
                ),
                title: "Tables",
              ),
              const SizedBox(height: 5),
              ListItem(
                onTap: () {
                  Navigator.pushNamed(context, '/toggle');
                },
                icon: SvgPicture.string(
                  IKSvg.toggle,
                  width: 20,
                  height: 20,
                  // ignore: deprecated_member_use
                  color: IKColors.primary,
                ),
                title: "Toggle",
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
