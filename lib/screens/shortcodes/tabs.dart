import 'package:lookme/utils/constants/colors.dart';
import 'package:lookme/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:tab_container/tab_container.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
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
                title: const Text('Tabs'),
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
                  Text('Tab top',
                      style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: 10),
                  TabContainer(
                    tabEdge: TabEdge.top,
                    tabsStart: 0,
                    tabExtent: 45,
                    tabsEnd: 0.9,
                    tabMaxLength: 100,
                    borderRadius: BorderRadius.circular(IKSizes.radiusMd),
                    tabBorderRadius: BorderRadius.circular(10),
                    childPadding: const EdgeInsets.all(20.0),
                    selectedTextStyle: TextStyle(
                      color: Theme.of(context).textTheme.titleMedium?.color,
                      fontSize: 15.0,
                    ),
                    unselectedTextStyle: TextStyle(
                      color: Theme.of(context).textTheme.titleMedium?.color,
                      fontSize: 15.0,
                    ),
                    colors: [
                      Theme.of(context).cardColor,
                      Theme.of(context).cardColor,
                      Theme.of(context).cardColor,
                    ],
                    tabs: const [
                      Text('Home'),
                      Text('Profile'),
                      Text('Settings'),
                    ],
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text('This is a heading 1',
                              style: Theme.of(context).textTheme.titleLarge),
                          const SizedBox(height: 6),
                          Text(
                            "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text('This is a heading 2',
                              style: Theme.of(context).textTheme.titleLarge),
                          const SizedBox(height: 6),
                          Text(
                            "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text('This is a heading 3',
                              style: Theme.of(context).textTheme.titleLarge),
                          const SizedBox(height: 6),
                          Text(
                            "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(color: Theme.of(context).dividerColor, height: 60),
                  Text('Tab Right',
                      style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: 10),
                  TabContainer(
                    tabEdge: TabEdge.right,
                    tabsStart: 0.1,
                    tabExtent: 90,
                    tabsEnd: 0.9,
                    tabMaxLength: 100,
                    borderRadius: BorderRadius.circular(IKSizes.radiusMd),
                    tabBorderRadius: BorderRadius.circular(10),
                    childPadding: const EdgeInsets.all(20.0),
                    selectedTextStyle: TextStyle(
                      color: Theme.of(context).textTheme.titleMedium?.color,
                      fontSize: 15.0,
                    ),
                    unselectedTextStyle: TextStyle(
                      color: Theme.of(context).textTheme.titleMedium?.color,
                      fontSize: 15.0,
                    ),
                    colors: [
                      Theme.of(context).cardColor,
                      Theme.of(context).cardColor,
                      Theme.of(context).cardColor,
                    ],
                    tabs: const [
                      Text('Home'),
                      Text('Profile'),
                      Text('Settings'),
                    ],
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text('This is a heading 1',
                              style: Theme.of(context).textTheme.titleLarge),
                          const SizedBox(height: 6),
                          Text(
                            "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text('This is a heading 2',
                              style: Theme.of(context).textTheme.titleLarge),
                          const SizedBox(height: 6),
                          Text(
                            "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text('This is a heading 3',
                              style: Theme.of(context).textTheme.titleLarge),
                          const SizedBox(height: 6),
                          Text(
                            "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(color: Theme.of(context).dividerColor, height: 60),
                  Text('Tab left',
                      style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: 10),
                  TabContainer(
                    tabEdge: TabEdge.left,
                    tabsStart: 0.1,
                    tabExtent: 90,
                    tabsEnd: 0.9,
                    tabMaxLength: 100,
                    borderRadius: BorderRadius.circular(IKSizes.radiusMd),
                    tabBorderRadius: BorderRadius.circular(10),
                    childPadding: const EdgeInsets.all(20.0),
                    selectedTextStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                    unselectedTextStyle: TextStyle(
                      color: Theme.of(context).textTheme.titleMedium?.color,
                      fontSize: 15.0,
                    ),
                    colors: const [
                      IKColors.primary,
                      IKColors.primary,
                      IKColors.primary,
                    ],
                    tabs: const [
                      Text('Home'),
                      Text('Profile'),
                      Text('Settings'),
                    ],
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text('This is a heading 1',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.merge(
                                      const TextStyle(color: Colors.white))),
                          const SizedBox(height: 6),
                          Text(
                              "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.merge(
                                      const TextStyle(color: Colors.white))),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text('This is a heading 2',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.merge(
                                      const TextStyle(color: Colors.white))),
                          const SizedBox(height: 6),
                          Text(
                              "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.merge(
                                      const TextStyle(color: Colors.white))),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text('This is a heading 3',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.merge(
                                      const TextStyle(color: Colors.white))),
                          const SizedBox(height: 6),
                          Text(
                              "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.merge(
                                      const TextStyle(color: Colors.white))),
                        ],
                      ),
                    ],
                  ),
                  Divider(color: Theme.of(context).dividerColor, height: 60),
                  Text('Tab bottom',
                      style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: 10),
                  TabContainer(
                    tabEdge: TabEdge.bottom,
                    tabsStart: 0,
                    tabExtent: 45,
                    tabsEnd: 0.9,
                    tabMaxLength: 100,
                    borderRadius: BorderRadius.circular(IKSizes.radiusMd),
                    tabBorderRadius: BorderRadius.circular(10),
                    childPadding: const EdgeInsets.all(20.0),
                    selectedTextStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                    unselectedTextStyle: TextStyle(
                      color: Theme.of(context).textTheme.titleMedium?.color,
                      fontSize: 15.0,
                    ),
                    colors: const [
                      IKColors.primary,
                      IKColors.primary,
                      IKColors.primary,
                    ],
                    tabs: const [
                      Text('Home'),
                      Text('Profile'),
                      Text('Settings'),
                    ],
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text('This is a heading 1',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.merge(
                                      const TextStyle(color: Colors.white))),
                          const SizedBox(height: 6),
                          Text(
                              "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.merge(
                                      const TextStyle(color: Colors.white))),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text('This is a heading 2',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.merge(
                                      const TextStyle(color: Colors.white))),
                          const SizedBox(height: 6),
                          Text(
                              "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.merge(
                                      const TextStyle(color: Colors.white))),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text('This is a heading 3',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.merge(
                                      const TextStyle(color: Colors.white))),
                          const SizedBox(height: 6),
                          Text(
                              "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.merge(
                                      const TextStyle(color: Colors.white))),
                        ],
                      ),
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
