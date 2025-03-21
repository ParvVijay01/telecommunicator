import 'package:lookme/components/list/list_item.dart';
import 'package:lookme/components/modal/confirm_modal.dart';
import 'package:lookme/components/modal/login_modal.dart';
import 'package:lookme/components/modal/register_modal.dart';
import 'package:lookme/components/modal/success_modal.dart';
import 'package:lookme/utils/constants/colors.dart';
import 'package:lookme/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ModalBox extends StatelessWidget {
  const ModalBox({super.key});

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
                title: const Text('Modal Box'),
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
                  showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return const ConfirmModal();
                    },
                  );
                },
                icon: const Icon(
                  Icons.info_outline_rounded,
                  color: IKColors.primary,
                  size: 20,
                ),
                title: "Confirm Modal",
              ),
              ListItem(
                onTap: () {
                  showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return const SuccessModal();
                    },
                  );
                },
                icon: const Icon(
                  Icons.check_circle_outline_rounded,
                  color: IKColors.primary,
                  size: 20,
                ),
                title: "Success Modal",
              ),
              ListItem(
                onTap: () {
                  showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return const LoginModal();
                    },
                  );
                },
                icon: const Icon(
                  Icons.login,
                  color: IKColors.primary,
                  size: 20,
                ),
                title: "Login Modal",
              ),
              ListItem(
                onTap: () {
                  showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return const RegisterModal();
                    },
                  );
                },
                icon: const Icon(
                  Icons.app_registration_rounded,
                  color: IKColors.primary,
                  size: 20,
                ),
                title: "Register Modal",
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
