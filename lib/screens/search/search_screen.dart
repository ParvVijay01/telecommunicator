
import 'package:flutter/material.dart';
import 'package:lookme/components/category/category_item.dart';
import 'package:lookme/utils/constants/colors.dart';
import 'package:lookme/utils/constants/sizes.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({ super.key });

  final List<String> searchHistory = [
    'Woman Fashion Dress',
    'Man T-sirt',
    'Girl jeans',
    'Shorts',
  ];

  final List<Map<String, String>> categoryItems = [
  {'title': 't-Shirt'},
  {'title': 'Shirts'},
  {'title': 'Jeans'},
  {'title': 'Shorts'},
  {'title': 'Child'},
  {'title': 'Man'},
  {'title': 'Woman'},
];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor:Theme.of(context).cardColor,
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: IKSizes.container,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(width: 1,color: IKColors.light))
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: IKColors.secondary,
                          padding: const EdgeInsets.all(12),
                        ),
                        icon: Icon(Icons.chevron_left,color: IKColors.card ,size: 24,)
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search Best items for You',
                            filled: true,
                            fillColor: Theme.of(context).canvasColor,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 18),
                            hintStyle: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(0),),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(0),),
                            
                          ),
                          style: Theme.of(context).textTheme.titleMedium?.merge(const TextStyle(fontWeight: FontWeight.w400)),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child:Text('Categories', style: Theme.of(context).textTheme.titleLarge?.merge(TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
                ),
                Container(
                  color: Theme.of(context).cardColor,
                  child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 15),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                      children: categoryItems.map((item) {
                        return CategoryItem(title: item['title']);
                      }).toList(),
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Search History', style: Theme.of(context).textTheme.titleLarge?.merge(TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
                            TextButton(
                              onPressed: (){}, 
                              child: Text('Clear All',style: Theme.of(context).textTheme.titleMedium?.merge(const TextStyle(color: IKColors.primary,fontSize: 12, fontWeight: FontWeight.w500)))
                            )
                          ],
                        ),
                        Column(
                          children: searchHistory.map((item){
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/products');
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child : Text(item,style: Theme.of(context).textTheme.titleMedium?.merge(const TextStyle(fontWeight: FontWeight.w300,fontSize: 15))),
                                    ),
                                    // SvgPicture.string(
                                    //   IKSvg.arrowup,
                                    //   width: 20,
                                    //   height: 20,
                                    // ),
                                    Icon(Icons.close,color: Theme.of(context).textTheme.titleMedium?.color ,size: 24,)
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}