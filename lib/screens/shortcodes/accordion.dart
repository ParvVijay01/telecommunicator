import 'package:accordion/accordion.dart';
import 'package:lookme/utils/constants/colors.dart';
import 'package:lookme/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class AccordionScreen extends StatelessWidget {
  AccordionScreen({super.key});

  final List<Map<String, String>> accordionData = [
    {
      'id': '1',
      'title': 'Who Can Benefit from Ecommerce?',
      'content':
          'Global Reach: Ecommerce allows businesses to reach a global customer base. With an online store, you can sell your products or services to customers anywhere in the world.'
    },
    {
      'id': '2',
      'title': '10 Ways to Maximize Your Profits.',
      'content':
          'Global Reach: Ecommerce allows businesses to reach a global customer base. With an online store, you can sell your products or services to customers anywhere in the world.'
    },
    {
      'id': '3',
      'title': "Exploring the Benefits of Ecommerce",
      'content':
          'Global Reach: Ecommerce allows businesses to reach a global customer base. With an online store, you can sell your products or services to customers anywhere in the world.'
    },
    {
      'id': '4',
      'title': 'The Impact of Ecommerce on Business',
      'content':
          'Global Reach: Ecommerce allows businesses to reach a global customer base. With an online store, you can sell your products or services to customers anywhere in the world.'
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
                  title: const Text('Accordions List'),
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
                          borderRadius: BorderRadius.circular(6)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 12),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1,
                                        color:
                                            Theme.of(context).dividerColor))),
                            child: Text('Classic Accordion',
                                style: Theme.of(context).textTheme.titleLarge),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            child: Accordion(
                                headerBorderColor: Colors.transparent,
                                headerBorderColorOpened:
                                    Theme.of(context).dividerColor,
                                headerBorderWidth: 0,
                                headerBackgroundColor:
                                    Theme.of(context).cardColor,
                                contentBorderWidth: 0,
                                scaleWhenAnimating: false,
                                openAndCloseAnimation: true,
                                disableScrolling: true,
                                contentBackgroundColor:
                                    Theme.of(context).cardColor,
                                contentBorderColor: Colors.transparent,
                                headerPadding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 0),
                                rightIcon: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.color,
                                  size: 24,
                                ),
                                children: accordionData.map((item) {
                                  return AccordionSection(
                                    isOpen: item['id'] == '1' ? true : false,
                                    contentVerticalPadding: 12,
                                    contentHorizontalPadding: 0,
                                    header: Text(item['title']!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium),
                                    content: Text(item['content']!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium),
                                  );
                                }).toList()),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(6)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 12),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1,
                                        color:
                                            Theme.of(context).dividerColor))),
                            child: Text('Accordion with background',
                                style: Theme.of(context).textTheme.titleLarge),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Accordion(
                                headerBorderColor: Colors.transparent,
                                headerBorderColorOpened:
                                    Theme.of(context).dividerColor,
                                headerBorderWidth: 0,
                                headerBackgroundColor:
                                    IKColors.primary.withOpacity(1),
                                headerBackgroundColorOpened: IKColors.primary,
                                contentBorderWidth: 0,
                                disableScrolling: true,
                                paddingBetweenOpenSections: 8,
                                paddingBetweenClosedSections: 8,
                                scaleWhenAnimating: false,
                                openAndCloseAnimation: true,
                                contentBackgroundColor: Theme.of(context)
                                    .dividerColor
                                    .withOpacity(.5),
                                contentBorderColor: Colors.transparent,
                                headerPadding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 12),
                                rightIcon: const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.white,
                                  size: 24,
                                ),
                                children: accordionData.map((item) {
                                  return AccordionSection(
                                    isOpen: item['id'] == '1' ? true : false,
                                    contentVerticalPadding: 10,
                                    contentHorizontalPadding: 12,
                                    header: Text(item['title']!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.merge(TextStyle(
                                                color: Theme.of(context)
                                                    .cardColor))),
                                    content: Text(item['content']!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.merge(const TextStyle(
                                                fontWeight: FontWeight.w400,
                                                color: IKColors.title))),
                                  );
                                }).toList()),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}
