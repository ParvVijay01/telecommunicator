import 'package:lookme/utils/constants/colors.dart';
import 'package:lookme/utils/constants/images.dart';
import 'package:lookme/utils/constants/sizes.dart';
import 'package:lookme/utils/constants/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

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
                title: Text('Edit Profile',
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
      body: Container(
        alignment: Alignment.topCenter,
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
                      padding: const EdgeInsets.all(20),
                      color: Theme.of(context).cardColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Container(
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2,
                                          color: Theme.of(context).canvasColor),
                                      borderRadius: BorderRadius.circular(150)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(150),
                                    child: Image.asset(
                                      IKImages.profile,
                                      height: 140,
                                      width: 140,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                  bottom: 0,
                                  right: 10,
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.color,
                                      border: Border.all(
                                          width: 3,
                                          color: Theme.of(context).cardColor),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    alignment: Alignment.center,
                                    child: SvgPicture.string(
                                      IKSvg.edit,
                                      width: 16,
                                      height: 16,
                                      color: Theme.of(context).cardColor,
                                    ),
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // margin: const EdgeInsets.only(top: 10),
                      color: Theme.of(context).cardColor,
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
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(15),
                                filled: true,
                                border: OutlineInputBorder(),
                                fillColor: Theme.of(context).canvasColor,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Theme.of(context).canvasColor,
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
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(15),
                                filled: true,
                                border: OutlineInputBorder(),
                                fillColor: Theme.of(context).canvasColor,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Theme.of(context).canvasColor,
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
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(15),
                                filled: true,
                                border: OutlineInputBorder(),
                                fillColor: Theme.of(context).canvasColor,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Theme.of(context).canvasColor,
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
                            'Location',
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
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(15),
                                filled: true,
                                border: OutlineInputBorder(),
                                fillColor: Theme.of(context).canvasColor,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Theme.of(context).canvasColor,
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
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Theme.of(context).textTheme.titleMedium?.color,
                      side: const BorderSide(color: IKColors.secondary),
                      foregroundColor:
                          Theme.of(context).textTheme.titleMedium?.color),
                  child: Text(
                    'Update Profile',
                    style: Theme.of(context).textTheme.titleMedium?.merge(
                        TextStyle(
                            fontSize: 15, color: Theme.of(context).cardColor)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
