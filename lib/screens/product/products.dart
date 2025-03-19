// import 'package:lookme/components/bottomsheet/Gender_sheet.dart';
// import 'package:lookme/components/product/product_card.dart';
// import 'package:lookme/components/product/product_card_list.dart';
// import 'package:lookme/screens/home/home.dart';
// import 'package:lookme/utils/constants/colors.dart';
// import 'package:lookme/utils/constants/images.dart';
// import 'package:lookme/utils/constants/sizes.dart';
// import 'package:lookme/utils/constants/svg.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:lookme/components/bottomsheet/filter_sheet.dart';
// import 'package:lookme/components/bottomsheet/short_by.dart';
// // import 'package:lookme/components/category/category_item.dart';

// class CategoryItems {
//   String title;
//   CategoryItems({required this.title});
// }

// class Products extends StatefulWidget {
//   const Products({super.key});

//   @override
//   State<Products> createState() => _ProductsState();
// }

// class _ProductsState extends State<Products> {
//   String selectedItems = "All";

//   List<CategoryItems> categoryItems = [
//     CategoryItems(title: "All"),
//     CategoryItems(title: "Crazy Deals"),
//     CategoryItems(title: "Budget Buys"),
//     CategoryItems(title: "Best Offer"),
//     CategoryItems(title: "Woman"),
//     CategoryItems(title: "Man"),
//     CategoryItems(title: "unisex"),
//   ];

//   String _productView = "grid";

