import 'package:lookme/utils/constants/colors.dart';
import 'package:lookme/utils/constants/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({ super.key });

  @override
  // ignore: library_private_types_in_public_api
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {

  // Initial height of the container
  double _card1Height = 220.0;
  double _card2Height = 0;
  double _card3Height = 0;
  String _active = "GPay";

  void _toggleHeight(val) {
    setState(() {
      // Toggle between two heights
      _active = val;
      _card1Height = 0;
      _card2Height = 0;
      _card3Height = 0;
      if(val == "GPay"){
        _card1Height = 220.0;
      }
      if(val == "Payment"){
        _card2Height = 180.0;
      }
      if(val == "netbanking"){
        _card3Height = 150.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Theme.of(context).canvasColor,
          margin: const EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                onTap: () {
                  _toggleHeight('Cash');
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 13),
                  child: Row(
                    children: [
                      SvgPicture.string(
                        IKSvg.dollor,
                        width: 20,
                        height: 20,
                        color: IKColors.primary,
                      ), 
                      const SizedBox(width: 7),
                      Expanded(
                        child: Text('Cash on Delivery(Cash/UPI)',style: Theme.of(context).textTheme.titleMedium?.merge(TextStyle(fontWeight: FontWeight.w500)))
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: IKColors.card,
                        ),
                        height: 20,
                        width: 20,
                        alignment: Alignment.center,
                        child: Container(
                          decoration: BoxDecoration(
                            color: _active == "Cash" ? IKColors.secondary : Colors.transparent,
                            borderRadius: BorderRadius.circular(11)
                          ),
                          height: 11,
                          width: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]
          )
        ),
        Container(
          color: Theme.of(context).canvasColor,
          margin: const EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                onTap: () {
                  _toggleHeight('GPay');
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 13),
                  child: Row(
                    children: [
                      SvgPicture.string(
                        IKSvg.money2,
                        width: 20,
                        height: 20,
                        color: IKColors.primary,
                      ), 
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text('Google Pay/Phone Pay/BHIM UPI',style: Theme.of(context).textTheme.titleMedium?.merge(TextStyle(fontWeight: FontWeight.w500)))
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: IKColors.card,
                        ),
                        height: 20,
                        width: 20,
                        alignment: Alignment.center,
                        child: Container(
                          decoration: BoxDecoration(
                            color: _active == "GPay" ? IKColors.secondary : Colors.transparent,
                            borderRadius: BorderRadius.circular(11)
                          ),
                          height: 11,
                          width: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                height: _card1Height,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(top: BorderSide(width: 1,color: Theme.of(context).dividerColor))
                  ),
                  padding: const EdgeInsets.all(15),
                  child: ClipPath(
                    child: Wrap(
                      children: [
                        Text('Link via UPI', style: Theme.of(context).textTheme.titleMedium?.merge(TextStyle(fontWeight: FontWeight.w500))),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16, top: 5),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter your UPI ID',
                              hintStyle: Theme.of(context).textTheme.titleLarge?.merge(TextStyle(fontWeight: FontWeight.w300,color: IKColors.title.withOpacity(0.5),height: 1.2)),
                              contentPadding: const EdgeInsets.all(15),
                              filled: true,
                              border: OutlineInputBorder(),
                              fillColor:IKColors.card,
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
                        SizedBox(
                          width: double.maxFinite,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: ElevatedButton(
                              onPressed: (){}, 
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).textTheme.titleMedium?.color,
                                side: const BorderSide(color: IKColors.secondary),
                                foregroundColor: IKColors.card
                              ),
                              child:Text('Continue',style: TextStyle(fontSize: 16,color: Theme.of(context).cardColor)),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            SvgPicture.string(
                              IKSvg.shield,
                              width: 24,
                              height: 24,
                              color: IKColors.success,
                            ), 
                            const SizedBox(width: 10),
                            Expanded(child: Wrap(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(right: 65),
                                  child:Text('Your UPI ID Will be encrypted and is 100% safe with us.',maxLines: 2, style: Theme.of(context).textTheme.bodyMedium?.merge(TextStyle(fontSize: 13,color: Theme.of(context).textTheme.titleLarge?.color,fontWeight: FontWeight.w500)))
                                )
                              ]
                            ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          color: Theme.of(context).canvasColor,
          margin: const EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                onTap: () {
                  _toggleHeight('Payment');
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 13),
                  child: Row(
                    children: [
                      SvgPicture.string(
                        IKSvg.folder,
                        width: 20,
                        height: 20,
                        color: IKColors.primary,
                      ), 
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text('Payments/Wallet',style: Theme.of(context).textTheme.titleMedium?.merge(TextStyle(fontWeight: FontWeight.w500)))
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: IKColors.card,
                        ),
                        height: 20,
                        width: 20,
                        alignment: Alignment.center,
                        child: Container(
                          decoration: BoxDecoration(
                            color: _active == "Payment" ? IKColors.secondary : Colors.transparent,
                            borderRadius: BorderRadius.circular(11)
                          ),
                          height: 11,
                          width: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                height: _card2Height,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(top: BorderSide(width: 1,color: Theme.of(context).dividerColor))
                  ),
                  padding: const EdgeInsets.all(15),
                  child: ClipPath(
                    child: Wrap(
                      children: [
                        Text('Link Your Wallet', style: Theme.of(context).textTheme.titleMedium?.merge(TextStyle(fontWeight: FontWeight.w500))),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16, top: 5),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: '+91',
                              hintStyle: Theme.of(context).textTheme.titleLarge?.merge(TextStyle(fontWeight: FontWeight.w300,color: IKColors.title.withOpacity(0.5),height: 1.2)),
                              contentPadding: const EdgeInsets.all(15),
                              filled: true,
                              border: OutlineInputBorder(),
                              fillColor:IKColors.card,
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
                        SizedBox(
                          width: double.maxFinite,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 4.0),
                            child: ElevatedButton(
                              onPressed: (){}, 
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).textTheme.titleMedium?.color,
                                side: const BorderSide(color: IKColors.secondary),
                                // foregroundColor: IKColors.card
                              ),
                              child: Text('Continue',style: TextStyle(fontSize: 16,color: Theme.of(context).cardColor)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          color: Theme.of(context).canvasColor,
          margin: const EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                onTap: () {
                  _toggleHeight('netbanking');
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 13),
                  child: Row(
                    children: [
                      SvgPicture.string(
                        IKSvg.bank,
                        width: 20,
                        height: 20,
                        color: IKColors.primary,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text('Netbanking',style: Theme.of(context).textTheme.titleMedium?.merge(TextStyle(fontWeight: FontWeight.w500)))
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: IKColors.card,
                        ),
                        height: 20,
                        width: 20,
                        alignment: Alignment.center,
                        child: Container(
                          decoration: BoxDecoration(
                            color: _active == "netbanking" ? IKColors.secondary : Colors.transparent,
                            borderRadius: BorderRadius.circular(11)
                          ),
                          height: 11,
                          width: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                height: _card3Height,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(top: BorderSide(width: 1,color: Theme.of(context).dividerColor))
                  ),
                  padding: const EdgeInsets.all(15),
                  child: ClipPath(
                    child: Wrap(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Account No.',
                              hintStyle: Theme.of(context).textTheme.titleLarge?.merge(TextStyle(fontWeight: FontWeight.w300,color: IKColors.title.withOpacity(0.5),height: 1.2)),
                              contentPadding: const EdgeInsets.all(15),
                              filled: true,
                              border: OutlineInputBorder(),
                              fillColor:IKColors.card,
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
                        SizedBox(
                          width: double.maxFinite,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 4.0),
                            child: ElevatedButton(
                              onPressed: (){}, 
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).textTheme.titleMedium?.color,
                                side: const BorderSide(color: IKColors.secondary),
                                // foregroundColor: IKColors.card
                              ),
                              child: Text('Continue',style: TextStyle(fontSize: 16,color: Theme.of(context).cardColor)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}