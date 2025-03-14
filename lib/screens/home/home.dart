import 'package:flutter_svg/flutter_svg.dart';
import 'package:lookme/components/bottomsheet/filter_sheet.dart';
import 'package:lookme/components/drawer/drawer_menu.dart';
import 'package:lookme/components/product/product_card.dart';
import 'package:lookme/provider/user_provider.dart';
import 'package:lookme/utils/constants/images.dart';
import 'package:lookme/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:lookme/utils/constants/svg.dart';
import 'package:provider/provider.dart';

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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
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
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
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
          title: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                Image.asset(
                  IKImages.logo,
                  height: 50,
                ),
                if (userProvider.selectedUser != null)
                  Text(
                    "${userProvider.selectedUser!.name} - ${userProvider.selectedUser!.phone}",
                    style: const TextStyle(fontSize: 14),
                  ),
              ],
            ),
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
                const SizedBox(height: 20.0),
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
