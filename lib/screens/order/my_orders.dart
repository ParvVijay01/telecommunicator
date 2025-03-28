import 'package:jctelecaller/utils/constants/colors.dart';
import 'package:jctelecaller/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  String _activeFilter = 'ongoing';

  void _orderFilter(val) {
    setState(() {
      _activeFilter = val;
      if (val == 'all') {
      } else {}
    });
  }

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
                title: Text('My Order',
                    style: Theme.of(context).textTheme.headlineMedium),
                titleSpacing: 5,
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
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(0),
                child: Row(
                  children: [
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        _orderFilter('ongoing');
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 10, right: 5, top: 10, bottom: 10),
                        color: _activeFilter == 'ongoing'
                            ? IKColors.title
                            : Theme.of(context).canvasColor,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Ongoing',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.merge(TextStyle(
                                        fontSize: 15,
                                        color: _activeFilter == 'ongoing'
                                            ? IKColors.card
                                            : Theme.of(context)
                                                .textTheme
                                                .titleMedium
                                                ?.color,
                                        fontWeight: FontWeight.w500))),
                          ],
                        ),
                      ),
                    )),
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        _orderFilter('completed');
                      },
                      child: Container(
                        color: _activeFilter == 'completed'
                            ? IKColors.title
                            : Theme.of(context).canvasColor,
                        margin: EdgeInsets.only(
                            left: 5, right: 10, top: 10, bottom: 10),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Completed',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.merge(TextStyle(
                                        fontSize: 15,
                                        color: _activeFilter == 'completed'
                                            ? IKColors.card
                                            : Theme.of(context)
                                                .textTheme
                                                .titleMedium
                                                ?.color,
                                        fontWeight: FontWeight.w500))),
                          ],
                        ),
                      ),
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
