import 'package:lookme/components/collapsible/payment_method.dart';
import 'package:lookme/utils/constants/colors.dart';
import 'package:lookme/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    final Map<String, String> addressData =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
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
                  title: Text('Payment',
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
                        margin: const EdgeInsets.only(top: 10),
                        color: Theme.of(context).cardColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: PaymentMethod(),
                      )
                      // const PaymentMethod(),
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
                        Navigator.pushNamed(context, '/checkout',
                            arguments: addressData);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).textTheme.titleMedium?.color,
                        side: BorderSide(color: Theme.of(context).cardColor),
                      ),
                      child: Text(
                        'Continue',
                        style: Theme.of(context).textTheme.titleMedium?.merge(
                            TextStyle(
                                fontSize: 15,
                                color: Theme.of(context).cardColor)),
                      ),
                    ),
                  )
                ]),
          ),
        ));
  }
}
