import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {

  final dynamic title;
  final dynamic image;

  const CategoryItem({ super.key , this.title, this.image});
  
  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/products');
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            if (image != null && image!.isNotEmpty)
            Container(
              height: 105,
              width: 105,
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.circular(60),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Image.asset(image ,height: 105,width: 105,fit: BoxFit.cover,),
              ),
            ),
            if (image != null && image!.isNotEmpty)
            const SizedBox(
              height: 10,
            ),
            Container(
              color: Theme.of(context).canvasColor,
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 7),
              child: Text(title,style: Theme.of(context).textTheme.titleMedium?.merge(const TextStyle(fontWeight: FontWeight.w500))) ,
            ), 
          ],
        ),
      ),
    );
  }
}