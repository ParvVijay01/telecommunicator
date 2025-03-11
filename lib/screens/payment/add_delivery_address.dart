import 'package:lookme/utils/constants/colors.dart';
import 'package:lookme/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class AddressItem {
  String title;

  AddressItem({required this.title});
}

class AddDeliveryAddress extends StatefulWidget {

  const AddDeliveryAddress({ super.key });

  @override
  State<AddDeliveryAddress> createState() => _AddDeliveryAddressState();
}

class _AddDeliveryAddressState extends State<AddDeliveryAddress> {

  String _selectedValue = "Home";

  // ignore: non_constant_identifier_names
  List<AddressItem> Addresses = [
    AddressItem(title: "Home"),
    AddressItem(title: "Shop"),
    AddressItem(title: "Office"),
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
              title: Text('Add Delivery Address', style: Theme.of(context).textTheme.headlineMedium),
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
      body: Center(
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: IKSizes.container
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child : SingleChildScrollView( 
                  child : Column(
                    children: [
                      Container(
                        color: Theme.of(context).cardColor,
                        margin: const EdgeInsets.only(top: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Text('Contact Details',style: Theme.of(context).textTheme.titleLarge)
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text('Full Name',
                                    style: Theme.of(context).textTheme.labelMedium?.merge(TextStyle(color:Theme.of(context).textTheme.titleMedium?.color, fontWeight: FontWeight.w500)),                    
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
                                  Text('Mobile No.',
                                    style: Theme.of(context).textTheme.labelMedium?.merge(TextStyle(color: Theme.of(context).textTheme.titleMedium?.color, fontWeight: FontWeight.w500)),                    
                                  ),
                                  const SizedBox(height: 5),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(15),
                                        border: OutlineInputBorder(),
                                        filled: true,
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
                                      keyboardType: TextInputType.number,
                                      style: Theme.of(context).textTheme.headlineMedium?.merge(const TextStyle(fontWeight: FontWeight.w400)),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        color: Theme.of(context).cardColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Text('Address',style: Theme.of(context).textTheme.titleLarge)
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text('Pin Code',
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
                                      keyboardType: TextInputType.number,
                                      style: Theme.of(context).textTheme.headlineMedium?.merge(const TextStyle(fontWeight: FontWeight.w400)),
                                    ),
                                  ),
                                  Text('Address',
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
                                  Text('Locality/Town',
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
                                  Text('City/District',
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
                                  Text('State',
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
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        color: Theme.of(context).cardColor,
                        margin: const EdgeInsets.only(bottom: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Text('Save Address As',style: Theme.of(context).textTheme.titleLarge)
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Wrap(
                                children: Addresses.map((item) {
                                return GestureDetector(
                                  onTap: (){ 
                                    setState(() {
                                      _selectedValue = item.title;
                                    });
                                  },
                                  child : Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 8),
                                    decoration: BoxDecoration(
                                      color: _selectedValue == item.title ?  Theme.of(context).textTheme.titleMedium?.color : Theme.of(context).canvasColor,
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    child: Text(item.title,style: Theme.of(context).textTheme.titleMedium?.merge(TextStyle( color: _selectedValue == item.title ?  Theme.of(context).cardColor : Theme.of(context).textTheme.titleMedium?.color, fontSize: 13))),
                                  )
                                );
                              }).toList(),
                              ),
                            )
                          ],
                        ),
                      ),
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
                    Navigator.pushNamed(context, '/delivery_address');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).textTheme.titleMedium?.color,
                    side: BorderSide(color: Theme.of(context).cardColor),
                  ),
                  child: Text('Save Address',style: Theme.of(context).textTheme.titleMedium?.merge(TextStyle(fontSize: 15,height: 1.6,color: Theme.of(context).cardColor)),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}