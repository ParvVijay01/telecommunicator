import 'package:jctelecaller/components/list/list_item.dart';
import 'package:jctelecaller/utils/constants/colors.dart';
import 'package:jctelecaller/utils/constants/images.dart';
import 'package:jctelecaller/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class Lists extends StatelessWidget {
  const Lists({super.key});

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
                title: const Text('List Styles'),
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
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1,
                                      color: Theme.of(context).dividerColor))),
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 15),
                          child: Text('Default List',
                              style: Theme.of(context).textTheme.titleLarge),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              ListItem(
                                onTap: () {},
                                title: "Cart Checkout View",
                              ),
                              const SizedBox(height: 5),
                              ListItem(
                                onTap: () {},
                                title: "Success Sheet",
                              ),
                              const SizedBox(height: 5),
                              ListItem(
                                onTap: () {},
                                title: "Login Sheet",
                              ),
                              const SizedBox(height: 5),
                              ListItem(
                                onTap: () {},
                                title: "Register Sheet",
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius:
                            BorderRadius.circular(IKSizes.borderRadiusSm)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1,
                                      color: Theme.of(context).dividerColor))),
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 15),
                          child: Text('List with icon',
                              style: Theme.of(context).textTheme.titleLarge),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              ListItem(
                                onTap: () {},
                                icon: const Icon(Icons.shopping_bag_outlined,
                                    color: IKColors.primary, opticalSize: 16),
                                title: "Cart Checkout View",
                              ),
                              const SizedBox(height: 5),
                              ListItem(
                                onTap: () {},
                                icon: const Icon(
                                    Icons.check_circle_outline_outlined,
                                    color: IKColors.primary,
                                    opticalSize: 16),
                                title: "Success Sheet",
                              ),
                              const SizedBox(height: 5),
                              ListItem(
                                onTap: () {},
                                icon: const Icon(Icons.login,
                                    color: IKColors.primary, opticalSize: 16),
                                title: "Login Sheet",
                              ),
                              const SizedBox(height: 5),
                              ListItem(
                                onTap: () {},
                                icon: const Icon(Icons.app_registration_rounded,
                                    color: IKColors.primary, opticalSize: 16),
                                title: "Register Sheet",
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius:
                            BorderRadius.circular(IKSizes.borderRadiusSm)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1,
                                      color: Theme.of(context).dividerColor))),
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 15),
                          child: Text('List with image',
                              style: Theme.of(context).textTheme.titleLarge),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              ListItem(
                                onTap: () {},
                                image: ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image.asset(
                                    IKImages.chatUser5,
                                    height: 30,
                                    width: 30,
                                  ),
                                ),
                                title: "James",
                              ),
                              const SizedBox(height: 5),
                              ListItem(
                                onTap: () {},
                                image: ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image.asset(
                                    IKImages.chatUser2,
                                    height: 30,
                                    width: 30,
                                  ),
                                ),
                                title: "Robert",
                              ),
                              const SizedBox(height: 5),
                              ListItem(
                                onTap: () {},
                                image: ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image.asset(
                                    IKImages.chatUser3,
                                    height: 30,
                                    width: 30,
                                  ),
                                ),
                                title: "John Doe",
                              ),
                              const SizedBox(height: 5),
                              ListItem(
                                onTap: () {},
                                image: ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image.asset(
                                    IKImages.chatUser4,
                                    height: 30,
                                    width: 30,
                                  ),
                                ),
                                title: "Devid geta",
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
