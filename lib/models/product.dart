
class Product {
  final String? id;
  final String? productId;
  final String? sku;
  final String? barcode;
  final Map<String, dynamic>? title;
  final Map<String, dynamic>? description;
  final String slug;
  final List<String>? categories;
  final Map<String, dynamic> category;
  final List<String>? images;
  final int? stock;
  final int? sales;
  final List<String>? tags;
  final Prices prices;
  final List<dynamic>? variants;
  final bool isCombination;
  final String status;

  Product({
    this.id,
    this.productId,
    this.sku,
    this.barcode,
    this.title,
    this.description,
    required this.slug,
    this.categories,
    required this.category,
    this.images,
    this.stock,
    this.sales,
    this.tags,
    required this.prices,
    this.variants,
    required this.isCombination,
    required this.status,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'],
      productId: json['productId'],
      sku: json['sku'],
      barcode: json['barcode'],
      title: json['title'],
      description: json['description'],
      slug: json['slug'],
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList(),
      category: json['category'],
      images:
          (json['image'] as List<dynamic>?)?.map((e) => e.toString()).toList(),
      stock: json['stock'],
      sales: json['sales'],
      tags: (json['tag'] as List<dynamic>?)?.map((e) => e.toString()).toList(),
      prices: Prices.fromJson(json['prices']),
      variants: json['variants'],
      isCombination: json['isCombination'],
      status: json['status'],
    );
  }
}

class Prices {
  final double originalPrice;
  final double price;
  final double? discount;

  Prices({
    required this.originalPrice,
    required this.price,
    this.discount,
  });

  factory Prices.fromJson(Map<String, dynamic> json) {
    return Prices(
      originalPrice: json['originalPrice'].toDouble(),
      price: json['price'].toDouble(),
      discount: json['discount']?.toDouble(),
    );
  }
}
