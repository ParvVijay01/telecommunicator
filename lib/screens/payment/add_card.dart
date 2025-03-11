import 'package:lookme/components/payment/payment_card.dart';
import 'package:lookme/utils/constants/colors.dart';
import 'package:lookme/utils/constants/images.dart';
import 'package:lookme/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class AddCard extends StatelessWidget {

  const AddCard({ super.key });

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
              title: Text('Add Card', style: Theme.of(context).textTheme.headlineMedium),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                alignment: Alignment.topCenter,
                child: Container(
                  constraints: const BoxConstraints(
                    maxWidth: IKSizes.container
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                        child: const PaymentCard(
                          addCard : true,
                          type: "Credit Card", 
                          cardNumber: "**** **** **** 4532", 
                          name: "Roopa Smith", 
                          exp: "10/28", 
                          cvv: "012", 
                          cardImg: IKImages.visa
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 15,right: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text('Card Name',
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
                                    borderSide: const BorderSide(color: IKColors.secondary,width: 2.0),
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                ),
                                style: Theme.of(context).textTheme.headlineMedium?.merge(const TextStyle(fontWeight: FontWeight.w400)),
                              ),
                            ),
                            Text('Card Number',
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
                                    borderSide: const BorderSide(color: IKColors.secondary,width: 2.0),
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                                style: Theme.of(context).textTheme.headlineMedium?.merge(const TextStyle(fontWeight: FontWeight.w400)),
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Text('Expiry Date',
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
                                              borderSide: const BorderSide(color: IKColors.secondary,width: 2.0),
                                              borderRadius: BorderRadius.circular(0),
                                            ),
                                          ),
                                          keyboardType: TextInputType.number,
                                          style: Theme.of(context).textTheme.headlineMedium?.merge(const TextStyle(fontWeight: FontWeight.w400)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Text('CVV',
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
                                              borderSide: const BorderSide(color: IKColors.secondary,width: 2.0),
                                              borderRadius: BorderRadius.circular(0),
                                            ),
                                          ),
                                          keyboardType: TextInputType.number,
                                          style: Theme.of(context).textTheme.headlineMedium?.merge(const TextStyle(fontWeight: FontWeight.w400)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
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
                Navigator.pushNamed(context, '/payment');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).textTheme.titleMedium?.color,
                side: const BorderSide(color: IKColors.secondary),
                foregroundColor: Theme.of(context).cardColor
              ),
              child: Text('Add Card',style: Theme.of(context).textTheme.titleMedium?.merge(TextStyle(fontSize: 15,color:Theme.of(context).cardColor)),),
            ),
          )
        ],
      ),
    );
  }
}