import 'package:lookme/utils/constants/colors.dart';
import 'package:lookme/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class Coupons extends StatelessWidget {
  Coupons({super.key});

  final List<Map<String, String>> couponsData = [
    {
      'off': '20%',
      'title': 'Home Decor',
      'desc': 'On minimum purchase of Rs. 1,999',
    },
    {
      'off': '50%',
      'title': 'Home Furnishing',
      'desc': 'On minimum purchase of Rs. 2,999',
    },
    {
      'off': '25%',
      'title': 'Mobile Accessories',
      'desc': 'On minimum purchase of Rs. 999',
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
                title: const Text('Coupons'),
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
          constraints: const BoxConstraints(maxWidth: IKSizes.container),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: couponsData.map((item) {
                return Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                      color: Theme.of(context).canvasColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                            right: 15, left: 10, top: 4, bottom: 4),
                        decoration: BoxDecoration(
                            border: Border(
                                right: BorderSide(
                                    width: 1,
                                    color: Theme.of(context).dividerColor))),
                        child: Column(
                          children: [
                            Text(item['off']!,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.merge(const TextStyle(
                                        fontWeight: FontWeight.w400))),
                            const SizedBox(height: 4),
                            Text('Off',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.merge(const TextStyle(
                                        fontWeight: FontWeight.w400))),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(item['title']!,
                                  style:
                                      Theme.of(context).textTheme.titleLarge),
                              const SizedBox(height: 2),
                              Text(item['desc']!,
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
