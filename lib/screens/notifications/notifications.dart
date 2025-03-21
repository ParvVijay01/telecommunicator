import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lookme/screens/shortcodes/swipeables.dart';
import 'package:lookme/utils/constants/images.dart';
import 'package:lookme/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class Notifications extends StatelessWidget {
  Notifications({super.key});

  final List<Map<String, dynamic>> notificationData = [
    {
      'image': IKImages.chatUser1,
      'title': 'New Arrivals Alert!',
      'date': '15 July 2023',
    },
    {
      'image': IKImages.chatUser2,
      'title': 'Flash Sale Announcement',
      'date': '15 July 2023',
    },
    {
      'image': IKImages.chatUser3,
      'title': 'Crazy Deals',
      'date': '15 July 2023',
    },
    {
      'image': IKImages.chatUser4,
      'title': 'Exclusive Discounts Inside',
      'date': '15 July 2023',
    },
    {
      'image': IKImages.chatUser5,
      'title': 'Limited Stock - Act Fast!',
      'date': '15 July 2023',
    },
    {
      'image': IKImages.chatUser6,
      'title': 'offer-banner-2',
      'date': '15 July 2023',
    },
    {
      'image': IKImages.chatUser1,
      'title': 'Get Ready to Shop',
      'date': '15 July 2023',
    },
    {
      'image': IKImages.chatUser2,
      'title': "Don't Miss Out on Savings",
      'date': '15 July 2023',
    },
    {
      'image': IKImages.chatUser3,
      'title': "Special Offer Just for You",
      'date': '15 July 2023',
    },
    {
      'image': IKImages.chatUser4,
      'title': 'offer-banner-1',
      'date': '15 July 2023',
    },
    {
      'image': IKImages.chatUser5,
      'title': "Don't Miss Out on Savings",
      'date': '15 July 2023',
    },
    {
      'image': IKImages.chatUser6,
      'title': "Get Ready to Shop",
      'date': '15 July 2023',
    },
  ];

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
                title: const Text('Notifications (12)'),
                centerTitle: true,
                actions: [
                  IconButton(
                    icon: const Icon(Icons.search),
                    iconSize: 28,
                    onPressed: () {
                      Navigator.pushNamed(context, '/search_screen');
                    },
                  )
                ],
                bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(1.0),
                    child: Container(
                      color: IKColors.light,
                      height: 1.0,
                    )),
              ),
            ),
          )),
      body: ListView(
        children: notificationData.map((item) {
          return Slidable(
            // Specify a key if the Slidable is dismissible.
            key: const ValueKey(0),

            // The end action pane is the one at the right or the bottom side.
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: doNothing,
                  backgroundColor: IKColors.title,
                  foregroundColor: IKColors.card,
                  icon: Icons.delete,
                  label: 'Delete',
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15)),
                  // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                ),
              ],
            ),

            // The child of the Slidable is what the user sees when the
            // component is not dragged.
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  border: Border(
                      bottom: BorderSide(
                          width: 1, color: Theme.of(context).dividerColor))),
              child: Row(
                children: [
                  ClipRRect(
                    // borderRadius: BorderRadius.circular(IKSizes.radiusMd),
                    child: Image.asset(item['image']!, height: 60, width: 60),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(item['title']!,
                            style: Theme.of(context).textTheme.headlineSmall),
                        const SizedBox(height: 2),
                        Text(item['date']!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.merge(TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w300))),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
