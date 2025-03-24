import 'package:jctelecaller/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class CategoryItem {
  String title;
  CategoryItem({required this.title});
}

class SizeItem {
  String title;
  SizeItem({required this.title});
}

class BrandItem {
  String title;
  BrandItem({required this.title});
}

class FilterSheet extends StatefulWidget {
  const FilterSheet({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FilterSheetState createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  String _selectedCategory = "All";
  String _selectedSize = "S";
  String _selectedBrand = "Adidas";

  RangeValues _currentRangeValues = const RangeValues(200, 280);

  // ignore: non_constant_identifier_names
  List<CategoryItem> Categories = [
    CategoryItem(title: "All"),
    CategoryItem(title: "Child"),
    CategoryItem(title: "Man"),
    CategoryItem(title: "Woman"),
    CategoryItem(title: "Dress"),
    CategoryItem(title: "Jackets"),
    CategoryItem(title: "Jeans"),
    CategoryItem(title: "Shoes"),
  ];

  // ignore: non_constant_identifier_names
  List<SizeItem> Sizes = [
    SizeItem(title: "Small"),
    SizeItem(title: "Medium"),
    SizeItem(title: "Large"),
    SizeItem(title: "XL"),
    SizeItem(title: "2XL"),
  ];

  // ignore: non_constant_identifier_names
  List<BrandItem> Brands = [
    BrandItem(title: "Adidas"),
    BrandItem(title: "Reebok"),
    BrandItem(title: "Zara"),
    BrandItem(title: "Gucci"),
    BrandItem(title: "Vogue"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        // height: 750,
        color: Theme.of(context).cardColor,
        child: Column(children: [
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
                Text('Filters',
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
          Expanded(
              child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Brand',
                        style: Theme.of(context).textTheme.titleMedium?.merge(
                            const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500))),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/main_home');
                      },
                      child: Text('See All',
                          style: Theme.of(context).textTheme.bodyMedium?.merge(
                              const TextStyle(
                                  color: IKColors.primary,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300))),
                    )
                  ],
                ),
                Wrap(
                  children: Brands.map((item) {
                    return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedBrand = item.title;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 5, bottom: 5),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 8),
                          decoration: BoxDecoration(
                            color: _selectedBrand == item.title
                                ? Theme.of(context).textTheme.titleMedium?.color
                                : Theme.of(context).canvasColor,
                          ),
                          child: Text(item.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.merge(TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                      color: _selectedBrand == item.title
                                          ? Theme.of(context).cardColor
                                          : Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.color))),
                        ));
                  }).toList(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Categories:',
                        style: Theme.of(context).textTheme.titleMedium?.merge(
                            const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500))),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/main_home');
                      },
                      child: Text('See All',
                          style: Theme.of(context).textTheme.bodyMedium?.merge(
                              const TextStyle(
                                  color: IKColors.primary,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300))),
                    )
                  ],
                ),
                Wrap(
                  children: Categories.map((item) {
                    return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedCategory = item.title;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 5, bottom: 5),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 8),
                          decoration: BoxDecoration(
                            color: _selectedCategory == item.title
                                ? Theme.of(context).textTheme.titleMedium?.color
                                : Theme.of(context).canvasColor,
                          ),
                          child: Text(item.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.merge(TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                      color: _selectedCategory == item.title
                                          ? Theme.of(context).cardColor
                                          : Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.color))),
                        ));
                  }).toList(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Size:',
                        style: Theme.of(context).textTheme.titleMedium?.merge(
                            const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500))),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/main_home');
                      },
                      child: Text('See All',
                          style: Theme.of(context).textTheme.bodyMedium?.merge(
                              const TextStyle(
                                  color: IKColors.primary,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300))),
                    )
                  ],
                ),
                Wrap(
                  children: Sizes.map((item) {
                    return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedSize = item.title;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 5, bottom: 5),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 8),
                          decoration: BoxDecoration(
                            color: _selectedSize == item.title
                                ? Theme.of(context).textTheme.titleMedium?.color
                                : Theme.of(context).canvasColor,
                          ),
                          child: Text(item.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.merge(TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                      color: _selectedSize == item.title
                                          ? Theme.of(context).cardColor
                                          : Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.color))),
                        ));
                  }).toList(),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Price',
                        style: Theme.of(context).textTheme.titleMedium?.merge(
                            const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500))),
                  ],
                ),
                RangeSlider(
                  values: _currentRangeValues,
                  min: 150,
                  max: 300,
                  divisions: 100,
                  labels: RangeLabels(
                    _currentRangeValues.start.round().toString(),
                    _currentRangeValues.end.round().toString(),
                  ),
                  activeColor: IKColors.primary,
                  onChanged: (RangeValues values) {
                    setState(() {
                      _currentRangeValues = values;
                    });
                  },
                ),
              ],
            ),
          )),
          Container(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: Theme.of(context).canvasColor,
                      side: BorderSide(color: Theme.of(context).canvasColor),
                    ),
                    child: Text('Reset',
                        style: TextStyle(
                            color: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.color)),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15)),
                    child: const Text('Apply'),
                  ),
                )
              ],
            ),
          )
        ]));
  }
}
