import 'package:jctelecaller/utils/constants/colors.dart';
import 'package:jctelecaller/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ConfirmModal extends StatelessWidget {
  const ConfirmModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Container(
        padding: const EdgeInsets.all(30.0),
        height: 260,
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
                  color: IKColors.primary,
                  borderRadius: BorderRadius.circular(30)),
              child:
                  const Icon(Icons.info_outline, size: 40, color: Colors.white),
            ),
            Text('Are You Confirm?',
                style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 4),
            Text('You want to cancel order of T-shirt',
                style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: IKColors.danger,
                      side: const BorderSide(color: IKColors.danger),
                    ),
                    child: const Text('Cancel')),
                const SizedBox(width: 10),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Confirm')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
