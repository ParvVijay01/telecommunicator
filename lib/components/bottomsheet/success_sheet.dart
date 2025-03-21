import 'package:lookme/utils/constants/colors.dart';
import 'package:lookme/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SuccessSheet extends StatelessWidget {
  const SuccessSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      padding: const EdgeInsets.all(30.0),
      height: 200,
      width: MediaQuery.of(context).size.width > IKSizes.container
          ? IKSizes.container
          : double.infinity,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 15),
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: IKColors.success,
                borderRadius: BorderRadius.circular(30)),
            child: const Icon(Icons.check, size: 40, color: Colors.white),
          ),
          Text('Congratulations!',
              style: Theme.of(context).textTheme.headlineLarge),
          const SizedBox(height: 4),
          Text('Your Order Successful Delivered',
              style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }
}
