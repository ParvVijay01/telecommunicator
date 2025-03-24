import 'package:jctelecaller/utils/constants/colors.dart';
import 'package:jctelecaller/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class AddressItem {
  String title;

  AddressItem({required this.title});
}

class AddDeliveryAddress extends StatefulWidget {
  const AddDeliveryAddress({super.key});

  @override
  State<AddDeliveryAddress> createState() => _AddDeliveryAddressState();
}

class _AddDeliveryAddressState extends State<AddDeliveryAddress> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                title: Text('Add Delivery Address',
                    style: Theme.of(context).textTheme.headlineMedium),
                titleSpacing: 5,
                centerTitle: true,
                bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(1.0),
                    child: Container(
                      color: IKColors.light,
                      height: 1.0,
                    )),
              ),
            ),
          )),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: IKSizes.container),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  child: SingleChildScrollView(
                      child: Column(
                children: [
                  Container(
                    color: Theme.of(context).cardColor,
                    margin: const EdgeInsets.only(top: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text('Contact Details',
                                style: Theme.of(context).textTheme.titleLarge)),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'Full Name',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.merge(TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.color,
                                        fontWeight: FontWeight.w500)),
                              ),
                              const SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: TextField(
                                  controller: nameController,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(15),
                                    filled: true,
                                    border: OutlineInputBorder(),
                                    fillColor: Theme.of(context).canvasColor,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                Theme.of(context).canvasColor,
                                            width: 2.0),
                                        borderRadius: BorderRadius.circular(0)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? IKColors.card
                                              : IKColors.secondary,
                                          width: 2.0),
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                  ),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.merge(const TextStyle(
                                          fontWeight: FontWeight.w400)),
                                ),
                              ),
                              Text(
                                'Email',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.merge(TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.color,
                                        fontWeight: FontWeight.w500)),
                              ),
                              const SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: TextField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(15),
                                    border: OutlineInputBorder(),
                                    filled: true,
                                    fillColor: Theme.of(context).canvasColor,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                Theme.of(context).canvasColor,
                                            width: 2.0),
                                        borderRadius: BorderRadius.circular(0)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? IKColors.card
                                              : IKColors.secondary,
                                          width: 2.0),
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.merge(const TextStyle(
                                          fontWeight: FontWeight.w400)),
                                ),
                              ),
                              Text(
                                'Mobile No.',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.merge(TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.color,
                                        fontWeight: FontWeight.w500)),
                              ),
                              const SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: TextField(
                                  controller: numberController,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(15),
                                    border: OutlineInputBorder(),
                                    filled: true,
                                    fillColor: Theme.of(context).canvasColor,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                Theme.of(context).canvasColor,
                                            width: 2.0),
                                        borderRadius: BorderRadius.circular(0)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? IKColors.card
                                              : IKColors.secondary,
                                          width: 2.0),
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                  ),
                                  keyboardType: TextInputType.number,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.merge(const TextStyle(
                                          fontWeight: FontWeight.w400)),
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
                            child: Text('Address',
                                style: Theme.of(context).textTheme.titleLarge)),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'Pin Code',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.merge(TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.color,
                                        fontWeight: FontWeight.w500)),
                              ),
                              const SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: TextField(
                                  controller: pinCodeController,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(15),
                                    filled: true,
                                    border: OutlineInputBorder(),
                                    fillColor: Theme.of(context).canvasColor,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                Theme.of(context).canvasColor,
                                            width: 2.0),
                                        borderRadius: BorderRadius.circular(0)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? IKColors.card
                                              : IKColors.secondary,
                                          width: 2.0),
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                  ),
                                  keyboardType: TextInputType.number,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.merge(const TextStyle(
                                          fontWeight: FontWeight.w400)),
                                ),
                              ),
                              Text(
                                'Address',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.merge(TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.color,
                                        fontWeight: FontWeight.w500)),
                              ),
                              const SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: TextField(
                                  controller: addressController,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(15),
                                    filled: true,
                                    border: OutlineInputBorder(),
                                    fillColor: Theme.of(context).canvasColor,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                Theme.of(context).canvasColor,
                                            width: 2.0),
                                        borderRadius: BorderRadius.circular(0)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? IKColors.card
                                              : IKColors.secondary,
                                          width: 2.0),
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                  ),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.merge(const TextStyle(
                                          fontWeight: FontWeight.w400)),
                                ),
                              ),
                              Text(
                                'City/District',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.merge(TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.color,
                                        fontWeight: FontWeight.w500)),
                              ),
                              const SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: TextField(
                                  controller: cityController,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(15),
                                    filled: true,
                                    border: OutlineInputBorder(),
                                    fillColor: Theme.of(context).canvasColor,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                Theme.of(context).canvasColor,
                                            width: 2.0),
                                        borderRadius: BorderRadius.circular(0)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? IKColors.card
                                              : IKColors.secondary,
                                          width: 2.0),
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                  ),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.merge(const TextStyle(
                                          fontWeight: FontWeight.w400)),
                                ),
                              ),
                              Text(
                                'Country',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.merge(TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.color,
                                        fontWeight: FontWeight.w500)),
                              ),
                              const SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: TextField(
                                  controller: countryController,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(15),
                                    filled: true,
                                    border: OutlineInputBorder(),
                                    fillColor: Theme.of(context).canvasColor,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                Theme.of(context).canvasColor,
                                            width: 2.0),
                                        borderRadius: BorderRadius.circular(0)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? IKColors.card
                                              : IKColors.secondary,
                                          width: 2.0),
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                  ),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.merge(const TextStyle(
                                          fontWeight: FontWeight.w400)),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ))),
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
                    if (nameController.text.isNotEmpty &&
                        emailController.text.isNotEmpty &&
                        numberController.text.isNotEmpty &&
                        pinCodeController.text.isNotEmpty &&
                        addressController.text.isNotEmpty &&
                        cityController.text.isNotEmpty &&
                        countryController.text.isNotEmpty) {
                      final addressData = {
                        'name': nameController.text,
                        'email': emailController.text,
                        'number': numberController.text,
                        'pinCode': pinCodeController.text,
                        'address': addressController.text,
                        'city': cityController.text,
                        'country': countryController.text,
                      };
                      Navigator.pushNamed(context, '/payment',
                          arguments: addressData);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Fill in all the required fields"),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Theme.of(context).textTheme.titleMedium?.color,
                    side: BorderSide(color: Theme.of(context).cardColor),
                  ),
                  child: Text(
                    'Save Address',
                    style: Theme.of(context).textTheme.titleMedium?.merge(
                        TextStyle(
                            fontSize: 15,
                            height: 1.6,
                            color: Theme.of(context).cardColor)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
