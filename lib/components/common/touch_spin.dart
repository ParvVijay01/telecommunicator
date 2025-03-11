import 'package:flutter/material.dart';

class TouchSpin extends StatefulWidget {

  final String count;

  const TouchSpin({super.key, 
    required this.count,
  });

  @override
  // ignore: library_private_types_in_public_api
  _TouchSpinState createState() => _TouchSpinState();
}

class _TouchSpinState extends State<TouchSpin> {

  late int countnum;

  @override
  void initState(){
    super.initState();
    countnum = int.parse(widget.count);
  }

  @override
  Widget build(BuildContext context) {
    
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              if(countnum > 0){
                countnum -= 1;
              }
            });
          },
          child: Container(
            color: Theme.of(context).canvasColor,
            height: 30,
            width: 30,
            padding: EdgeInsets.only(bottom: 25),
            margin: EdgeInsets.only(right: 10),
            child: Icon(Icons.minimize,color: Theme.of(context).textTheme.titleMedium?.color, size: 18,),
          ),
        ),
        Text('$countnum',style: Theme.of(context).textTheme.titleMedium?.merge(TextStyle(fontWeight: FontWeight.w500))),
        GestureDetector(
          onTap: () {
            setState(() {
              countnum += 1;
            });
          },
          child: Container(
            color: Theme.of(context).canvasColor,
            height: 30,
            width: 30,
            padding: EdgeInsets.only(bottom: 0),
            margin: EdgeInsets.only(left: 10),
            child: Icon(Icons.add,color: Theme.of(context).textTheme.titleMedium?.color, size: 18,),
          ),
        ),
      ],
    );
  }
}