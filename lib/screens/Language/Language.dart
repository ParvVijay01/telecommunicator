// ignore_for_file: file_names

import 'package:jctelecaller/utils/constants/colors.dart';
import 'package:jctelecaller/utils/constants/images.dart';
import 'package:jctelecaller/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class LanguageItem {
  String title;
  String image;

  LanguageItem({required this.title, required this.image});
}

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _Language();
}

class _Language extends State<Language> {
  String _selectedValue = "English";

  // ignore: non_constant_identifier_names
  List<LanguageItem> LanguageItems = [
    LanguageItem(title: "English", image: IKImages.americaFlag),
    LanguageItem(title: "Hindi", image: IKImages.indiaFlag),
    LanguageItem(title: "French", image: IKImages.frenchFlag),
    LanguageItem(title: "Germany", image: IKImages.germanyFlag),
    LanguageItem(title: "Italian", image: IKImages.italianFlag),
    LanguageItem(title: "Thai", image: IKImages.thaiFlag),
    LanguageItem(title: "Chinese", image: IKImages.chineseFlag),
    LanguageItem(title: "Urdu", image: IKImages.urduFlag),
    LanguageItem(title: "Polish", image: IKImages.polishFlag),
    LanguageItem(title: "Canadian", image: IKImages.canadaFlag),
    LanguageItem(title: "Danish", image: IKImages.danishFlag),
    LanguageItem(title: "Japanese", image: IKImages.japanFlag),
    LanguageItem(title: "Dutch", image: IKImages.dutchFlag),
    LanguageItem(title: "Turkish", image: IKImages.turkishFlag),
  ];

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
                title: Text('Language',
                    style: Theme.of(context).textTheme.headlineMedium),
                centerTitle: true,
                bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(1.0),
                    child: Container(
                      color: Theme.of(context).canvasColor,
                      height: 1.0,
                    )),
              ),
            ),
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.topCenter,
            child: Container(
              constraints: const BoxConstraints(maxWidth: IKSizes.container),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Select Language',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.merge(TextStyle(fontSize: 18))),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search Language...',
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
                            borderSide: const BorderSide(
                                color: IKColors.secondary, width: 2.0),
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.merge(
                                const TextStyle(fontWeight: FontWeight.w400)),
                      ),
                    ),
                    Expanded(
                        child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: (3.8 / 1),
                      ),
                      itemCount: LanguageItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        return LanguageView(
                          data: LanguageItems[index],
                          groupValue: _selectedValue,
                          onChanged: (value) {
                            setState(() {
                              _selectedValue = value;
                            });
                          },
                        );
                      },
                    )),
                  ]),
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
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Theme.of(context).textTheme.titleMedium?.color,
                  side: const BorderSide(color: IKColors.secondary),
                  foregroundColor: IKColors.card),
              child: Text(
                'Save Language',
                style: Theme.of(context).textTheme.titleMedium?.merge(TextStyle(
                    fontSize: 15, color: Theme.of(context).cardColor)),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class LanguageView extends StatelessWidget {
  final LanguageItem data;
  final String groupValue;
  final Function onChanged;

  const LanguageView(
      {super.key,
      required this.data,
      required this.groupValue,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(data.title);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(
              color: groupValue == data.title
                  ? IKColors.primary
                  : Theme.of(context).dividerColor,
              width: 2.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: Image.asset(
                data.image,
                width: 28,
                height: 20,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(data.title,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.merge(const TextStyle(fontWeight: FontWeight.w400))),
            ),
            Icon(Icons.check_circle,
                color: groupValue == data.title
                    ? IKColors.primary
                    : Theme.of(context).dividerColor),
          ],
        ),
      ),
    );
  }
}
