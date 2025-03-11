import 'package:lookme/components/product/product_cart.dart';
import 'package:lookme/utils/constants/colors.dart';
import 'package:lookme/utils/constants/images.dart';
import 'package:lookme/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class WriteReview extends StatefulWidget {
  const WriteReview({ super.key });

  @override
  State<WriteReview> createState() => _WriteReviewState();
}

class _WriteReviewState extends State<WriteReview> {
  double value = 3.5;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(IKSizes.container, IKSizes.headerHeight), 
        child: Container(
          alignment: Alignment.center,
          child: Container(
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
              title: Text('Write Review', style: Theme.of(context).textTheme.headlineMedium),
              titleSpacing: 5,
              centerTitle: true,
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
            maxWidth: IKSizes.container
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(width: 1, color: Theme.of(context).dividerColor))
                        ),
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
                              orderStatus:'completed',
                              quantity: '2',
                              orderStatusRemove: true
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10,bottom: 10),
                        color: Theme.of(context).cardColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                      padding: EdgeInsets.all(0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text('Overall Rating',style: Theme.of(context).textTheme.headlineMedium?.merge(TextStyle(fontWeight: FontWeight.w500))),
                                          const SizedBox(height: 5),
                                          Text('Your average rating is 4.0',style: Theme.of(context).textTheme.titleLarge?.merge(const TextStyle(fontWeight: FontWeight.w300))),
                                          const SizedBox(height: 10),
                                          RatingBar.builder(
                                            initialRating: 4,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: false,
                                            unratedColor: Theme.of(context).dividerColor,
                                            itemCount: 5,
                                            itemSize: 45.0,
                                            itemBuilder: (context, _) => const Icon(Icons.star,color: Color(0xFFFFB444),),
                                            onRatingUpdate: (rating) {
                                              
                                            },
                                            updateOnDrag: true,
                                          ),
                                        ],
                                      ),
                                  ),
                                  const SizedBox(height: 12),
                                  Text('Review Title',
                                    style: Theme.of(context).textTheme.labelMedium?.merge(TextStyle(color: Theme.of(context).textTheme.titleMedium?.color, fontWeight: FontWeight.w500)),                    
                                  ),
                                  const SizedBox(height: 5),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(15),
                                        filled: true,
                                        border: OutlineInputBorder(),
                                        fillColor:Theme.of(context).canvasColor,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Theme.of(context).canvasColor,width: 2.0),
                                          borderRadius: BorderRadius.circular(0)
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color:Theme.of(context).brightness == Brightness.dark ? IKColors.card: IKColors.secondary,width: 2.0),
                                          borderRadius: BorderRadius.circular(0),
                                        ),
                                      ),
                                      style: Theme.of(context).textTheme.headlineMedium?.merge(const TextStyle(fontWeight: FontWeight.w400)),
                                    ),
                                  ),
                                  Text('Product Review',
                                    style: Theme.of(context).textTheme.labelMedium?.merge(TextStyle(color: Theme.of(context).textTheme.titleMedium?.color, fontWeight: FontWeight.w500)),                    
                                  ),
                                  const SizedBox(height: 5),
                                  SizedBox(
                                    height: 98,
                                    child:TextField(
                                      decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(15),
                                        filled: true,
                                        border: const OutlineInputBorder(),
                                        fillColor:Theme.of(context).canvasColor,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Theme.of(context).canvasColor,width: 2.0),
                                          borderRadius: BorderRadius.circular(0)
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color:Theme.of(context).brightness == Brightness.dark ? IKColors.card: IKColors.secondary,width: 2.0),
                                          borderRadius: BorderRadius.circular(0),
                                        ),
                                      ),
                                      maxLines: null,
                                      expands: true,
                                      keyboardType: TextInputType.multiline,
                                      style: Theme.of(context).textTheme.headlineMedium?.merge(TextStyle(fontWeight: FontWeight.w400)),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text('Would you recommend this product to a friend?',style: Theme.of(context).textTheme.titleLarge?.merge(const TextStyle(fontSize: 15,fontWeight: FontWeight.w300))),
                                  const RadioExample(),
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
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:  Theme.of(context).textTheme.titleMedium?.color,
                    side: BorderSide(color:Theme.of(context).brightness == Brightness.dark ? IKColors.card : IKColors.secondary),
                    foregroundColor: IKColors.card
                  ),
                  child:Text('Submit Review', style: TextStyle(color:  Theme.of(context).cardColor),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

enum SingingCharacter { yes, no }

class RadioExample extends StatefulWidget {
  const RadioExample({super.key});

  @override
  State<RadioExample> createState() => _RadioExampleState();
}

class _RadioExampleState extends State<RadioExample> {
  SingingCharacter? _character = SingingCharacter.yes;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Row( 
          children: [
              Radio<SingingCharacter>(
                value: SingingCharacter.yes,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                },
                activeColor: Theme.of(context).textTheme.titleMedium?.color,
              ),
              Text('Yes',style: Theme.of(context).textTheme.titleLarge?.merge(TextStyle(fontWeight: FontWeight.w500))),
          ],
        ),
        Row(
          children: [
            Radio<SingingCharacter>(
              value: SingingCharacter.no,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
              activeColor: Theme.of(context).textTheme.titleMedium?.color,
            ),
            Text('No',style: Theme.of(context).textTheme.titleLarge?.merge(TextStyle(fontWeight: FontWeight.w500))),
          ]
        ),
      ],
    );
  }
}