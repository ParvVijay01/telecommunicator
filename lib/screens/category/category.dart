import 'package:lookme/components/category/category_item.dart';
import 'package:lookme/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/images.dart';

class Category extends StatelessWidget {

  Category({ super.key });

  final List<Map<String, String>> categoryItems = [
    {'title': 'Child', 'image': IKImages.cat1},
    {'title': 'Man', 'image': IKImages.cat2},
    {'title': 'Woman', 'image': IKImages.cat3},
    {'title': 'Child', 'image': IKImages.cat1},
    {'title': 'Man', 'image': IKImages.cat2},
    {'title': 'Woman', 'image': IKImages.cat3},
  ];

  final List<Map<String, String>> categoryCard = [
    {
      'category' : "Jackets",
      'items': "24 Items",
      'image' : IKImages.product17,
    },
    {
      'category' : "Coats",
      'items': "22 Items",
      'image' : IKImages.product18,
    },
    {
      'category' : "Uppers",
      'items': "12 Items",
      'image' : IKImages.product19,
    },
    {
      'category' : "Tops",
      'items': "45 Items",
      'image' : IKImages.product1,
    },
    {
      'category' : "Shoes",
      'items': "20 Items",
      'image' : IKImages.product21,
    },
    {
      'category' : "Kids",
      'items': "15 Items",
      'image' : IKImages.product22,
    },
  ];

  @override
  Widget build(BuildContext context){
    return  Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(IKSizes.container, IKSizes.headerHeight), 
        child: Container(
          alignment: Alignment.center,
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: IKSizes.container
            ),
            child: AppBar(
              title: Text('Category', style: Theme.of(context).textTheme.bodyLarge?.merge(TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
              // titleSpacing: 5,
              actions: [
                IconButton(
                    icon: const Icon(Icons.search),
                    iconSize: 28,
                    onPressed: () {
                      Navigator.pushNamed(context, '/search_screen');
                    },
                )
              ],
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(1.0),
                child: Container(
                    color: IKColors.light,
                    height: 1.0,
                )
              ),
            ),
          ),
        )
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: IKSizes.container,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Text('Set Your Wardrobe With Our \nAmazing Selection!',maxLines: 2, style: Theme.of(context).textTheme.headlineMedium?.merge(TextStyle(height: 1.5))),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5, bottom: 5),
                    child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 0),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: categoryItems.map((item) {
                            return CategoryItem(title: item['title'], image : item['image']);
                          }).toList(),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Text('Discover latest collection',maxLines: 2, style: Theme.of(context).textTheme.headlineMedium?.merge(TextStyle(height: 1.5))),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: Wrap(
                      children: categoryCard.map((item) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width > IKSizes.container ? 
                            (IKSizes.container - 20) / 3
                            :
                            (MediaQuery.of(context).size.width - 20) / 2
                          ,
                          child: GestureDetector(
                              onTap: () {
                                  Navigator.pushNamed(context, '/products');
                              },
                              child: Container(
                                color:IKColors.card,
                                margin: EdgeInsets.only(left: 8, right: 8, bottom: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Stack(
                                      children: [  
                                        AspectRatio(
                                          aspectRatio: 1 / 1.4,
                                          child: Image(
                                            image: AssetImage(item['image']!),
                                            fit: BoxFit.cover, // use this
                                          ),
                                        ),
                                        Positioned(
                                          left: 10,
                                          right: 10,
                                          bottom: 10,
                                          child:GestureDetector(
                                            onTap: () {
                                              Navigator.pushNamed(context, '/cart');
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.all(10.0),
                                              margin: const EdgeInsets.only(top: 8.0,bottom: 4.0),
                                              decoration: BoxDecoration(
                                                color: IKColors.card,
                                                borderRadius: BorderRadius.circular(0)
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(item['category']!,textAlign: TextAlign.center,style: Theme.of(context).textTheme.titleMedium?.merge(TextStyle(color: IKColors.title))),
                                                  const SizedBox(width: 5),
                                                  Text(item['items']!,textAlign: TextAlign.center,style: Theme.of(context).textTheme.titleMedium?.merge(TextStyle(color: IKColors.title))),
                                                ],
                                              ),
                                            ),
                                          )
                                        ),
                                      ]
                                    ),
                                  ],
                                )
                              ),
                          ),
                        );
                      }).toList(),
                    ),
                  )
              ],
            ),
          )
        ),
      )
    );
  }
}