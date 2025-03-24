import 'package:jctelecaller/components/product/product_cart.dart';
import 'package:jctelecaller/utils/constants/colors.dart';
import 'package:jctelecaller/utils/constants/images.dart';
import 'package:jctelecaller/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TrackOrder extends StatelessWidget {
  const TrackOrder({super.key});

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
                title: Text('Track Order',
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 1,
                              color: Theme.of(context).dividerColor))),
                  child: Column(
                    children: [
                      const ProductCart(
                        id: '10',
                        title: 'Bluebell Hand Block Tiered',
                        price: '\$80',
                        oldPrice: '\$95',
                        image: IKImages.product1,
                        offer: '70% OFF',
                        review: '(2K Review)',
                        count: '10',
                        orderStatus: 'ongoing',
                        quantity: '2',
                        orderStatusRemove: true,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 0),
                  color: Theme.of(context).cardColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: Text('Track Order',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.merge(TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18))),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      width: 2,
                                      height: 20,
                                      color: Colors.transparent,
                                    ),
                                    Container(
                                      height: 24,
                                      width: 24,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: IKColors.primary,
                                      ),
                                      alignment: Alignment.center,
                                      child: const Icon(Icons.check,
                                          color: Colors.white, size: 16),
                                    ),
                                    Container(
                                      width: 2,
                                      height: 40,
                                      color: IKColors.primary,
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      bottom: 20, left: 10),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text('Order Placed',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge
                                                  ?.merge(const TextStyle(
                                                      color:
                                                          IKColors.primary))),
                                          const SizedBox(width: 10),
                                          Text('27 Dec 2023',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.merge(TextStyle(
                                                      color: Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark
                                                          ? Color.fromRGBO(255,
                                                              255, 255, 0.5)
                                                          : Color.fromARGB(
                                                              126, 0, 0, 0))))
                                        ],
                                      ),
                                      const SizedBox(height: 3),
                                      Text('We have received your order',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.merge(TextStyle(
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium
                                                      ?.color)))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      width: 2,
                                      height: 20,
                                      color: IKColors.primary,
                                    ),
                                    Container(
                                      height: 24,
                                      width: 24,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: IKColors.primary,
                                      ),
                                      alignment: Alignment.center,
                                      child: const Icon(Icons.check,
                                          color: Colors.white, size: 16),
                                    ),
                                    Container(
                                      width: 2,
                                      height: 40,
                                      color: IKColors.primary,
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      bottom: 20, left: 10),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text('Order Confirm',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge
                                                  ?.merge(const TextStyle(
                                                      color:
                                                          IKColors.primary))),
                                          const SizedBox(width: 10),
                                          Text('27 Dec 2023',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.merge(TextStyle(
                                                      color: Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark
                                                          ? Color.fromRGBO(255,
                                                              255, 255, 0.5)
                                                          : Color.fromARGB(
                                                              126, 0, 0, 0))))
                                        ],
                                      ),
                                      const SizedBox(height: 3),
                                      Text('We has been confirmed',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.merge(TextStyle(
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium
                                                      ?.color)))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      width: 2,
                                      height: 20,
                                      color: Theme.of(context).canvasColor,
                                    ),
                                    Container(
                                      height: 24,
                                      width: 24,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 2,
                                          color: Theme.of(context).canvasColor,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      alignment: Alignment.center,
                                    ),
                                    Container(
                                      width: 2,
                                      height: 40,
                                      color: Theme.of(context).canvasColor,
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      bottom: 20, left: 10),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text('Order Processed',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge),
                                          const SizedBox(width: 10),
                                          Text('28 Dec 2023',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.merge(const TextStyle(
                                                      color: IKColors.primary)))
                                        ],
                                      ),
                                      const SizedBox(height: 3),
                                      Text('We are preparing your order',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      width: 2,
                                      height: 20,
                                      color: Theme.of(context).canvasColor,
                                    ),
                                    Container(
                                      height: 24,
                                      width: 24,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 2,
                                          color: Theme.of(context).canvasColor,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      alignment: Alignment.center,
                                    ),
                                    Container(
                                      width: 2,
                                      height: 40,
                                      color: Theme.of(context).canvasColor,
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      bottom: 20, left: 10),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text('Ready To Ship',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge),
                                          const SizedBox(width: 10),
                                          Text('29 Dec 2023',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.merge(const TextStyle(
                                                      color: IKColors.primary)))
                                        ],
                                      ),
                                      const SizedBox(height: 3),
                                      Text('Your order is ready for shipping',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      width: 2,
                                      height: 20,
                                      color: Theme.of(context).canvasColor,
                                    ),
                                    Container(
                                      height: 24,
                                      width: 24,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 2,
                                          color: Theme.of(context).canvasColor,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      alignment: Alignment.center,
                                    ),
                                    Container(
                                      width: 2,
                                      height: 40,
                                      color: Colors.transparent,
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      bottom: 20, left: 10),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text('Out For Delivery',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge),
                                          const SizedBox(width: 10),
                                          Text('30 Dec 2023',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.merge(const TextStyle(
                                                      color: IKColors.primary)))
                                        ],
                                      ),
                                      const SizedBox(height: 3),
                                      Text('Your order is out for delivery',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
