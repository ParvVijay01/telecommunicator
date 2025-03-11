import 'package:lookme/utils/constants/colors.dart';
import 'package:lookme/utils/constants/sizes.dart';
import 'package:lookme/utils/constants/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Checkout extends StatelessWidget {
  const Checkout({ super.key });

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
              title: Text('Checkout', style: Theme.of(context).textTheme.headlineMedium),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        color: Theme.of(context).cardColor,
                        child : Column(
                          children: [
                            GestureDetector(
                              onTap: () { 
                                Navigator.pushNamed(context, '/delivery_address');
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        border: Border.all(width: 1, color: Theme.of(context).canvasColor),
                                        color: Theme.of(context).canvasColor
                                      ),
                                      alignment: Alignment.center,
                                      child: SvgPicture.string(
                                        IKSvg.mapmarker,
                                        width: 20,
                                        height: 20,
                                        // ignore: deprecated_member_use
                                        color: Theme.of(context).textTheme.titleMedium?.color,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Delivery address',style: Theme.of(context).textTheme.titleLarge?.merge(TextStyle(fontWeight: FontWeight.w500))),
                                          const SizedBox(height: 4),
                                          Text('123 Main Street, Anytown, USA 12345',style: Theme.of(context).textTheme.bodyMedium?.merge(TextStyle(fontWeight: FontWeight.w500,fontSize: 13))),
                                        ],
                                      ) 
                                    ),
                                    Icon(Icons.chevron_right,color: Theme.of(context).textTheme.titleMedium?.color)
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/payment');
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 15),
                                padding: const EdgeInsets.symmetric(vertical: 15,),
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(width: 1,color: IKColors.title.withOpacity(0.10)))
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        border: Border.all(width: 1, color: Theme.of(context).canvasColor),
                                        color: Theme.of(context).canvasColor
                                      ),
                                      alignment: Alignment.center,
                                      child: SvgPicture.string(
                                        IKSvg.card,
                                        width: 20,
                                        height: 20,
                                        // ignore: deprecated_member_use
                                        color: Theme.of(context).textTheme.titleMedium?.color,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Payment',style: Theme.of(context).textTheme.titleLarge?.merge(TextStyle(fontWeight: FontWeight.w500))),
                                          const SizedBox(height: 4),
                                          Text('XXXX XXXX XXXX 3456',style: Theme.of(context).textTheme.bodyMedium?.merge(TextStyle(fontWeight: FontWeight.w500,fontSize: 13))),
                                        ],
                                      ) 
                                    ),
                                    Icon(Icons.chevron_right,color: Theme.of(context).textTheme.titleMedium?.color)
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text('Additional Notes:',style:Theme.of(context).textTheme.titleMedium),
                                  const SizedBox(height: 10,),
                                  SizedBox(
                                    height: 120,
                                    child:TextField(
                                      decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(15),
                                        hintText: 'Write Here',
                                        hintStyle: Theme.of(context).textTheme.titleLarge?.merge(TextStyle(fontWeight: FontWeight.w300,color: IKColors.title.withOpacity(0.5),height: 1.0)),
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
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ),
              Container(
                color: Theme.of(context).cardColor,
                margin: const EdgeInsets.only(top: 5,bottom: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Bluebell Hand Block Tiered',style: Theme.of(context).textTheme.titleMedium?.merge(const TextStyle(fontWeight: FontWeight.w300))),
                              Text('2 x \$2000.00',style: Theme.of(context).textTheme.titleMedium)
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Men Black Grey Allover Printed',style: Theme.of(context).textTheme.titleMedium?.merge(const TextStyle(fontWeight: FontWeight.w300))),
                              Text('2 x \$1699.00',style: Theme.of(context).textTheme.titleMedium)
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Discount',style: Theme.of(context).textTheme.titleMedium?.merge(const TextStyle(fontWeight: FontWeight.w300))),
                              Text('-\$100.00',style: Theme.of(context).textTheme.titleMedium)
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Shipping',style: Theme.of(context).textTheme.titleMedium?.merge(const TextStyle(fontWeight: FontWeight.w300))),
                              Text('Free Delivery',style: Theme.of(context).textTheme.titleMedium?.merge(const TextStyle(color: IKColors.success)))
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(top: BorderSide(width: 1,color: Theme.of(context).dividerColor))
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('My order',style:Theme.of(context).textTheme.headlineMedium),
                          Text('\$3,599.00',style:Theme.of(context).textTheme.headlineMedium)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  border: Border(top: BorderSide(width: 1, color: Theme.of(context).canvasColor))
                ),
                child: ElevatedButton(
                  onPressed: () { 
                    Navigator.pushNamed(context, '/main_home');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).textTheme.titleMedium?.color,
                    side: const BorderSide(color: IKColors.secondary),
                    foregroundColor: Theme.of(context).cardColor
                  ),
                  child: Text('Submit Order',style: Theme.of(context).textTheme.titleMedium?.merge(TextStyle(fontSize: 15,color: Theme.of(context).cardColor)),),
                ),
              )    
            ],
          ),
        ),
      ),
    );
  }
}