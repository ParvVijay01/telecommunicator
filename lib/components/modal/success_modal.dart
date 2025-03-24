import 'package:jctelecaller/utils/constants/colors.dart';
import 'package:jctelecaller/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SuccessModal extends StatelessWidget {
  const SuccessModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Container(
        padding: const EdgeInsets.all(30.0),
        height: 200,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(IKSizes.borderRadiusSm),
        ),
        width: MediaQuery.of(context).size.width - 30,
        constraints: const BoxConstraints(
          maxWidth: 400,
        ),
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
      ),
    );
  }
}
