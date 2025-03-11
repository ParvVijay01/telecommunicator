import 'package:lookme/components/collapsible/payment_method.dart';
import 'package:lookme/components/payment/payment_card.dart';
import 'package:lookme/utils/constants/colors.dart';
import 'package:lookme/utils/constants/images.dart';
import 'package:lookme/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class Payment extends StatefulWidget {

  const Payment({ super.key });

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {

  String _selectedCard = "1";

  final List<Map<String, String>> cards = [
    {
      'id' : "1",
      'card_img' : IKImages.visa,
      'type' : 'Credit Card',
      'card_number': '**** **** **** 4532', 
      'name' : 'Roopa Smith',
      'exp' : '10/28',
      'cvv' : '012',
    },
    {
      'id' : "2",
      'type' : 'Debit Card',
      'card_img' : IKImages.mastercard,
      'card_number': '**** **** **** 4532', 
      'name' : 'Roopa Smith',
      'exp' : '10/28',
      'cvv' : '012',
    },
    {
      'id' : "3",
      'card_img' : IKImages.visa,
      'type' : 'Credit Card',
      'card_number': '**** **** **** 4532', 
      'name' : 'Roopa Smith',
      'exp' : '10/28',
      'cvv' : '012',
    },
  ];

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
              title: Text('Payment', style: Theme.of(context).textTheme.headlineMedium),
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
      body:  Center(
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
                        margin: const EdgeInsets.only(top: 10),
                        color: Theme.of(context).cardColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 15,right: 5),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text('Credit/Debit Card',style: Theme.of(context).textTheme.titleLarge?.merge(TextStyle(fontWeight: FontWeight.w500))),
                                  ),
                                  TextButton(
                                    onPressed: (){
                                      Navigator.pushNamed(context, '/add_card');
                                    }, 
                                    child: Row(
                                      children: [
                                        Icon(Icons.add_circle_outline,color:Theme.of(context).textTheme.titleMedium?.color,size: 16),
                                        const SizedBox(width: 3),
                                        Text('Add Card',style: Theme.of(context).textTheme.titleMedium?.merge(const TextStyle(fontSize: 13,fontWeight: FontWeight.w500))),
                                      ],
                                    )
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  children: cards.map((item) {
                                    return Container(
                                      width: 277,
                                      margin: const EdgeInsets.only(right: 10),
                                      child: GestureDetector(
                                        onTap: (){ 
                                          setState(() {
                                            _selectedCard = item['id']!;
                                          });
                                        },
                                        child : PaymentCard(
                                          type: item['type']!,
                                          cardImg: item['card_img']!,
                                          cardNumber: item['card_number']!,
                                          name: item['name']!,
                                          exp: item['exp']!,
                                          cvv: item['cvv']!,
                                          id: item['id']!,
                                          activeCard : _selectedCard,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: PaymentMethod(),
                      )
                      // const PaymentMethod(),
                    ],
                  )
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
                    Navigator.pushNamed(context, '/checkout');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).textTheme.titleMedium?.color,
                    side: BorderSide(color: Theme.of(context).cardColor),
                  ),
                  child: Text('Continue', style: Theme.of(context).textTheme.titleMedium?.merge(TextStyle(fontSize: 15,color: Theme.of(context).cardColor)),),
                ),
              )
            ]
          ),
        ),
      )
    );
  }
}