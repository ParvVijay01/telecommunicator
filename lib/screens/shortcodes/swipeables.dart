import 'package:lookme/utils/constants/colors.dart';
import 'package:lookme/utils/constants/images.dart';
import 'package:lookme/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

final List<Map<String, String>> swipeableData = [
    {
      'image' : IKImages.chatUser2,
      'title': 'New Arrivals Alert!', 
      'desc': '15 July 2024', 
    },
    {
      'image' : IKImages.chatUser3,
      'title': 'Flash Sale Announcement', 
      'desc': '15 July 2024', 
    },
    {
      'image' : IKImages.chatUser4,
      'title': 'Exclusive Discounts Inside', 
      'desc': '15 July 2024', 
    },
    {
      'image' : IKImages.chatUser5,
      'title': 'Limited Stock - Act Fast!', 
      'desc': '15 July 2024', 
    },
    {
      'image' : IKImages.chatUser6,
      'title': 'Get Ready to Shop', 
      'desc': '15 July 2024', 
    },
    {
      'image' : IKImages.chatUser2,
      'title': 'New Arrivals Alert!', 
      'desc': '15 July 2024', 
    },
    {
      'image' : IKImages.chatUser3,
      'title': 'Flash Sale Announcement', 
      'desc': '15 July 2024', 
    },
    {
      'image' : IKImages.chatUser4,
      'title': 'Exclusive Discounts Inside', 
      'desc': '15 July 2024', 
    },
    {
      'image' : IKImages.chatUser5,
      'title': 'Limited Stock - Act Fast!', 
      'desc': '15 July 2024', 
    },
    {
      'image' : IKImages.chatUser6,
      'title': 'Get Ready to Shop', 
      'desc': '15 July 2024', 
    },
];

class Swipeables extends StatefulWidget {
  const Swipeables({ super.key });

  @override
  State<Swipeables> createState() => _SwipeablesState();
}

class _SwipeablesState extends State<Swipeables> with SingleTickerProviderStateMixin {

  late final controller = SlidableController(this);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(IKSizes.container, IKSizes.headerHeight), 
        child: Container(
          alignment: Alignment.center,
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: IKSizes.container
            ),
            child: AppBar(
              leading: Builder(
                builder: (context) {
                  return IconButton(
                    icon:Icon(Icons.arrow_back_ios,size: 20),
                    iconSize: 28,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  );
                },
              ),
              title: const Text('Swipeable'),
              centerTitle: true,
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
      body: ListView(
          children : swipeableData.map((item){
            return Slidable(
              // Specify a key if the Slidable is dismissible.
              key: const ValueKey(0),

              // The start action pane is the one at the left or the top side.
              startActionPane: ActionPane(
                // A motion is a widget used to control how the pane animates.
                motion: const ScrollMotion(),

                // A pane can dismiss the Slidable.
                dismissible: DismissiblePane(onDismissed: () {}),

                // All actions are defined in the children parameter.
                children: const [
                  // A SlidableAction can have an icon and/or a label.
                  SlidableAction(
                    onPressed: doNothing,
                    backgroundColor: Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                    padding: EdgeInsets.symmetric(horizontal: 2),
                  ),
                  SlidableAction(
                    onPressed: doNothing,
                    backgroundColor: Color(0xFF21B7CA),
                    foregroundColor: Colors.white,
                    icon: Icons.share,
                    label: 'Share',
                  ),
                ],
              ),

              // The end action pane is the one at the right or the bottom side.
              endActionPane:  ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    // An action can be bigger than the others.
                    // flex: 2,
                    onPressed: (_) => controller.openEndActionPane(),
                    backgroundColor: const Color(0xFF7BC043),
                    foregroundColor: Colors.white,
                    icon: Icons.archive,
                    label: 'Archive',
                  ),
                  SlidableAction(
                    onPressed: (_) => controller.close(),
                    backgroundColor: const Color(0xFF0392CF),
                    foregroundColor: Colors.white,
                    icon: Icons.save,
                    label: 'Save',
                  ),
                ],
              ),

              // The child of the Slidable is what the user sees when the
              // component is not dragged.
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  border: Border(bottom: BorderSide(width: 1,color: Theme.of(context).dividerColor))
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(IKSizes.radiusMd),
                      child: Image.asset(item['image']!,height: 50,width: 50),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(item['title']!,style: Theme.of(context).textTheme.titleLarge),
                          const SizedBox(height: 2),
                          Text(item['desc']!,style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }).toList(),
        ),
    );
  }
}

void doNothing(BuildContext context) {}
