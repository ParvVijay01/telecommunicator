import 'package:jctelecaller/utils/constants/colors.dart';
import 'package:jctelecaller/utils/constants/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  // Initial height of the container

  String _active = "GPay";

  void _toggleHeight(val) {
    setState(() {
      // Toggle between two heights
      _active = val;
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 13),
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
                              child: Text('cash(Cash/UPI)',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.merge(TextStyle(
                                          fontWeight: FontWeight.w500)))),
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
                                  color: _active == "Cash"
                                      ? IKColors.secondary
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(11)),
                              height: 11,
                              width: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ])),
      ],
    );
  }
}
