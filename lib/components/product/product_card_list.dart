import 'package:lookme/components/product/product_card.dart';
import 'package:lookme/utils/constants/colors.dart';
import 'package:lookme/utils/constants/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductCardList extends StatefulWidget {
  final dynamic id;
  final String title;
  final String price;
  final String oldPrice;
  final String image;
  final String offer;
  final String review;
  final String? inWishlist;

  const ProductCardList({
    super.key,
    required this.title,
    required this.price,
    required this.oldPrice,
    required this.image,
    required this.offer,
    required this.review,
    this.id,
    this.inWishlist,
  });

  @override
  State<ProductCardList> createState() => _ProductCardListState();
}

class _ProductCardListState extends State<ProductCardList> {
  late dynamic _isWishlist;

  @override
  void initState() {
    super.initState();
    _isWishlist = widget.inWishlist == '1' ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product_detail',
            arguments: ScreenArguments(widget.id));
      },
      child: Container(
        color: Theme.of(context).cardColor,
        child: Stack(
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 140,
                      child: Image.asset(
                        widget.image,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      left: -5,
                      top: -5,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            _isWishlist = !_isWishlist;
                          });
                        },
                        iconSize: 20,
                        icon: SvgPicture.string(
                          IKSvg.heart,
                          width: 16,
                          height: 16,
                          // ignore: deprecated_member_use
                          color: _isWishlist
                              ? IKColors.danger
                              : IKColors.title.withOpacity(0.3),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.title,
                            maxLines: 1,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.merge(TextStyle(fontSize: 15))),
                        const SizedBox(
                          height: 2,
                        ),
                        Row(
                          children: [
                            Text('\$${widget.price}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.merge(TextStyle(fontSize: 16))),
                            const SizedBox(width: 6),
                            Text('\$${widget.oldPrice}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.merge(TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        fontWeight: FontWeight.w300,
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Color.fromRGBO(
                                                255, 255, 255, 0.70)
                                            : Color.fromARGB(
                                                255, 70, 70, 70)))),
                            const SizedBox(width: 6),
                            const Icon(
                              Icons.star,
                              size: 16,
                              color: Color(0xFFFFA048),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              widget.review,
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.merge(TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Color.fromRGBO(255, 255, 255, 0.50)
                                          : Color.fromARGB(255, 50, 50, 50))),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text('FREE Delivery',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.merge(TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: IKColors.success))),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.offer,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.merge(TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: IKColors.primary)),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/cart');
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    color: IKColors.primary,
                                    borderRadius: BorderRadius.circular(0)),
                                child: Icon(
                                  Icons.shopping_cart_outlined,
                                  size: 20,
                                  color: IKColors.card,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
