import 'package:cached_network_image/cached_network_image.dart';
import 'package:jctelecaller/provider/cart_provider.dart';
import 'package:jctelecaller/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  void addToCart() {
    Provider.of<CartProvider>(context, listen: false).addItem(
      id: widget.id,
      title: widget.title?['en'] ?? 'No Title',
      price: widget.price,
      image: widget.images?.isNotEmpty == true ? widget.images!.first : '',
      originalPrice: widget.price,
    );
  }

  void decreaseQuantity() {
    Provider.of<CartProvider>(context, listen: false)
        .decreaseQuantity(widget.id);
  }

  void removeFromCart() {
    Provider.of<CartProvider>(context, listen: false).removeItem(widget.id);
  }

  @override
  void initState() {
    super.initState();
    _isWishlist = widget.inWishlist == '1';
  }

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    int cartQuantity = cartProvider.getQuantity(widget.id);

    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              spreadRadius: 2,
            )
          ],
        ),
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: AspectRatio(
                    aspectRatio: 1 / 1.4,
                    child: widget.images != null &&
                            widget.images!.isNotEmpty &&
                            widget.images!.first.isNotEmpty
                        ? CachedNetworkImage(
                            imageUrl: widget.images!.first,
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) => Image.asset(
                              'assets/images/logo.png',
                              fit: BoxFit.cover,
                            ),
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            'assets/images/logo.png',
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            if (widget.category != null)
              Text(
                widget.category!['name']?['en'] ?? 'No Category',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: IKColors.primary, fontWeight: FontWeight.w600),
              ),
            const SizedBox(height: 5),
            Text(
              widget.title?['en'] ?? 'No Title',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Text(
                  '₹${widget.price.toStringAsFixed(2)}',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 16),
                ),
                const SizedBox(width: 6),
                Text(
                  '₹${widget.originalPrice.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                      ),
                ),
                const SizedBox(width: 6),
                const Icon(Icons.star, size: 16, color: Color(0xFFFFA048)),
                const SizedBox(width: 6),
                Text(
                  widget.review,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            const SizedBox(height: 10),
            if (widget.addCartBtn != null)
              cartQuantity == 0
                  ? Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: IKColors.primary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                        ),
                        onPressed: addToCart,
                        child: const Text(
                          'Add To Cart',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Decrease Quantity Button
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: IKColors.primary,
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.remove, color: Colors.white),
                            onPressed: () {
                              if (cartQuantity > 1) {
                                decreaseQuantity();
                              } else {
                                removeFromCart();
                              }
                            },
                          ),
                        ),
                        const SizedBox(width: 6),

                        // Quantity Input Field
                        SizedBox(
                          width: 50, // Adjust width as needed
                          child: TextField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            controller: TextEditingController(
                                text: cartQuantity.toString()),
                            onSubmitted: (value) {
                              int? newQuantity = int.tryParse(value);
                              if (newQuantity != null && newQuantity > 0) {
                                Provider.of<CartProvider>(context,
                                        listen: false)
                                    .updateQuantity(widget.id, newQuantity);
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 8),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 6),

                        // Increase Quantity Button
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: IKColors.primary,
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.add, color: Colors.white),
                            onPressed: addToCart,
                          ),
                        ),
                      ],
                    )
          ],
        ),
      ),
    );
  }
}
