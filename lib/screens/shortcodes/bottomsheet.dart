import 'package:jctelecaller/components/bottomsheet/login_sheet.dart';
import 'package:jctelecaller/components/bottomsheet/register_sheet.dart';
import 'package:jctelecaller/components/bottomsheet/success_sheet.dart';
import 'package:jctelecaller/components/list/list_item.dart';
import 'package:jctelecaller/utils/constants/colors.dart';
import 'package:jctelecaller/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class Bottomsheet extends StatelessWidget {
  const Bottomsheet({super.key});

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
                title: const Text('Bottom Sheets'),
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
      body: Container(
        alignment: Alignment.topCenter,
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: IKSizes.container,
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(15),
            child: Column(children: [
              ListItem(
                onTap: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return const SuccessSheet();
                    },
                  );
                },
                icon: const Icon(
                  Icons.check_circle_outline_rounded,
                  color: IKColors.primary,
                  size: 20,
                ),
                title: "Success Sheet",
              ),
              ListItem(
                onTap: () {
                  showModalBottomSheet<void>(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return const LoginSheet();
                    },
                  );
                },
                icon: const Icon(
                  Icons.login,
                  color: IKColors.primary,
                  size: 20,
                ),
                title: "Login Sheet",
              ),
              ListItem(
                onTap: () {
                  showModalBottomSheet<void>(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return const RegisterSheet();
                    },
                  );
                },
                icon: const Icon(
                  Icons.app_registration_rounded,
                  color: IKColors.primary,
                  size: 20,
                ),
                title: "Register Sheet",
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
