import 'package:jctelecaller/components/product/product_card.dart';
import 'package:jctelecaller/utils/constants/images.dart';
import 'package:flutter/material.dart';

class HomeDecor extends StatelessWidget {
  const HomeDecor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      color: Theme.of(context).cardColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text('Home Decor & Furnishings',
                style: Theme.of(context).textTheme.headlineMedium),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/product_detail',
                            arguments:
                                ScreenArguments('Ergonomic Office Chair'));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                          right: BorderSide(
                              width: 1, color: Theme.of(context).dividerColor),
                          top: BorderSide(
                              width: 1, color: Theme.of(context).dividerColor),
                        )),
                        padding: const EdgeInsets.all(15),
                        child: AspectRatio(
                          aspectRatio: 1 / 1.2,
                          child: Image.asset(IKImages.product4,
                              fit: BoxFit.contain),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/product_detail',
                            arguments:
                                ScreenArguments('Ergonomic Office Chair'));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                          top: BorderSide(
                              width: 1, color: Theme.of(context).dividerColor),
                        )),
                        padding: const EdgeInsets.all(15),
                        child: AspectRatio(
                          aspectRatio: 2 / 1,
                          child: Image.asset(IKImages.product1,
                              fit: BoxFit.contain),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/product_detail',
                            arguments:
                                ScreenArguments('Ergonomic Office Chair'));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                          right: BorderSide(
                              width: 1, color: Theme.of(context).dividerColor),
                          top: BorderSide(
                              width: 1, color: Theme.of(context).dividerColor),
                        )),
                        padding: const EdgeInsets.all(15),
                        child: AspectRatio(
                          aspectRatio: 1 / 1.2,
                          child: Image.asset(IKImages.product1,
                              fit: BoxFit.contain),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/product_detail',
                            arguments:
                                ScreenArguments('Ergonomic Office Chair'));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                          right: BorderSide(
                              width: 1, color: Theme.of(context).dividerColor),
                          top: BorderSide(
                              width: 1, color: Theme.of(context).dividerColor),
                        )),
                        padding: const EdgeInsets.all(15),
                        child: AspectRatio(
                          aspectRatio: 1 / 1.2,
                          child: Image.asset(IKImages.product1,
                              fit: BoxFit.contain),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/product_detail',
                            arguments: ScreenArguments(
                              'Ergonomic Office Chair',
                            ));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            border: Border(
                          top: BorderSide(
                              width: 1, color: Theme.of(context).dividerColor),
                        )),
                        child: AspectRatio(
                          aspectRatio: 1 / 1.2,
                          child: Image.asset(IKImages.product1,
                              fit: BoxFit.contain),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
