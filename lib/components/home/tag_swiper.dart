import 'package:flutter/material.dart';

class TagSwiper extends StatelessWidget {

  TagSwiper({ super.key });

  final List<String> tagItems = [
    "Deal of the day",
    "🔥Hot Deals",
    "Best Sellers",
    "New Arrivals",
    "Deal of the day",
    "🔥Hot Deals",
    "Best Sellers",
    "New Arrivals",
    "Deal of the day",
  ];

  @override
  Widget build(BuildContext context){
    return Container(
      // margin: const EdgeInsets.only(bottom: 10),
      color: Theme.of(context).cardColor,
      height: 40,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          children: tagItems.map((item) {
            return 
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(item,style: Theme.of(context).textTheme.titleSmall),
              );
          }).toList(),
        )
      ),
    );
  }
}