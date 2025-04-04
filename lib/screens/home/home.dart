import 'package:flutter_svg/flutter_svg.dart';
import 'package:jctelecaller/components/drawer/drawer_menu.dart';
import 'package:jctelecaller/components/product/product_card.dart';
import 'package:jctelecaller/data/data_provider.dart';
import 'package:jctelecaller/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:jctelecaller/utils/constants/colors.dart';
import 'package:jctelecaller/utils/constants/svg.dart';
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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _searchQuery = ""; // Search query variable

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
      debugPrint("Fetching more products...");
      dataProvider.fetchProducts(loadMore: true, category: selectedCategory);
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
    final products = dataProvider.products;

    // Filter products based on search query
    final filteredProducts = products.where((product) {
      final title =
          product.title['en']?.toLowerCase() ?? ''; // Ensure lowercase
      return title.contains(_searchQuery);
    }).toList();

    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: IKColors.primary,
              size: 30,
            ),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/cart');
              },
              icon: SvgPicture.string(
                IKSvg.cart,
                height: 20,
                width: 20,
                color: IKColors.primary,
              ),
            ),
          ],
          title: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
          titleSpacing: 5,
        ),
      ),
      drawer: MyDrawer(
        showDrawer: true,
      ),
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
                  cursorColor: IKColors.primary,
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value.toLowerCase();
                    });
                  },
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
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    fillColor: Theme.of(context).canvasColor,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: IKColors.primary),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              const SizedBox(height: 12),
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
                  itemCount: filteredProducts.length,
                  itemBuilder: (context, index) {
                    final product = filteredProducts[index];
                    return ProductCard(
                      id: product.id,
                      title: product.title,
                      images: product.images!.isNotEmpty ? product.images : [],
                      price: product.prices.price,
                      originalPrice: product.prices.originalPrice,
                      review: product.sales?.toString() ?? '0',
                      category: product.category,
                      addCartBtn: true,
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
