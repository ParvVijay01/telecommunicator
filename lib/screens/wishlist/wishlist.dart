import 'package:lookme/components/product/product_card.dart';
import 'package:lookme/screens/home/home.dart';
import 'package:lookme/utils/constants/colors.dart';
import 'package:lookme/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CategoryItems {
  String title;
  CategoryItems({required this.title});
}


class Wishlist extends StatefulWidget {

  const Wishlist({ super.key });

  @override
  State<Wishlist> createState() => _WishlistState();
}


class _WishlistState extends State<Wishlist> {
  

  String selectedItems = "All";

  List<CategoryItems> categoryItems = [
    CategoryItems(title: "All"),
    CategoryItems(title: "Child"),
    CategoryItems(title: "Man"),
    CategoryItems(title: "Woman"),
    CategoryItems(title: "Dress"),
    CategoryItems(title: "unisex"),
  ];

  void removeItem(id){
      setState(() {
        productItems.removeWhere((item) => item['id'] == id);
      });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(IKSizes.container, IKSizes.headerHeight), 
        child: Container(
          alignment: Alignment.center,
          child: Container(
            // margin: EdgeInsets.only(top: 60),
            constraints: const BoxConstraints(
              maxWidth: IKSizes.container
            ),
            child: AppBar(
               leading: Builder(
                builder: (context) {
                  return IconButton(
                    icon:Icon(Icons.arrow_back_ios,size: 20),
                    iconSize: 28,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  );
                },
              ),
              titleSpacing: 0,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Wishlist', style: Theme.of(context).textTheme.bodyLarge?.merge(TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),),
                  Row(
                    children: [
                      Text('12',style: Theme.of(context).textTheme.titleSmall?.merge(TextStyle( fontWeight: FontWeight.bold, ))),
                      const SizedBox(width: 5),
                      Text('items',style: Theme.of(context).textTheme.titleSmall?.merge(TextStyle( fontWeight: FontWeight.w300, ))),
                      const SizedBox(width: 4),
                      Text('*',style: Theme.of(context).textTheme.titleSmall?.merge(TextStyle( fontWeight: FontWeight.bold, ))),
                      const SizedBox(width: 4),
                      Text('Total:',style: Theme.of(context).textTheme.titleSmall?.merge(TextStyle( fontWeight: FontWeight.w300, ))),
                      const SizedBox(width: 5),
                      Text('\$ 213',style: Theme.of(context).textTheme.titleSmall?.merge(TextStyle( fontWeight: FontWeight.bold, ))),
                    ],
                  )
                ],
              ),
              // titleSpacing: 5,
              actions: [
                IconButton(
                    icon: const Icon(Icons.search),
                    iconSize: 28,
                    onPressed: () {
                      Navigator.pushNamed(context, '/search_screen');
                    },
                )
              ],
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(1.0),
                child: Container(
                    color: IKColors.light,
                    height: 1.0,
                )
              ),
            ),
          ),
        )
      ),
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
                Container(
                    color: Theme.of(context).cardColor,
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                      scrollDirection: Axis.horizontal,
                      child:Row(
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
                            child : Container(
                              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                              margin: EdgeInsets.only(right: 10),
                              color: selectedItems == item.title ? Theme.of(context).textTheme.titleMedium?.color : Theme.of(context).canvasColor,
                              child: Text(item.title,style: Theme.of(context).textTheme.titleMedium?.merge(TextStyle(fontWeight: FontWeight.w500,color:selectedItems == item.title ? Theme.of(context).cardColor : Theme.of(context).textTheme.titleMedium?.color))) ,
                            )
                          );
                        }).toList(),
                      ),
                    )
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Wrap(
                    children: productItems.map((item) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width > IKSizes.container ? 
                            (IKSizes.container - 20) / 3
                            :
                            (MediaQuery.of(context).size.width - 20) / 2
                        ,
                        child: ProductCard(
                          id: item['id']!,
                          title: item['title']!,
                          image: item['image']!,
                          price: item['price']!,
                          oldPrice: item['old-price']!,
                          review: item['Review']!,
                          addCartBtn : true,
                          wishlistRemovebtn: true,
                          inWishlist : item['in-wishlist']!,
                          removePress :(){ 
                            removeItem(item['id']);
                          },
                        ),
                      );
                    }).toList(),
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