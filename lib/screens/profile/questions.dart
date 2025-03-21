import 'package:accordion/accordion.dart';
import 'package:lookme/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class Questions extends StatelessWidget {
  Questions({super.key});

  final List<Map<String, String>> questionsData = [
    {
      'title': 'What is included with my purchase?',
      'content':
          'Package have the javascript JS, Javascript JSON, XML, .apk, .java, .plist, Well Define Documentation, fonts and icons, Responsive Designs, Image Assets, Customization Options, and many more.'
    },
    {
      'title': 'What features does lookme offer?',
      'content':
          'lookme offers a wide range of features including responsive design, customizable layouts, product catalog pages, shopping cart functionality, checkout pages, user account management, and more.'
    },
    {
      'title': "Can I customize the template's design?",
      'content':
          'Absolutely! lookme is built using JSX, which makes it highly customizable. You can easily adjust colors, fonts, layout structures, and more to match your brand identity.'
    },
    {
      'title': 'Are there pre-designed page templates included?',
      'content':
          'Yes, lookme typically includes pre-designed templates for essential pages like the homepage, product listings, product details, shopping cart, checkout, and user account pages.'
    },
    {
      'title': 'Does lookme provide customer support?',
      'content':
          'lookme offers customer support options for their clients. Check the template documentation or you can directly contact to our support team from here - Click Here'
    },
    {
      'title': 'Is coding knowledge required to use lookme?',
      'content':
          "Basic knowledge of JavaScript JS, XML, and JSX can be helpful for customizing lookme to your needs. However, it's designed to be user- friendly and doesn't necessarily require extensive coding skills."
    },
    {
      'title': 'How can I get started with lookme?',
      'content':
          "To get started, purchase and download the lookme template. Then, follow the included documentation to set up and customize your e-commerce website based on your specific requirements."
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
                  title: Text('Questions',
                      style: Theme.of(context).textTheme.headlineMedium),
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
            child: Accordion(
                headerBorderColor: IKColors.title.withOpacity(0.5),
                headerBorderColorOpened: Theme.of(context).dividerColor,
                headerBorderWidth: 0,
                headerBackgroundColor: Theme.of(context).canvasColor,
                contentBackgroundColor: Theme.of(context).canvasColor,
                contentBorderWidth: 0,
                contentHorizontalPadding: 20,
                scaleWhenAnimating: false,
                openAndCloseAnimation: true,
                headerPadding:
                    const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
                rightIcon: Icon(
                  Icons.keyboard_arrow_down,
                  color: Theme.of(context).textTheme.titleMedium?.color,
                  size: 24,
                ),
                children: questionsData.map((item) {
                  return AccordionSection(
                    contentVerticalPadding: 15,
                    contentHorizontalPadding: 20,
                    header: Text(item['title']!,
                        style: Theme.of(context).textTheme.titleMedium),
                    content: Text(item['content']!,
                        style: Theme.of(context).textTheme.bodyMedium),
                  );
                }).toList()),
          ),
        ));
  }
}
