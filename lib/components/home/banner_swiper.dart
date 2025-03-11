import 'package:card_swiper/card_swiper.dart';
import 'package:lookme/utils/constants/colors.dart';
import 'package:lookme/utils/constants/images.dart';
import 'package:flutter/material.dart';

class BannerSwiper extends StatelessWidget {

  BannerSwiper({ super.key });

  final List<Map<String, String>> images = [
    {
      'title': 'AirPods', 
      'sub-title': '2nd generation',
      'price' : '\$1259.00', 
      'image': IKImages.banner1
    },
    {
      'title': 'Shoes', 
      'sub-title': '1st generation',
      'price' : '\$156.00', 
      'image': IKImages.banner2
    },
    {
      'title': 'Bag', 
      'sub-title': '3nd generation',
      'price' : '\$1139.00', 
      'image': IKImages.banner3
    },
  ];

  @override
  Widget build(BuildContext context){
    return Container(
      constraints: const BoxConstraints(
        minHeight: 174,
        maxHeight: 300,
      ),
      height: MediaQuery.of(context).size.width / 2.2,
      child: Swiper(
        itemBuilder: (context, index) {

          final catImage = images[index]['image']!;
          final title = images[index]['title']!;
          final subTitle = images[index]['sub-title']!;
          final price = images[index]['price']!;

          const image = IKImages.banner1;
          return Stack(
            children: [
              Image.asset(
                image,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(title,style: Theme.of(context).textTheme.headlineLarge?.merge(const TextStyle(color: Colors.white,fontSize: 35))),
                            Text(subTitle,style: Theme.of(context).textTheme.titleLarge?.merge(const TextStyle(color: IKColors.secondary))),
                            const SizedBox(height: 6),
                            Text(price,style: Theme.of(context).textTheme.titleLarge?.merge(const TextStyle(color: Colors.white))),
                            const SizedBox(height: 12),
                            ElevatedButton(
                              onPressed: (){
                                Navigator.pushNamed(context, '/products');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                side: const BorderSide(color: Colors.white),  
                              ), 
                              child: const Text('Buy Now',style: TextStyle(fontSize: 14,color: IKColors.title)),
                            ),
                          ],
                        ),
                      )
                    ),
                    Expanded(
                      flex: 4,
                      child: Wrap(
                        // mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 10,left: 10),
                            constraints: const BoxConstraints(
                              maxHeight: 250,
                            ),
                            child: Image.asset(catImage,fit: BoxFit.contain)
                          ),
                        ]
                      )
                    ),
                    const Spacer(flex: 1),
                  ],
                ),
              )
            ],
          );
        },
        // indicatorLayout: PageIndicatorLayout.COLOR,
        
        autoplay: true,
        itemCount: images.length,
        pagination: const SwiperPagination(
          builder:DotSwiperPaginationBuilder(
            size: 6,
            activeSize: 8,
            color: Color.fromARGB(60, 255, 255, 255),
            activeColor: Colors.white,
            space: 4,
          )
        )
      ),
    );
  }
}