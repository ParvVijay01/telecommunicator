import 'package:flutter_svg/flutter_svg.dart';
import 'package:lookme/components/bottomsheet/filter_sheet.dart';
import 'package:lookme/components/drawer/drawer_menu.dart';
import 'package:lookme/components/product/product_card.dart';
import 'package:lookme/utils/constants/images.dart';
import 'package:lookme/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:lookme/utils/constants/svg.dart';

class CategoryItems {
  String title;
  CategoryItems({required this.title});
}

final List<Map<String, dynamic>> productItems = [
  {
    'id': '1',
    'title': 'Bluebell Hand Block Tiered Dress',
    'image': IKImages.product11,
    'price': '80',
    'old-price': '95',
    'Review': '(2k Review)',
    'in-wishlist': '1',
    'count': '10',
    'offer': '40% Off',
    'order-status': 'ongoing',
    'quantity': "2",
    'images': <Map<String, String>>[
      {'src': IKImages.product11},
      {'src': IKImages.product1101},
      {'src': IKImages.product1102},
      {'src': IKImages.product1103},
    ],
  },
  {
    'id': '2',
    'title': 'Bluebell Hand Block Tiered Dress',
    'image': IKImages.product14,
    'price': '80',
    'old-price': '95',
    'Review': '(2k Review)',
    'in-wishlist': '1',
    'count': '10',
    'offer': '40% Off',
    'order-status': 'ongoing',
    'quantity': "4",
    'images': <Map<String, String>>[
      {'src': IKImages.product14},
      {'src': IKImages.product1401},
      {'src': IKImages.product1402},
      {'src': IKImages.product1403},
    ],
  },
  {
    'id': '3',
    'title': 'Bluebell Hand Block Tiered Dress',
    'image': IKImages.product13,
    'price': '80',
    'old-price': '95',
    'Review': '(2k Review)',
    'in-wishlist': '1',
    'count': '10',
    'offer': '40% Off',
    'order-status': 'completed',
    'quantity': "2",
    'images': <Map<String, String>>[
      {'src': IKImages.product13},
      {'src': IKImages.product1301},
      {'src': IKImages.product1302},
      {'src': IKImages.product1303},
    ],
  },
  {
    'id': '4',
    'title': 'Bluebell Hand Block Tiered Dress',
    'image': IKImages.product12,
    'price': '80',
    'old-price': '95',
    'Review': '(2k Review)',
    'in-wishlist': '1',
    'count': '10',
    'offer': '40% Off',
    'order-status': 'ongoing',
    'quantity': "3",
    'images': <Map<String, String>>[
      {'src': IKImages.product12},
      {'src': IKImages.product1201},
      {'src': IKImages.product1202},
      {'src': IKImages.product1203},
    ],
  },
  {
    'id': '5',
    'title': 'Bluebell Hand Block Tiered Dress',
    'image': IKImages.product15,
    'price': '80',
    'old-price': '95',
    'Review': '(2k Review)',
    'in-wishlist': '1',
    'count': '10',
    'offer': '40% Off',
    'order-status': 'completed',
    'quantity': "4",
    'images': <Map<String, String>>[
      {'src': IKImages.product15},
      {'src': IKImages.product1501},
      {'src': IKImages.product1502},
      {'src': IKImages.product1503},
    ],
  },
  {
    'id': '6',
    'title': 'Bluebell Hand Block Tiered Dress',
    'image': IKImages.product16,
    'price': '80',
    'old-price': '95',
    'Review': '(2k Review)',
    'in-wishlist': '1',
    'count': '10',
    'offer': '40% Off',
    'order-status': 'ongoing',
    'quantity': "2",
  },
  {
    'id': '7',
    'title': 'Bluebell Hand Block Tiered Dress',
    'image': IKImages.product17,
    'price': '80',
    'old-price': '95',
    'Review': '(2k Review)',
    'in-wishlist': '1',
    'count': '10',
    'offer': '40% Off',
    'order-status': 'completed',
    'quantity': "6",
    'images': <Map<String, String>>[
      {'src': IKImages.product17},
      {'src': IKImages.product1701},
      {'src': IKImages.product1702},
      {'src': IKImages.product1703},
    ],
  },
  {
    'id': '8',
    'title': 'Bluebell Hand Block Tiered Dress',
    'image': IKImages.product18,
    'price': '80',
    'old-price': '95',
    'Review': '(2k Review)',
    'in-wishlist': '1',
    'count': '10',
    'offer': '40% Off',
    'order-status': 'completed',
    'quantity': "1",
    'images': <Map<String, String>>[
      {'src': IKImages.product18},
      {'src': IKImages.product1801},
      {'src': IKImages.product1802},
      {'src': IKImages.product1803},
    ],
  },
  {
    'id': '9',
    'title': 'Bluebell Hand Block Tiered Dress',
    'image': IKImages.product19,
    'price': '80',
    'old-price': '95',
    'Review': '(2k Review)',
    'in-wishlist': '1',
    'count': '10',
    'offer': '40% Off',
    'order-status': 'ongoing',
    'quantity': "2",
    'images': <Map<String, String>>[
      {'src': IKImages.product19},
      {'src': IKImages.product1901},
      {'src': IKImages.product1902},
      {'src': IKImages.product1903},
    ],
  },
  {
    'id': '10',
    'title': 'Bluebell Hand Block Tiered Dress',
    'image': IKImages.product1,
    'price': '80',
    'old-price': '95',
    'Review': '(2k Review)',
    'in-wishlist': '1',
    'count': '10',
    'offer': '40% Off',
    'order-status': 'completed',
    'quantity': "3",
    'images': <Map<String, String>>[
      {'src': IKImages.product1},
      {'src': IKImages.product2},
      {'src': IKImages.product3},
      {'src': IKImages.product4},
    ],
  },
];

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _scrollController1 = ScrollController();
  final ScrollController _scrollController2 = ScrollController();

  String selectedItems = "All";

  List<CategoryItems> categoryItems = [
    CategoryItems(title: "All"),
    CategoryItems(title: "Child"),
    CategoryItems(title: "Man"),
    CategoryItems(title: "Woman"),
    CategoryItems(title: "Dress"),
    CategoryItems(title: "unisex"),
  ];

  final List<String> items = List.generate(20, (index) => 'Item $index');

  final List<String> imageUrls = [
    IKImages.banner1,
    IKImages.banner2,
    IKImages.banner3,
    IKImages.banner4,
    IKImages.banner5,
  ];

  // void loginSheetTime() async {

  //   Timer(const Duration(seconds: 5), () =>
  //     showModalBottomSheet<void>(
  //       context: context,
  //       isScrollControlled: true,
  //       builder: (BuildContext context) {
  //         return const LoginSheet2();
  //       },
  //     )
  //   );

  // }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // double minScrollExtent1 = _scrollController1.position.minScrollExtent;
      // double maxScrollExtent1 = _scrollController1.position.maxScrollExtent;
      // double minScrollExtent2 = _scrollController2.position.minScrollExtent;
      // double maxScrollExtent2 = _scrollController2.position.maxScrollExtent;

      // animateToMaxMin(maxScrollExtent1, minScrollExtent1, maxScrollExtent1, 25,
      //     _scrollController1);
      // animateToMaxMin(maxScrollExtent2, minScrollExtent2, maxScrollExtent2, 15,
      //     _scrollController2);
    });
  }

  animateToMaxMin(double max, double min, double direction, int seconds,
      ScrollController scrollController) {
    scrollController
        .animateTo(direction,
            duration: Duration(seconds: seconds), curve: Curves.linear)
        .then((value) {
      direction = direction == max ? min : max;
      animateToMaxMin(max, min, direction, seconds, scrollController);
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
                      icon: const Icon(Icons.menu),
                      iconSize: 28,
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    );
                  },
                ),
                title: Image.asset(
                  IKImages.logo,
                  height: 50,
                ),
                centerTitle: true,
                titleSpacing: 5,
                actions: [
                  IconButton(
                    icon: const Icon(Icons.notifications_none_outlined),
                    iconSize: 28,
                    onPressed: () {
                      Navigator.pushNamed(context, '/notifications');
                    },
                  )
                ],
              ),
            ),
          )),
      drawer: const DrawerMenu(),
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
                const SizedBox(height: 10.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15),
                          hintText: 'Search Something...',
                          filled: true,
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Color(0xFF878787),
                            size: 24,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              showModalBottomSheet<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return const FilterSheet();
                                },
                              );
                            },
                            icon: SvgPicture.string(IKSvg.filter,
                                height: 20,
                                width: 20,
                                color: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.color),
                          ),
                          border: OutlineInputBorder(),
                          fillColor: Theme.of(context).canvasColor,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).canvasColor,
                                  width: 0),
                              borderRadius: BorderRadius.circular(0)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).canvasColor, width: 0),
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.merge(
                                const TextStyle(fontWeight: FontWeight.w400)),
                      ),
                    ],
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                //   child: Column(
                //     children: [
                //       Text(
                //         'Make Your Fashion Look Amazing',
                //         style: TextStyle(
                //           fontFamily: 'DMSerifDisplay',
                //           fontSize: 35,
                //           color: Theme.of(context).textTheme.titleMedium?.color,
                //         ),
                //         textAlign: TextAlign.center,
                //       ),
                //     ],
                //   ),
                // ),
                //BannerSlider
                // Container(
                //   height: 129,
                //   alignment: Alignment.center,
                //   child: ListView.builder(
                //       controller: _scrollController1,
                //       scrollDirection: Axis.horizontal,
                //       shrinkWrap: true,
                //       itemCount: imageUrls.length,
                //       itemBuilder: (context, index) {
                //         return Container(
                //           padding: EdgeInsets.all(2),
                //           child: Image.asset(
                //             imageUrls[index],
                //             width: 175,
                //             height: 129,
                //             fit: BoxFit.cover,
                //           ),
                //         );
                //       }),
                // ),
                // Container(
                //   height: 129,
                //   alignment: Alignment.center,
                //   child: ListView.builder(
                //       controller: _scrollController2,
                //       scrollDirection: Axis.horizontal,
                //       shrinkWrap: true,
                //       itemCount: imageUrls.length,
                //       itemBuilder: (context, index) {
                //         return Container(
                //           padding: EdgeInsets.all(2),
                //           child: Image.asset(
                //             imageUrls[index],
                //             width: 175,
                //             height: 129,
                //             fit: BoxFit.cover,
                //           ),
                //         );
                //       }),
                // ),
                const SizedBox(height: 20.0),
                // Container(
                //   padding: EdgeInsets.symmetric(horizontal: 15),
                //   child: Text('New Arrival',
                //       style: Theme.of(context)
                //           .textTheme
                //           .titleLarge
                //           ?.merge(TextStyle(fontSize: 18))),
                // ),
                Container(
                    color: Theme.of(context).cardColor,
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: categoryItems.map((item) {
                          return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedItems = item.title;
                                });

                                // Delay navigation until state updates
                                Future.microtask(() {
                                  // ignore: use_build_context_synchronously
                                  Navigator.pushNamed(context, '/products');
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                margin: EdgeInsets.only(right: 10),
                                color: selectedItems == item.title
                                    ? Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.color
                                    : Theme.of(context).canvasColor,
                                child: Text(item.title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.merge(TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: selectedItems == item.title
                                                ? Theme.of(context).cardColor
                                                : Theme.of(context)
                                                    .textTheme
                                                    .titleMedium
                                                    ?.color))),
                              ));
                        }).toList(),
                      ),
                    )),
                const SizedBox(height: 12),
                Container(
                  margin: (EdgeInsets.symmetric(horizontal: 10)),
                  child: Wrap(
                    children: productItems.map((item) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width >
                                IKSizes.container
                            ? (IKSizes.container - 20) / 3
                            : (MediaQuery.of(context).size.width - 20) / 2,
                        child: ProductCard(
                          id: item['id']!,
                          title: item['title']!,
                          image: item['image']!,
                          price: item['price']!,
                          oldPrice: item['old-price']!,
                          addCartBtn: true,
                          review: item['Review']!,
                        ),
                      );
                    }).toList(),
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


// class OfferCountdown extends StatefulWidget {
//   const OfferCountdown({super.key});

//   @override
//   State<OfferCountdown> createState() => _OfferCountdownState();
// }

// class _OfferCountdownState extends State<OfferCountdown> {
//   late final StreamDuration _streamDuration;

//   @override
//   void initState() {
//     super.initState();
//     _streamDuration = StreamDuration(
//       config: const StreamDurationConfig(
//         countDownConfig: CountDownConfig(
//           duration: Duration(days: 1),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _streamDuration.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         SlideCountdownSeparated(
//           // This duration no effect if you customize stream duration
//           streamDuration: _streamDuration,
//           style: const TextStyle(
//             color: IKColors.title,
//             fontSize: 13,
//             fontWeight: FontWeight.w500
//           ),
//           separatorStyle: const TextStyle(color: IKColors.primary,fontWeight: FontWeight.w500),
//           padding: const EdgeInsets.only(left: 5,right: 5,bottom: 1,top: 1),
//           decoration: const BoxDecoration(
//             color: IKColors.secondary,
//             borderRadius: BorderRadius.all(Radius.circular(4)),
//           ),
//         ),
//       ],
//     );
//   }
// }