//   final List<Map<String, String>> wishlistItems = [
//     {
//       'title': 'Slim Leather Bifold Wallet in brown colour',
//       'image': IKImages.product16,
//       'price': '123',
//       'old-price': '150',
//       'offer': '15% OFF',
//       'reviews': '150',
//       'returnday': '12',
//     },
//     {
//       'title': 'Denim skinny fit jeans blue colour',
//       'image': IKImages.product13,
//       'price': '25',
//       'old-price': '35',
//       'offer': '25% OFF',
//       'reviews': '84',
//       'returnday': '24',
//     },
//     {
//       'title': 'Sony Bravia OLED TV',
//       'image': IKImages.product1,
//       'price': '25',
//       'old-price': '35',
//       'offer': '25% OFF',
//       'reviews': '25',
//       'returnday': '10',
//     },
//     {
//       'title': 'Polka dot wrap blouse silver',
//       'image': IKImages.product15,
//       'price': '105',
//       'old-price': '112',
//       'offer': '70% OFF',
//       'reviews': '143',
//       'returnday': '8',
//     },
//     {
//       'title': 'Pleated high-waisted red checked',
//       'image': IKImages.product14,
//       'price': '105',
//       'old-price': '112',
//       'offer': '70% OFF',
//       'reviews': '76',
//       'returnday': '11',
//     },
//     {
//       'title': 'LG TurboWash Washing machine',
//       'image': IKImages.product12,
//       'price': '105',
//       'old-price': '112',
//       'offer': '70% OFF',
//       'reviews': '123',
//       'returnday': '12',
//     },
//     {
//       'title': 'Ergonomic Office Chair',
//       'image': IKImages.product1,
//       'price': '105',
//       'old-price': '112',
//       'offer': '70% OFF',
//       'reviews': '89',
//       'returnday': '16',
//     },
//     {
//       'title': 'APPLE iPhone 14 (Blue ,256gb storage)',
//       'image': IKImages.product1,
//       'price': '105',
//       'old-price': '112',
//       'offer': '70% OFF',
//       'reviews': '62',
//       'returnday': '2',
//     },
//     {
//       'title': 'KitchenAid 9-Cup Food',
//       'image': IKImages.product11,
//       'price': '105',
//       'old-price': '112',
//       'offer': '70% OFF',
//       'reviews': '85',
//       'returnday': '10',
//     },
//     {
//       'title': 'Engraved Metal Money sofa 4',
//       'image': IKImages.product1,
//       'price': '105',
//       'old-price': '112',
//       'offer': '70% OFF',
//       'reviews': '64',
//       'returnday': '14',
//     },
//     {
//       'title': 'OnePlus Bullets EyeBuds',
//       'image': IKImages.product17,
//       'price': '105',
//       'old-price': '112',
//       'offer': '70% OFF',
//       'reviews': '55',
//       'returnday': '15',
//     },
//     {
//       'title': 'APPLE iPhone 14 (Blue ,256gb storage)',
//       'image': IKImages.product1,
//       'price': '105',
//       'old-price': '112',
//       'offer': '70% OFF',
//       'reviews': '12',
//       'returnday': '2',
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//           preferredSize: const Size(IKSizes.container, IKSizes.headerHeight),
//           child: Container(
//             alignment: Alignment.center,
//             child: Container(
//               constraints: const BoxConstraints(maxWidth: IKSizes.container),
//               child: AppBar(
//                 leading: Builder(
//                   builder: (context) {
//                     return IconButton(
//                       icon: Icon(Icons.arrow_back_ios, size: 20),
//                       iconSize: 28,
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       },
//                     );
//                   },
//                 ),
//                 titleSpacing: 0,
//                 title: TextField(
//                   decoration: InputDecoration(
//                     hintText: 'Search Products',
//                     filled: true,
//                     fillColor: Theme.of(context).canvasColor,
//                     contentPadding: const EdgeInsets.only(left: 30, right: 20),
//                     prefixIcon: Icon(
//                       Icons.search_outlined,
//                       size: 24,
//                       color: Theme.of(context).textTheme.titleMedium?.color,
//                     ),
//                     hintStyle: Theme.of(context).textTheme.titleMedium?.merge(
//                         TextStyle(
//                             fontWeight: FontWeight.w500,
//                             color:
//                                 Theme.of(context).brightness == Brightness.dark
//                                     ? IKColors.card.withOpacity(0.6)
//                                     : IKColors.title.withOpacity(0.6))),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide.none,
//                       borderRadius: BorderRadius.circular(0),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide.none,
//                       borderRadius: BorderRadius.circular(0),
//                     ),
//                   ),
//                   style: Theme.of(context)
//                       .textTheme
//                       .titleMedium
//                       ?.merge(const TextStyle(fontWeight: FontWeight.w400)),
//                 ),
//                 actions: [
//                   IconButton(
//                     onPressed: () {
//                       setState(() {
//                         _productView =
//                             (_productView == 'list') ? 'grid' : 'list';
//                       });
//                     },
//                     iconSize: 28,
//                     // ignore: deprecated_member_use
//                     icon: SvgPicture.string(
//                         (_productView == 'list') ? IKSvg.grid : IKSvg.list,
//                         color: Theme.of(context).textTheme.titleMedium?.color),
//                   ),
//                   Stack(
//                     children: [
//                       IconButton(
//                         onPressed: () {
//                           Navigator.pushNamed(context, '/cart');
//                         },
//                         iconSize: 28,
//                         // ignore: deprecated_member_use
//                         icon: SvgPicture.string(IKSvg.cart,
//                             height: 20,
//                             width: 20,
//                             color:
//                                 Theme.of(context).textTheme.titleMedium?.color),
//                       ),
//                       Positioned(
//                         top: 8,
//                         right: 8,
//                         child: Container(
//                           height: 16,
//                           width: 16,
//                           decoration: BoxDecoration(
//                             color: IKColors.primary,
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           alignment: Alignment.center,
//                           child: const Text('14',
//                               style: TextStyle(
//                                   color: IKColors.card, fontSize: 10)),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//                 bottom: PreferredSize(
//                     preferredSize: const Size.fromHeight(1.0),
//                     child: Container(
//                       color: IKColors.light,
//                       height: 1.0,
//                     )),
//               ),
//             ),
//           )),
//       body: Center(
//         child: Container(
//           constraints: const BoxConstraints(maxWidth: IKSizes.container),
//           child: Column(
//             children: [
//               Container(
//                   color: Theme.of(context).cardColor,
//                   child: SingleChildScrollView(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 15, vertical: 15),
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       children: categoryItems.map((item) {
//                         return GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 selectedItems = item.title;
//                               });
//                             },
//                             child: Container(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 12, vertical: 8),
//                               margin: EdgeInsets.only(right: 10),
//                               color: selectedItems == item.title
//                                   ? Theme.of(context)
//                                       .textTheme
//                                       .titleMedium
//                                       ?.color
//                                   : Theme.of(context).canvasColor,
//                               child: Text(item.title,
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .titleMedium
//                                       ?.merge(TextStyle(
//                                           fontWeight: FontWeight.w500,
//                                           color: selectedItems == item.title
//                                               ? Theme.of(context).cardColor
//                                               : Theme.of(context)
//                                                   .textTheme
//                                                   .titleMedium
//                                                   ?.color))),
//                             ));
//                       }).toList(),
//                     ),
//                   )),
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Wrap(
//                         children: productItems.map((item) {
//                           return SizedBox(
//                               width: _productView == "list"
//                                   ? null
//                                   : MediaQuery.of(context).size.width >
//                                           IKSizes.container
//                                       ? IKSizes.container / 3
//                                       : (MediaQuery.of(context).size.width -
//                                               20) /
//                                           2,
//                               child: _productView == "list"
//                                   ? Container(
//                                       decoration: BoxDecoration(
//                                           border: Border(
//                                               bottom: BorderSide(
//                                                   width: 1,
//                                                   color: Theme.of(context)
//                                                       .dividerColor))),
//                                       padding: const EdgeInsets.all(15),
//                                       child: ProductCardList(
//                                           id: item['id']!,
//                                           title: item['title']!,
//                                           price: item['price']!,
//                                           oldPrice: item['old-price']!,
//                                           image: item['image']!,
//                                           offer: item['offer']!,
//                                           review: item['Review']!),
//                                     )
//                                   : ProductCard(
//                                       id: product.id,
//                                       title: product.title,
//                                       images: product.images.isNotEmpty
//                                           ? product.images
//                                           : [''], // Default empty image
//                                       price: product.price,
//                                       originalPrice: product.originalPrice,
//                                       review: product.sales != null
//                                           ? product.sales.toString()
//                                           : '0',
//                                       category: product.category[
//                                           'name'], // Assuming category has 'name' field
//                                       addCartBtn:
//                                           true, // Enable add to cart button
//                                       inWishlist: '0',
//                                       stock: product
//                                           .stock, // Set based on user wishlist data
//                                     ));
//                         }).toList(),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.symmetric(vertical: 10),
//                 decoration: BoxDecoration(
//                     border: Border(
//                         top: BorderSide(
//                             width: 1, color: Theme.of(context).canvasColor))),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: GestureDetector(
//                         onTap: () {
//                           showModalBottomSheet<void>(
//                             context: context,
//                             builder: (BuildContext context) {
//                               return const GenderSheet();
//                             },
//                           );
//                         },
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 15, vertical: 9),
//                           decoration: BoxDecoration(
//                               border: Border(
//                                   right: BorderSide(
//                                       width: 1,
//                                       color: Theme.of(context).canvasColor))),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               SvgPicture.string(
//                                 IKSvg.user,
//                                 color: Theme.of(context)
//                                     .textTheme
//                                     .titleMedium
//                                     ?.color,
//                               ),
//                               const SizedBox(
//                                 width: 5,
//                               ),
//                               Text('GENDER',
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .titleMedium
//                                       ?.merge(const TextStyle(
//                                           fontSize: 15,
//                                           fontWeight: FontWeight.w500)))
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: GestureDetector(
//                         onTap: () {
//                           showModalBottomSheet<void>(
//                             context: context,
//                             builder: (BuildContext context) {
//                               return const ShortBy();
//                             },
//                           );
//                         },
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 15, vertical: 9),
//                           decoration: BoxDecoration(
//                               border: Border(
//                                   right: BorderSide(
//                                       width: 1,
//                                       color: Theme.of(context).canvasColor))),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               const Icon(Icons.arrow_upward_outlined),
//                               const SizedBox(
//                                 width: 5,
//                               ),
//                               Text('SORT',
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .titleMedium
//                                       ?.merge(const TextStyle(
//                                           fontSize: 15,
//                                           fontWeight: FontWeight.w400)))
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: GestureDetector(
//                         onTap: () {
//                           showModalBottomSheet<void>(
//                             context: context,
//                             builder: (BuildContext context) {
//                               return const FilterSheet();
//                             },
//                           );
//                         },
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 15, vertical: 9),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               const Icon(Icons.filter_alt_outlined),
//                               const SizedBox(
//                                 width: 5,
//                               ),
//                               Text('FILTER',
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .titleMedium
//                                       ?.merge(const TextStyle(
//                                           fontSize: 15,
//                                           fontWeight: FontWeight.w400)))
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
