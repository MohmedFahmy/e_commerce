import 'package:equatable/equatable.dart';

import 'favorite_product.dart';
import 'purchases_table.dart';

class ProductModel extends Equatable {
  final String? productId;
  final DateTime? createdAt;
  final String? productName;
  final String? price;
  final String? oldPrice;
  final String? sale;
  final String? description;
  final String? category;
  final String? imageUrl;
  final List<FavoriteProduct>? favoriteProducts;
  final List<PurchasesTable>? purchasesTable;

  const ProductModel({
    this.productId,
    this.createdAt,
    this.productName,
    this.price,
    this.oldPrice,
    this.sale,
    this.description,
    this.category,
    this.imageUrl,
    this.favoriteProducts,
    this.purchasesTable,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    productId: json['product_id'] as String?,
    createdAt:
        json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
    productName: json['product_name'] as String?,
    price: json['price'] as String?,
    oldPrice: json['old_price'] as String?,
    sale: json['sale'] as String?,
    description: json['description'] as String?,
    category: json['category'] as String?,
    imageUrl: json['image_url'] as String?,
    favoriteProducts:
        (json['favorite_products'] as List<dynamic>?)
            ?.map((e) => FavoriteProduct.fromJson(e as Map<String, dynamic>))
            .toList(),
    purchasesTable:
        (json['purchases_table'] as List<dynamic>?)
            ?.map((e) => PurchasesTable.fromJson(e as Map<String, dynamic>))
            .toList(),
  );

  Map<String, dynamic> toJson() => {
    'product_id': productId,
    'created_at': createdAt?.toIso8601String(),
    'product_name': productName,
    'price': price,
    'old_price': oldPrice,
    'sale': sale,
    'description': description,
    'category': category,
    'image_url': imageUrl,
    'favorite_products': favoriteProducts?.map((e) => e.toJson()).toList(),
    'purchases_table': purchasesTable?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props {
    return [
      productId,
      createdAt,
      productName,
      price,
      oldPrice,
      sale,
      description,
      category,
      imageUrl,
      favoriteProducts,
      purchasesTable,
    ];
  }
}
