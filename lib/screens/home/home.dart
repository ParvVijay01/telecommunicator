import 'package:flutter_svg/flutter_svg.dart';
import 'package:lookme/components/bottomsheet/filter_sheet.dart';
import 'package:lookme/components/drawer/drawer_menu.dart';
import 'package:lookme/components/product/product_card.dart';
import 'package:lookme/data/data_provider.dart';

import 'package:lookme/provider/user_provider.dart';
import 'package:lookme/utils/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:lookme/utils/constants/svg.dart';
import 'package:provider/provider.dart';

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
  final String? userName, phone;
  const Home({super.key, this.phone, this.userName});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  dynamic selectedCategory = "All";
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final dataProvider = Provider.of<DataProvider>(context, listen: false);
      dataProvider.fetchAllCategories();
      dataProvider.fetchProducts();
    });

    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final dataProvider = Provider.of<DataProvider>(context, listen: false);
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        dataProvider.hasMore) {
      dataProvider.fetchProducts(loadMore: true);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final dataProvider = Provider.of<DataProvider>(context);
    final categories = dataProvider.categories;

    // ✅ FIX: Ensure correct comparison between category names
    final products = selectedCategory == "All"
        ? dataProvider.products
        : dataProvider.products.where((product) {
            print(
                "Checking Product: ${product.title}, Category: ${product.category}");
            return product.category.toString().toLowerCase() ==
                selectedCategory.toString().toLowerCase();
          }).toList();

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
                  'assets/images/logo.png', // Ensure you have this logo asset
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
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
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
                          color:
                              Theme.of(context).textTheme.titleMedium?.color),
                    ),
                    border: OutlineInputBorder(),
                    fillColor: Theme.of(context).canvasColor,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),

              // ✅ Category List with Clickable Chips
              Container(
                color: Theme.of(context).cardColor,
                child: SingleChildScrollView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => setState(() => selectedCategory = "All"),
                        child: CategoryChip(
                          title: "All",
                          isSelected: selectedCategory == "All",
                        ),
                      ),
                      ...categories.map((category) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedCategory = category.name;
                              print("Selected Category: $selectedCategory");
                            });
                          },
                          child: CategoryChip(
                            title: category.name,
                            isSelected: selectedCategory == category.name,
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // ✅ Product List with Pagination
              Expanded(
                child: SingleChildScrollView(
                  child: GridView.builder(
                    shrinkWrap: true, // ✅ Prevents infinite height issues
                    physics:
                        const NeverScrollableScrollPhysics(), // ✅ Prevents conflicts with scrolling
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // ✅ Two products per row
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio:
                          0.4, // ✅ Reduce this to prevent overflow
                    ),
                    itemCount: products.length + (dataProvider.hasMore ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == products.length) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      final product = products[index];
                      return ProductCard(
                        id: product.id,
                        title: product.title,
                        images: product.images!.isNotEmpty
                            ? product.images
                            : ['assets/images/logo.png'],
                        price: product.prices.price,
                        originalPrice: product.prices.originalPrice,
                        review: product.sales?.toString() ?? '0',
                        category: product.category,
                        addCartBtn: true,
                        inWishlist: '0',
                        stock: product.stock ?? 0,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  final dynamic title;
  final bool isSelected;

  const CategoryChip({required this.title, required this.isSelected, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: isSelected
            ? Theme.of(context).textTheme.titleMedium?.color
            : Theme.of(context).canvasColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title is Map<String, dynamic> ? title['en'] ?? "" : title,
        style: Theme.of(context).textTheme.titleMedium?.merge(TextStyle(
            fontWeight: FontWeight.w500,
            color: isSelected
                ? Theme.of(context).cardColor
                : Theme.of(context).textTheme.titleMedium?.color)),
      ),
    );
  }
}
