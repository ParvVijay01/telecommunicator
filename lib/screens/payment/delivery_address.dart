import 'package:jctelecaller/utils/constants/colors.dart';
import 'package:jctelecaller/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddressItem {
  String icon;
  String title;
  String address;

  AddressItem({required this.icon, required this.title, required this.address});
}

class DeliveryAddress extends StatefulWidget {
  const DeliveryAddress({super.key});

  @override
  State<DeliveryAddress> createState() => _DeliveryAddressState();
}

class _DeliveryAddressState extends State<DeliveryAddress> {
  String _selectedValue = "e4";

  // ignore: non_constant_identifier_names
  List<AddressItem> Addresses = [];

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
                  title: Text('Delivery Address',
                      style: Theme.of(context).textTheme.headlineMedium),
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
            constraints: const BoxConstraints(
              maxWidth: IKSizes.container,
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                          ),
                          child: Column(
                            children: [
                              Column(
                                children: Addresses.map((item) {
                                  return AddressView(
                                    data: item,
                                    groupValue: _selectedValue,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedValue = value;
                                      });
                                    },
                                  );
                                }).toList(),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, '/add_delivery_address');
                                  },
                                  child: Container(
                                    height: 48,
                                    color: Theme.of(context).canvasColor,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 13, vertical: 5),
                                    margin: const EdgeInsets.only(
                                        bottom: 12, top: 18),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(Icons.add_circle_outline,
                                            color: Theme.of(context)
                                                .textTheme
                                                .titleMedium
                                                ?.color),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                            child: Text('Add Address',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium
                                                    ?.merge(TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500)))),
                                        Icon(Icons.arrow_forward_ios,
                                            size: 16,
                                            color: Theme.of(context)
                                                .textTheme
                                                .titleLarge
                                                ?.color)
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
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
                ]),
          ),
        ));
  }
}

class AddressView extends StatelessWidget {
  final AddressItem data;
  final String groupValue;
  final Function onChanged;

  const AddressView(
      {super.key,
      required this.data,
      required this.groupValue,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(data.title);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 1, color: Theme.of(context).dividerColor))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1, color: Theme.of(context).canvasColor),
                  color: Theme.of(context).canvasColor),
              alignment: Alignment.center,
              child: SvgPicture.string(
                data.icon,
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
                Text(data.title,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.merge(TextStyle(fontWeight: FontWeight.w500))),
                const SizedBox(height: 4),
                Text(data.address,
                    style: Theme.of(context).textTheme.bodyMedium?.merge(
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 13))),
              ],
            )),
            Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                border: Border.all(width: 5, color: Color(0xFFE7E7E7)),
                borderRadius: BorderRadius.circular(14),
                color: groupValue == data.title
                    ? Theme.of(context).brightness == Brightness.dark
                        ? IKColors.secondary
                        : IKColors.card
                    : Color(0xFFE7E7E7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
