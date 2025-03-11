import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {

  final String title;
  final dynamic icon;
  final dynamic image;
  final Function()? onTap;

  const ListItem({ super.key, required this.title, this.icon, this.image, this.onTap });

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap:onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
             image 
            ?? icon ?? const SizedBox(),
            const SizedBox(width: 10),
            Expanded(
              child: Text(title,style:Theme.of(context).textTheme.titleLarge?.merge(const TextStyle(fontWeight: FontWeight.w500,fontSize: 15)))
            ),
            Icon(Icons.chevron_right,color: Theme.of(context).textTheme.titleMedium?.color)
          ],
        ),
      ),
    );
  }
}