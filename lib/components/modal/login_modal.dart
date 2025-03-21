import 'package:lookme/components/input/input.dart';
import 'package:lookme/utils/constants/colors.dart';
import 'package:lookme/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class LoginModal extends StatelessWidget {
  const LoginModal({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: const EdgeInsets.all(0),
      content: Container(
        width: MediaQuery.of(context).size.width - 30,
        constraints: const BoxConstraints(
          maxWidth: 450,
        ),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(IKSizes.borderRadiusSm)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 1, color: Theme.of(context).dividerColor))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Sign In',
                      style: Theme.of(context).textTheme.headlineMedium),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Theme.of(context).dividerColor,
                      ),
                      child: Icon(Icons.close,
                          size: 20,
                          color: Theme.of(context).textTheme.titleLarge?.color),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 15),
            Text('Username', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 3),
            Input(
              hintText: "Type Username Here",
              onChangeEvent: (e) {},
            ),
            const SizedBox(height: 15),
            Text('Password', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 3),
            Input(
              hintText: "Type Password Here",
              type: "password",
              onChangeEvent: (e) {},
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: IKColors.secondary,
                  side: const BorderSide(color: IKColors.secondary),
                  foregroundColor: IKColors.card),
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
