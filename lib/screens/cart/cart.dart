import 'package:lookme/components/product/product_cart.dart';
import 'package:lookme/screens/home/home.dart';
import 'package:lookme/utils/constants/colors.dart';
import 'package:lookme/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {

  const Cart({ super.key });

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {

  // final List<Map<String, String>> cartItems = [
  //   {
  //     'id': "0",
  //     'title': 'Bluebell Hand Block Tiered Dress', 
  //     'image': IKImages.product11,
  //     'price' : '80',
  //     'old-price' : '95',
  //     'count' : '10',
  //     'Review' : '(2k Review)',
  //   },
  //   {
  //     'id': "1",
  //     'title': 'Bluebell Hand Block Tiered Dress', 
  //     'image': IKImages.product12,
  //     'price' : '80',
  //     'old-price' : '95',
  //     'count' : '10',
  //     'Review' : '(2k Review)',
  //   },
  //   {
  //     'id': "2",
  //     'title': 'Bluebell Hand Block Tiered Dress', 
  //     'image': IKImages.product13,
  //     'price' : '80',
  //     'old-price' : '95',
  //     'count' : '10',
  //     'Review' : '(2k Review)',
  //   },
  //   {
  //     'id': "3",
  //     'title': 'Bluebell Hand Block Tiered Dress', 
  //     'image': IKImages.product14,
  //     'price' : '80',
  //     'old-price' : '95',
  //     'count' : '10',
  //     'Review' : '(2k Review)',
  //   },
  //   {
  //     'id': "4",
  //     'title': 'Bluebell Hand Block Tiered Dress', 
  //     'image': IKImages.product15,
  //     'price' : '80',
  //     'old-price' : '95',
  //     'count' : '10',
  //     'Review' : '(2k Review)',
  //   },
  // ];

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
                  Text('My Cart', style: Theme.of(context).textTheme.bodyLarge?.merge(TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                  Row(
                    children: [
                      Text('12',style: Theme.of(context).textTheme.titleSmall?.merge(TextStyle( fontWeight: FontWeight.bold, ))),
                      const SizedBox(width: 5),
                      Text('items',style: Theme.of(context).textTheme.titleSmall?.merge(TextStyle( fontWeight: FontWeight.w300, ))),
                      const SizedBox(width: 4),
                      Text('*',style: Theme.of(context).textTheme.titleSmall?.merge(TextStyle( fontWeight: FontWeight.bold, ))),
                      const SizedBox(width: 4),
                      Text('Deliver to:',style: Theme.of(context).textTheme.titleSmall?.merge(TextStyle( fontWeight: FontWeight.w300, ))),
                      const SizedBox(width: 5),
                      Text('London',style: Theme.of(context).textTheme.titleSmall?.merge(TextStyle( fontWeight: FontWeight.bold, ))),
                    ],
                  )
                ],
              ),
              actions: <Widget>[
                Container(
                  color: Theme.of(context).canvasColor,
                  margin: EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                  child:Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 18,
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () {
                            Navigator.pushNamed(context, '/delivery_address');
                        },
                        child: Text('Change',style: Theme.of(context).textTheme.titleMedium?.merge(TextStyle( fontWeight: FontWeight.w300, ))),
                      ),
                    ],
                  ),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 18,vertical: 15),
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          border: Border(
                            bottom: BorderSide(
                              color: IKColors.border, // Change color as needed
                              width: 1.0, // Adjust thickness
                            ),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(
                              TextSpan(
                                text: 'Subtotal',
                                style: Theme.of(context).textTheme.titleMedium?.merge(const TextStyle(fontSize: 16,fontWeight: FontWeight.w300)),
                                children: const <InlineSpan>[
                                  TextSpan(
                                    text: ' \$3,599',
                                    style: TextStyle(color: IKColors.primary,fontWeight: FontWeight.bold)
                                  ),
                                ]
                              )
                            ),
                            Row(
                              children: [
                                  const Icon(
                                    Icons.check_circle,
                                    size: 24,
                                    color: IKColors.success,
                                  ),
                                  const SizedBox(width: 4),
                                  Text('Your order is eligible for free Devivery', 
                                      style: Theme.of(context).textTheme.titleMedium?.merge(TextStyle(fontWeight: FontWeight.w500,)),
                                      textAlign: TextAlign.left,
                                      maxLines: 1,
                                  )
                              ],
                            )
                            // Image.asset(IKImages.giftBox,height: 45)
                          ],
                        ),
                      )
                      ,
                      Column(
                        children: productItems.map((item) {
                          return Container(
                            decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(width: 1,color: Theme.of(context).dividerColor))
                            ),
                            padding: const EdgeInsets.all(15),
                            child: ProductCart(
                              id: item['id']!,
                              title: item['title']!,
                              price: item['price']!,
                              oldPrice: item['old-price']!,
                              image: item['image']!,
                              review: item['Review']!,
                              count: item['count']!,
                              offer: item['offer'],
                              removePress :(){ 
                                removeItem(item['id']);
                              },
                            ),
                          );
                        }).toList(),
                      ),
                    ]
                  ),
                )
              ),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.1),
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: () { 
                    Navigator.pushNamed(context, '/delivery_address');
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                    backgroundColor:Theme.of(context).textTheme.titleMedium?.color,
                    side: const BorderSide(color: Colors.white),
                  ),
                  child: Text('Proceed to Buy (8 items)', style: Theme.of(context).textTheme.titleMedium?.merge(TextStyle(fontSize: 15,color:Theme.of(context).cardColor)),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}