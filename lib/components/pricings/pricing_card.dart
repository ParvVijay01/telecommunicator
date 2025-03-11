import 'package:lookme/utils/constants/colors.dart';
import 'package:lookme/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class PricingCard extends StatelessWidget {
  PricingCard({ super.key });

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
    return Container(
      padding: const EdgeInsets.all(30),
      width: double.maxFinite,
      constraints: const BoxConstraints(
        maxWidth: 320,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border: Border.all(width: 1, color: IKColors.primary),
        borderRadius: BorderRadius.circular(IKSizes.borderRadiusSm)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Column(
              children: [
                Text('\$10/Month',style: Theme.of(context).textTheme.headlineLarge?.merge(const TextStyle(fontSize: 28))),
                const SizedBox(height: 2),
                Text('Basic plan',style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 8),
                Text('Billed annually',style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Column(
            children: princingOffer.map((item){
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    Icon(Icons.check_circle_outline_outlined,size: 18,color: Theme.of(context).textTheme.titleMedium?.color),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(item['title']!,style: Theme.of(context).textTheme.bodyLarge?.merge(const TextStyle(fontSize: 15)))
                    )
                  ],
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () { 
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).textTheme.titleMedium?.color,
              side: const BorderSide(color: IKColors.secondary),
              foregroundColor: IKColors.title
            ),
            child: const Text('Get started'),
          ),
        ],
      ),
    );
  }
}