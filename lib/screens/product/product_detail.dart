import 'package:lookme/components/product/product_card.dart';
import 'package:lookme/utils/constants/colors.dart';
import 'package:lookme/utils/constants/sizes.dart';
import 'package:lookme/utils/constants/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../components/common/touch_spin.dart';

class ItemSizes {
  String title;
  ItemSizes({required this.title});
}

class ItemColor {
  Color color;
  ItemColor({required this.color});
}

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  String selectedSize = "s";

  Color selectedColor = Color(0xFFCC0D39);

  List<ItemSizes> productSizes = [
    ItemSizes(title: "S"),
    ItemSizes(title: "M"),
    ItemSizes(title: "L"),
    ItemSizes(title: "XL"),
    ItemSizes(title: "2XL"),
  ];

  List<ItemColor> productColor = [
    ItemColor(color: Color(0xFFCC0D39)),
    ItemColor(color: Color(0xFF5F75C5)),
    ItemColor(color: Color(0xFFC58F5E)),
    ItemColor(color: Color(0xFF919191)),
    ItemColor(color: Color(0xFFA872B1)),
    ItemColor(color: Color(0xFF699156)),
  ];

  String? imagePath; // Nullable to handle uninitialized state
  Map<dynamic, dynamic>? product; // Store product details

  // String imagePath = product['image'];

  @override
  void initState() {
    super.initState();

    // Delay to access context in initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        // Ensure product exists before assigning an image
        if (product != null && product!.isNotEmpty) {
          imagePath = product!['image'];
        }
      });
    });
  }

  void changeImage(String newImage) {
    setState(() {
      imagePath = newImage;
    });
  }

  // void changeImage(val) {
  //   setState(() {
  //     imagePath = val;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    // final List<Map<String, dynamic>> productImages = [
    //   {'image': args.image},
    //   {'image': IKImages.product2},
    //   {'image': IKImages.product3},
    // ];

    // print(product);

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
                title: Text('Product Details',
                    style: Theme.of(context).textTheme.bodyLarge?.merge(
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                // titleSpacing: 5,
                titleSpacing: 5,
                centerTitle: true,
                bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(1.0),
                    child: Container(
                      color: IKColors.light,
                      height: 1.0,
                    )),
                actions: [
                  Stack(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/cart');
                        },
                        iconSize: 28,
                        // ignore: deprecated_member_use
                        icon: SvgPicture.string(IKSvg.cart,
                            height: 20,
                            width: 20,
                            color:
                                Theme.of(context).textTheme.titleMedium?.color),
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Container(
                          height: 16,
                          width: 16,
                          decoration: BoxDecoration(
                            color: IKColors.primary,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          alignment: Alignment.center,
                          child: const Text('14',
                              style: TextStyle(
                                  color: IKColors.card, fontSize: 10)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: IKSizes.container,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      color: Theme.of(context).canvasColor,
                      constraints: const BoxConstraints(
                        minHeight: 174,
                        maxHeight: 500,
                      ),
                      child: Stack(
                        children: [
                            if (imagePath != null)
                            Image.asset(
                              imagePath!,
                              fit: BoxFit.cover,
                              width: double.maxFinite,
                            ),
                          if (product!['images'] != null &&
                              !product!['images'].isEmpty)
                            Positioned(
                                left: 0,
                                bottom: 0,
                                top: 0,
                                child: Container(
                                    margin: EdgeInsets.all(15),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      reverse:
                                          true, // Scroll from bottom to top
                                      child: Column(
                                        children: (product?['images']
                                                as List<Map<String, String>>)
                                            .map((item) {
                                          return GestureDetector(
                                            onTap: () {
                                              changeImage(item['src']!);
                                            },
                                            child: Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 10),
                                              height: 70,
                                              width: 50,
                                              // padding: const EdgeInsets.all(4),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 2,
                                                    color: Theme.of(context)
                                                        .cardColor),
                                                borderRadius:
                                                    BorderRadius.circular(0),
                                              ),
                                              child: AspectRatio(
                                                aspectRatio: 1 / 1,
                                                child: Image.asset(item['src']!,
                                                    fit: BoxFit.cover),
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    )))
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10, top: 15),
                      color: Theme.of(context).cardColor,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: Text(
                                'Thivi Blouse',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.merge(TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: IKColors.primary)),
                              )),
                              const Icon(
                                Icons.star,
                                size: 16,
                                color: Color(0xFFFFA048),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text.rich(TextSpan(
                                  text: '4.5 ',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                  children: <InlineSpan>[
                                    TextSpan(
                                        text: product!['Review'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                        ))
                                  ]))
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(product!['title'],
                              style:
                                  Theme.of(context).textTheme.headlineMedium),
                          const SizedBox(height: 15),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Price:',
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text('\$${product!["price"]}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineLarge
                                              ?.merge(const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: IKColors.primary))),
                                      const SizedBox(width: 6),
                                      Text('\$${product!["old-price"]}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.merge(TextStyle(
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 15))),
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Quantity:',
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TouchSpin(count: product!['count']),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 5),
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text('Items Size:',
                              style: Theme.of(context).textTheme.titleMedium),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: productSizes.map((item) {
                              return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedSize = item.title;
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 8),
                                    margin: EdgeInsets.only(right: 10),
                                    color: selectedSize == item.title
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
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                                color:
                                                    selectedSize == item.title
                                                        ? Theme.of(context)
                                                            .cardColor
                                                        : Theme.of(context)
                                                            .textTheme
                                                            .titleMedium
                                                            ?.color))),
                                  ));
                            }).toList(),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text('Items Color:',
                              style: Theme.of(context).textTheme.titleMedium),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: productColor.map((item) {
                              return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedColor = item.color;
                                    });
                                  },
                                  child: SizedBox(
                                      height: 34,
                                      width: 34,
                                      child: Stack(
                                        children: [
                                          Center(
                                            child: Container(
                                              height: 20,
                                              width: 20,
                                              decoration: BoxDecoration(
                                                  color: item.color,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25)),
                                            ),
                                          ),
                                          if (selectedColor == item.color)
                                            Positioned(
                                              child: Container(
                                                height: 34,
                                                width: 34,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        width: 1,
                                                        color: Theme.of(context)
                                                            .dividerColor),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25)),
                                                child: Icon(
                                                  Icons.check,
                                                  size: 15,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                        ],
                                      )));
                            }).toList(),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text('Description:',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.merge(
                                      TextStyle(fontWeight: FontWeight.bold))),
                          const SizedBox(height: 6),
                          Text(
                              'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humor.',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.merge(TextStyle(
                                      fontWeight: FontWeight.w300,
                                      height: 1.5)))
                        ],
                      ),
                    ),
                  ],
                ),
              )),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.1),
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/cart');
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0)),
                        backgroundColor:
                            Theme.of(context).textTheme.titleMedium?.color,
                        side: const BorderSide(color: Colors.white),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_cart_outlined,
                            size: 18,
                            color: Theme.of(context).cardColor,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text('Add To Cart',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.merge(TextStyle(
                                      color: Theme.of(context).cardColor)))
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
    );
  }
}
