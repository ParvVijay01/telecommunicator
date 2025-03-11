import 'package:lookme/utils/constants/colors.dart';
import 'package:lookme/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  const Buttons({ super.key });

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
              title: const Text('Buttons'),
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
      body: Container(
        alignment: Alignment.topCenter,
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: IKSizes.container,
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(IKSizes.borderRadiusSm)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(width: 1,color: Theme.of(context).dividerColor))
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 15),
                        child: Text('Classic Buttons',style: Theme.of(context).textTheme.titleLarge),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Wrap(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0,bottom: 8.0),
                              child: ElevatedButton(
                                onPressed: (){}, 
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: IKColors.primary,
                                  side: const BorderSide(color: IKColors.primary),
                                  foregroundColor: IKColors.card
                                ),
                                child: const Text('Primary'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0,bottom: 8.0),
                              child: ElevatedButton(
                                onPressed: (){}, 
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: IKColors.secondary,
                                  side: const BorderSide(color: IKColors.secondary),
                                  foregroundColor: IKColors.card
                                ),
                                child: const Text('Secondary'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0,bottom: 8.0),
                              child: ElevatedButton(
                                onPressed: (){}, 
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: IKColors.danger,
                                  side: const BorderSide(color: IKColors.danger),
                                ),
                                child: const Text('Danger'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0,bottom: 8.0),
                              child: ElevatedButton(
                                onPressed: (){}, 
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: IKColors.success,
                                  side: const BorderSide(color: IKColors.success),
                                ),
                                child: const Text('Success'),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(IKSizes.borderRadiusSm)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(width: 1,color: Theme.of(context).dividerColor))
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 15),
                        child: Text('Button Light',style: Theme.of(context).textTheme.titleLarge),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Wrap(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0,bottom: 8.0),
                              child: ElevatedButton(
                                onPressed: (){}, 
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(40, 40, 117, 240),
                                  side: const BorderSide(color: Color.fromARGB(40, 40, 117, 240)),
                                  foregroundColor: IKColors.primary
                                ),
                                child: const Text('Primary'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0,bottom: 8.0),
                              child: ElevatedButton(
                                onPressed: (){}, 
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(40, 255, 224, 25),
                                  side: const BorderSide(color: Color.fromARGB(40, 255, 224, 25)),
                                  foregroundColor: IKColors.title
                                ),
                                child: const Text('Secondary'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0,bottom: 8.0),
                              child: ElevatedButton(
                                onPressed: (){}, 
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(40, 235, 87, 87),
                                  side: const BorderSide(color: Color.fromARGB(40, 235, 87, 87)),
                                  foregroundColor: IKColors.danger,
                                ),
                                child: const Text('Danger'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0,bottom: 8.0),
                              child: ElevatedButton(
                                onPressed: (){}, 
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(40, 33, 150, 84),
                                  side: const BorderSide(color: Color.fromARGB(40, 33, 150, 84)),
                                  foregroundColor: IKColors.success
                                ),
                                child: const Text('Success'),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(IKSizes.borderRadiusSm)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(width: 1,color: Theme.of(context).dividerColor))
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 15),
                        child: Text('Button Outline',style: Theme.of(context).textTheme.titleLarge),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Wrap(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0,bottom: 8.0),
                              child: ElevatedButton(
                                onPressed: (){}, 
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  side: const BorderSide(color: IKColors.primary),
                                  foregroundColor: IKColors.primary
                                ),
                                child: const Text('Primary'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0,bottom: 8.0),
                              child: ElevatedButton(
                                onPressed: (){}, 
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  side: const BorderSide(color: IKColors.secondary),
                                  foregroundColor: const Color.fromARGB(255, 211, 184, 11)
                                ),
                                child: const Text('Secondary'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0,bottom: 8.0),
                              child: ElevatedButton(
                                onPressed: (){}, 
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  side: const BorderSide(color: IKColors.danger),
                                  foregroundColor: IKColors.danger
                                ),
                                child: const Text('Danger'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0,bottom: 8.0),
                              child: ElevatedButton(
                                onPressed: (){}, 
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  side: const BorderSide(color: IKColors.success),
                                  foregroundColor: IKColors.success,
                                ),
                                child: const Text('Success'),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(IKSizes.borderRadiusSm)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(width: 1,color: Theme.of(context).dividerColor))
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 15),
                        child: Text('Button Size',style: Theme.of(context).textTheme.titleLarge),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Wrap(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0,bottom: 8.0),
                              child: ElevatedButton(
                                onPressed: (){}, 
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 20)
                                ),
                                child: const Text('Small'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0,bottom: 8.0),
                              child: ElevatedButton(
                                onPressed: (){}, 
                                child: const Text('Medium'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0,bottom: 8.0),
                              child: ElevatedButton(
                                onPressed: (){}, 
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(vertical: 18,horizontal: 30)
                                ),
                                child: const Text('Large'),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}