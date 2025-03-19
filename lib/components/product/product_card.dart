import 'package:cached_network_image/cached_network_image.dart';
import 'package:lookme/utils/constants/colors.dart';
import 'package:lookme/utils/constants/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScreenArguments {
  final dynamic id;

  ScreenArguments(this.id);
}

class ProductCard extends StatefulWidget {
  final Map<String, dynamic>? category;
  final Map<String, dynamic>? title;
  final List<String>? images;
  final double price;
  final double originalPrice;
  final double? discount;
  final int stock;
  final int? sales;
  final String review;
  final dynamic id;
  final dynamic addCartBtn;
  final dynamic wishlistRemovebtn;
  final String? inWishlist;
  final Function()? removePress;

  const ProductCard({
    super.key,
    required this.category,
    required this.title,
    required this.images,
    required this.price,
    required this.originalPrice,
    this.discount,
    required this.stock,
    this.sales,
    required this.review,
    this.id,
    this.addCartBtn,
    this.wishlistRemovebtn,
    this.inWishlist,
    this.removePress,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  late dynamic _isWishlist;

  @override
  void initState() {
    super.initState();
    _isWishlist = widget.inWishlist == '1';
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
        margin: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Stack(children: [
              AspectRatio(
                aspectRatio: 1 / 1.6,
                child: (widget.images != null &&
                        widget.images!.isNotEmpty &&
                        widget.images!.first.isNotEmpty)
                    ? CachedNetworkImage(
                        imageUrl: widget.images!.first,
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) {
                          print("Error loading image: $url, Error: $error");
                          return Image.asset('assets/images/logo.png',
                              fit: BoxFit.cover);
                        },
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        'assets/images/logo.png',
                        fit: BoxFit.cover,
                      ),
              ),
              if (widget.addCartBtn != null)
                Positioned(
                  left: 10,
                  right: 10,
                  bottom: 10,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/cart');
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      margin: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                      decoration: BoxDecoration(
                        color: IKColors.card,
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Text('Add To Cart',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.merge(const TextStyle(color: IKColors.title))),
                    ),
                  ),
                ),
              Positioned(
                left: 5,
                top: 5,
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
                    color: _isWishlist
                        ? IKColors.danger
                        : IKColors.title.withOpacity(0.3),
                  ),
                ),
              ),
              if (widget.wishlistRemovebtn != null)
                Positioned(
                  right: 10,
                  top: 5,
                  child: GestureDetector(
                    onTap: widget.removePress,
                    child: Container(
                      height: 38,
                      width: 38,
                      margin: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                      decoration: BoxDecoration(
                        color: IKColors.card,
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: const Icon(
                        Icons.close,
                        size: 20,
                        color: IKColors.primary,
                      ),
                    ),
                  ),
                ),
            ]),
            Padding(
              padding: const EdgeInsets.only(right: 15, top: 12, bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (widget.category != null)
                    Text(widget.category!["name"]?["en"] ?? "No Category",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.merge(const TextStyle(color: IKColors.primary))),
                  const SizedBox(height: 3),
                  Text(
                    widget.title?['en'] ?? 'No Title',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.merge(const TextStyle(fontSize: 14)),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        '\$${widget.price.toStringAsFixed(2)}',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.merge(const TextStyle(fontSize: 16)),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '\$${widget.originalPrice.toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.bodySmall?.merge(
                              TextStyle(
                                decoration: TextDecoration.lineThrough,
                                fontWeight: FontWeight.w300,
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? const Color.fromRGBO(255, 255, 255, 0.7)
                                    : const Color.fromARGB(255, 70, 70, 70),
                              ),
                            ),
                      ),
                      const SizedBox(width: 6),
                      const Icon(
                        Icons.star,
                        size: 16,
                        color: Color(0xFFFFA048),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        widget.review,
                        style: Theme.of(context).textTheme.bodySmall?.merge(
                              TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? const Color.fromRGBO(255, 255, 255, 50)
                                    : const Color.fromRGBO(0, 0, 0, 50),
                              ),
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
