import 'package:lookme/utils/constants/images.dart';
import 'package:lookme/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class PricingCard2 extends StatelessWidget {
  PricingCard2({ super.key });

  final List<Map<String, String>> princingOffer = [
    {
      'title' : 'Access to all basic features',
    },
    {
      'title' : 'Basic reporting and analytics',
    },
    {
      'title' : 'Up to 10 individual users',
    },
    {
      'title' : '20 GB individual data each user',
    },
    {
      'title' : 'Basic chart and emails support',
    }
  ];

  @override
  Widget build(BuildContext context){
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(30),
          margin: const EdgeInsets.only(top: 35),
          width: double.maxFinite,
          constraints: const BoxConstraints(
            maxWidth: 320,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            border: Border.all(width: 1, color: Theme.of(context).textTheme.titleLarge!.color!),
            borderRadius: BorderRadius.circular(IKSizes.borderRadiusSm)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 25,top: 25),
                margin: const EdgeInsets.only(bottom: 25),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(width: 1,color: Theme.of(context).dividerColor))
                ),
                child: Center(
                  child: Column(
                    children: [
                      Text('Free',style: Theme.of(context).textTheme.headlineLarge),
                      const SizedBox(height: 4),
                      Text('\$0/Month',style: Theme.of(context).textTheme.headlineLarge?.merge(const TextStyle(fontSize: 28))),
                      const SizedBox(height: 8),
                      Text('All the basics for bussinesses that are just getting started',style: Theme.of(context).textTheme.bodyLarge,textAlign:TextAlign.center),
                      const SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: () { 
                        },
                        child: const Text('Get started'),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: princingOffer.map((item){
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      children: [
                        Icon(Icons.check,size: 18,color: Theme.of(context).textTheme.titleMedium?.color),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(item['title']!,style: Theme.of(context).textTheme.bodyLarge?.merge(const TextStyle(fontSize: 15)))
                        )
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          child: Center(
            child: Container(
              height: 70,
              width: 70,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(40),
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.2),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Image.asset(IKImages.thumbsUp,height: 40,width: 40),
            ),
          )
        ),
      ],
    );
  }
}