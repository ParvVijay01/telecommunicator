import 'package:lookme/utils/constants/colors.dart';
import 'package:lookme/utils/constants/sizes.dart';
import 'package:lookme/utils/constants/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationSheet extends StatelessWidget {
const NotificationSheet({ super.key });

  @override
  Widget build(BuildContext context){
    return Stack(
      children: [
        Container(
          color: Theme.of(context).cardColor,
          padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 25),
          height: 380,
          width: MediaQuery.of(context).size.width > IKSizes.container ? IKSizes.container : double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Container(
                  height: 80,
                  width: 80,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1,color: IKColors.danger),
                    borderRadius: BorderRadius.circular(40)
                  ),
                  child: SvgPicture.string(IKSvg.bell3,height: 40,width: 40),
                ),
              ),
              const SizedBox(height: 20),
              Text('Push Notifications',textAlign: TextAlign.center,style: Theme.of(context).textTheme.headlineLarge),
              const SizedBox(height: 8),
              Text('Stay informed with order updates, promotional offers, and platform communications.',textAlign: TextAlign.center,style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: () { 
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: IKColors.secondary,
                  side: const BorderSide(color: IKColors.secondary),
                  foregroundColor: IKColors.title
                ),
                child: Text('Give Permission',style: Theme.of(context).textTheme.titleMedium?.merge(TextStyle(fontSize: 15,color: IKColors.card)),),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () { 
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  side: BorderSide(color: Theme.of(context).dividerColor),
                  foregroundColor: IKColors.primary
                ),
                child: const Text('Later, Take Me Back '),
              ),
            ],
          ),
        ),
        Positioned(
          right: 10,
          top: 10,
          child: IconButton(
            onPressed:(){
              Navigator.pop(context);
            }, 
            iconSize: 26,
            icon: Icon(Icons.close,color: Theme.of(context).textTheme.bodyMedium?.color)
          ),
        )
      ],
    );
  }
}