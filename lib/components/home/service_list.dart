import 'package:lookme/components/home/service_card.dart';
import 'package:lookme/utils/constants/svg.dart';
import 'package:flutter/material.dart';

class ServiceList extends StatelessWidget {
  
  final bool? vertical;

  ServiceList({super.key, this.vertical});

  final List<Map<String, String>> serviceList = [
    {
      'icon' : IKSvg.truck,
      'title' : 'Free Shipping & Returns',
      'desc' : 'For all orders over 99',
    },
    {
      'icon' : IKSvg.secure,
      'title' : 'Secure Payment',
      'desc' : 'We ensure secure payment',
    },
    {
      'icon' : IKSvg.money,
      'title' : 'Money Back Guarantee',
      'desc' : 'Any back within 30 days',
    },
    {
      'icon' : IKSvg.support,
      'title' : 'Customer Support',
      'desc' : 'Call or email us 24/7',
    },
  ];

  @override
  Widget build(BuildContext context){

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: serviceList.map((item) {
            return 
              SizedBox(
                width: vertical == true  ? null : 250,
                child: ServiceCard(
                  icon: item['icon']!,
                  title: item['title']!,
                  desc: item['desc']!,
                  vertical : vertical,
                ),
              );
          }).toList(),
        ),
      ),
    );
  }
}