import 'package:flutter_svg/flutter_svg.dart';
import 'package:lookme/components/bottomsheet/filter_sheet.dart';
import 'package:lookme/components/drawer/drawer_menu.dart';
import 'package:lookme/components/product/product_card.dart';
import 'package:lookme/data/data_provider.dart';

import 'package:lookme/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:lookme/utils/constants/colors.dart';
import 'package:lookme/utils/constants/svg.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  final String? userName, phone;
  const Home({super.key, this.phone, this.userName});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedCategory = "All";
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final dataProvider = Provider.of<DataProvider>(context, listen: false);
      dataProvider.fetchAllCategories();
      dataProvider.fetchProducts(); // Fetch all products initially
    });

    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final dataProvider = Provider.of<DataProvider>(context, listen: false);
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 50 &&
        dataProvider.hasMore &&
        !dataProvider.isLoading) {
      Future.delayed(const Duration(milliseconds: 300), () {
        dataProvider.fetchProducts(loadMore: true, category: selectedCategory);
      });
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
    final products = dataProvider.products;

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
                  'assets/images/logo.png',
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
              onPressed: () {
                Navigator.pushNamed(context, '/cart');
              },
              icon: SvgPicture.string(
                IKSvg.cart,
                height: 20,
                width: 20,
                color: IKColors.primary,
              ),
            ),
            IconButton(
              icon: SvgPicture.string(
                IKSvg.signout,
                height: 20,
                width: 20,
                color: IKColors.primary,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/signin');
              },
            ),
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
                      icon: SvgPicture.string(
                        IKSvg.filter,
                        height: 20,
                        width: 20,
                        color: Theme.of(context).textTheme.titleMedium?.color,
                      ),
                    ),
                    border: const OutlineInputBorder(),
                    fillColor: Theme.of(context).canvasColor,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),

              // ✅ Category List with Clickable Chips
              SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() => selectedCategory = "All");
                        dataProvider.fetchProducts(category: "All");
                      },
                      child: CategoryChip(
                        title: "All",
                        isSelected: selectedCategory == "All",
                      ),
                    ),
                    ...categories.map((category) {
                      return GestureDetector(
                        onTap: () {
                          setState(() => selectedCategory = category.nameEn);
                          dataProvider.fetchProducts(category: category.nameEn);
                        },
                        child: CategoryChip(
                          title: category.nameEn,
                          isSelected: selectedCategory == category.nameEn,
                        ),
                      );
                    }),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              // ✅ Product List with Pagination
              Expanded(
                child: GridView.builder(
                  controller: _scrollController,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.4,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ProductCard(
                      id: product.id,
                      title: product.title,
                      images: product.images!.isNotEmpty ? product.images : [],
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
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  final String title;
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
        title,
        style: Theme.of(context).textTheme.titleMedium?.merge(TextStyle(
            fontWeight: FontWeight.w500,
            color: isSelected
                ? Theme.of(context).cardColor
                : Theme.of(context).textTheme.titleMedium?.color)),
      ),
    );
  }
}
