import 'package:jctelecaller/components/bottomsheet/notification_sheet.dart';
import 'package:jctelecaller/components/list/list_item.dart';
import 'package:jctelecaller/utils/constants/colors.dart';
import 'package:jctelecaller/utils/constants/images.dart';
import 'package:jctelecaller/utils/constants/sizes.dart';
import 'package:jctelecaller/utils/constants/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

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
                title: Image.asset(
                  IKImages.logo,
                  height: 24,
                  color: Theme.of(context).textTheme.titleMedium?.color,
                ),
                actions: [
                  Stack(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.notifications_none_outlined),
                        iconSize: 28,
                        onPressed: () {
                          Navigator.pushNamed(context, '/notifications');
                        },
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Container(
                          height: 16,
                          width: 16,
                          decoration: BoxDecoration(
                            color: IKColors.primary,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          alignment: Alignment.center,
                          child: const Text('14',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10)),
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.search),
                    iconSize: 28,
                    onPressed: () {
                      Navigator.pushNamed(context, '/search_screen');
                    },
                  ),
                ],
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  padding: const EdgeInsets.all(15),
                  color: Theme.of(context).cardColor,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(IKImages.profile,
                                height: 40, width: 40),
                          ),
                          const SizedBox(width: 15),
                          Text('Hello,',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.merge(const TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 24))),
                          const SizedBox(width: 5),
                          Text('Roopa',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.merge(const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                      color: IKColors.primary))),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Wrap(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/my_orders');
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width >
                                      IKSizes.container
                                  ? IKSizes.container / 2 - 17.5
                                  : MediaQuery.of(context).size.width / 2 -
                                      17.5,
                              margin: const EdgeInsets.only(bottom: 5),
                              padding: const EdgeInsets.all(12),
                              alignment: Alignment.center,
                              color: Theme.of(context).canvasColor,
                              child: Text('Your order',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.merge(TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15))),
                            ),
                          ),
                          const SizedBox(width: 5),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/wishlist');
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width >
                                      IKSizes.container
                                  ? IKSizes.container / 2 - 17.5
                                  : MediaQuery.of(context).size.width / 2 -
                                      17.5,
                              margin: const EdgeInsets.only(bottom: 5),
                              padding: const EdgeInsets.all(11),
                              alignment: Alignment.center,
                              color: Theme.of(context).canvasColor,
                              child: Text('Wishlist',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.merge(TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15))),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/coupons');
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width >
                                      IKSizes.container
                                  ? IKSizes.container / 2 - 17.5
                                  : MediaQuery.of(context).size.width / 2 -
                                      17.5,
                              padding: const EdgeInsets.all(11),
                              alignment: Alignment.center,
                              color: Theme.of(context).canvasColor,
                              child: Text('Coupons',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.merge(TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15))),
                            ),
                          ),
                          const SizedBox(width: 5),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/track_order');
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width >
                                      IKSizes.container
                                  ? IKSizes.container / 2 - 17.5
                                  : MediaQuery.of(context).size.width / 2 -
                                      17.5,
                              padding: const EdgeInsets.all(11),
                              alignment: Alignment.center,
                              color: Theme.of(context).canvasColor,
                              child: Text('Track order',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.merge(TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15))),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  color: Theme.of(context).cardColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text('Account Settings',
                            style: Theme.of(context).textTheme.headlineMedium),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            ListItem(
                              onTap: () {
                                Navigator.pushNamed(context, '/edit_profile');
                              },
                              icon: SvgPicture.string(
                                IKSvg.profile,
                                width: 20,
                                height: 20,
                                color: IKColors.primary,
                              ),
                              title: "Edit profile",
                            ),
                            ListItem(
                              onTap: () {
                                Navigator.pushNamed(context, '/payment');
                              },
                              icon: SvgPicture.string(
                                IKSvg.card,
                                width: 20,
                                height: 20,
                                color: IKColors.primary,
                              ),
                              title: "Saved Cards & Wallet",
                            ),
                            ListItem(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, '/delivery_address');
                              },
                              icon: SvgPicture.string(
                                IKSvg.address,
                                width: 20,
                                height: 20,
                                color: IKColors.primary,
                              ),
                              title: "Saved Addresses",
                            ),
                            ListItem(
                              onTap: () {
                                Navigator.pushNamed(context, '/Language');
                              },
                              icon: SvgPicture.string(
                                IKSvg.language,
                                width: 20,
                                height: 20,
                                color: IKColors.primary,
                              ),
                              title: "Select Language",
                            ),
                            ListItem(
                              onTap: () {
                                showModalBottomSheet<void>(
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (BuildContext context) {
                                    return const NotificationSheet();
                                  },
                                );
                              },
                              icon: SvgPicture.string(
                                IKSvg.bell,
                                width: 20,
                                height: 20,
                                color: IKColors.primary,
                              ),
                              title: "Notifications Settings",
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  color: Theme.of(context).cardColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text('My Activity',
                            style: Theme.of(context).textTheme.headlineMedium),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            ListItem(
                              onTap: () {
                                Navigator.pushNamed(context, '/write_review');
                              },
                              icon: SvgPicture.string(
                                IKSvg.review,
                                width: 20,
                                height: 20,
                                color: IKColors.primary,
                              ),
                              title: "Reviews",
                            ),
                            ListItem(
                              onTap: () {
                                Navigator.pushNamed(context, '/questions');
                              },
                              icon: SvgPicture.string(
                                IKSvg.comment,
                                width: 20,
                                height: 20,
                                color: IKColors.primary,
                              ),
                              title: "Questions & Answers",
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
