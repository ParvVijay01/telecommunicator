// ignore_for_file: file_names

import 'package:jctelecaller/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class GenderItem {
  String title;

  GenderItem({required this.title});
}

class GenderSheet extends StatefulWidget {
  const GenderSheet({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GenderSheetState createState() => _GenderSheetState();
}

class _GenderSheetState extends State<GenderSheet> {
  String _selectedValue = "Man";

  // ignore: non_constant_identifier_names
  List<GenderItem> SortOptions = [
    GenderItem(title: "Man"),
    GenderItem(title: "Woman"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      color: Theme.of(context).cardColor,
      child: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.only(left: 15, top: 10, bottom: 10, right: 5),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 1, color: Theme.of(context).dividerColor))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('SELECT GENDER',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.merge(TextStyle(fontWeight: FontWeight.bold))),
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.close,
                        color: Theme.of(context).textTheme.titleMedium?.color))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: SortOptions.map((item) {
                return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedValue = item.title;
                      });
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(item.title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.merge(const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400)))),
                          Container(
                            height: 18,
                            width: 18,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 4,
                                  color: _selectedValue == item.title
                                      ? IKColors.primary
                                      : Theme.of(context).dividerColor),
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                        ],
                      ),
                    ));
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
