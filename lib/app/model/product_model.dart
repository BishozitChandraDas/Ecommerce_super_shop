class ProductModel {
  ProductModel({
    required this.id,
    required this.employee,
    required this.brand,
    required this.category,
    required this.subcategory,
    required this.name,
    required this.sku,
    required this.price,
    required this.shortDescription,
    required this.description,
    required this.quantity,
    required this.isVisible,
    required this.isPlastic,
    required this.image,
    required this.isDiscount,
    required this.isBogo,
    required this.discountedAmount,
    required this.precedence,
    required this.productWeight,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.plasticType,
    required this.weight,
    required this.discountType,
    required this.discountAmount,
    this.proQuantity = 1,
    this.totalPrice,
    this.isBtnClicked = false,
  });

  final String? id;
  final String? employee;
  final Brand? brand;
  final Category? category;
  final Category? subcategory;
  final String? name;
  final int? sku;
  final dynamic price;
  final String? shortDescription;
  final String? description;
  final int? quantity;
  final bool? isVisible;
  final bool? isPlastic;
  final String? image;
  final bool? isDiscount;
  final bool? isBogo;
  final dynamic discountedAmount;
  final int? precedence;
  final String? productWeight;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final Brand? plasticType;
  final dynamic weight;
  final String? discountType;
  final dynamic discountAmount;
  int proQuantity;
  dynamic totalPrice;
  bool isBtnClicked;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["_id"],
      employee: json["employee"],
      brand: json["brand"] == null ? null : Brand.fromJson(json["brand"]),
      category:
          json["category"] == null ? null : Category.fromJson(json["category"]),
      subcategory: json["subcategory"] == null
          ? null
          : Category.fromJson(json["subcategory"]),
      name: json["name"],
      sku: json["sku"],
      price: json["price"],
      totalPrice: json['price'],
      shortDescription: json["shortDescription"],
      description: json["description"],
      quantity: json["quantity"],
      isVisible: json["isVisible"],
      isPlastic: json["isPlastic"],
      image: json["image"],
      isDiscount: json["isDiscount"],
      isBogo: json["isBogo"],
      discountedAmount: json["discountedAmount"],
      precedence: json["precedence"],
      productWeight: json["productWeight"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
      plasticType: json["plasticType"] == null
          ? null
          : Brand.fromJson(json["plasticType"]),
      weight: json["weight"],
      discountType: json["discountType"],
      discountAmount: json["discountAmount"],
    );
  }
}

class Brand {
  Brand({
    required this.id,
    required this.name,
    required this.image,
    required this.v,
    required this.point,
  });

  final String? id;
  final String? name;
  final String? image;
  final int? v;
  final int? point;

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json["_id"],
      name: json["name"],
      image: json["image"],
      v: json["__v"],
      point: json["point"],
    );
  }
}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.precedence,
    required this.image,
    required this.isActive,
    required this.isDiscount,
    required this.v,
    required this.category,
  });

  final String? id;
  final String? name;
  final int? precedence;
  final String? image;
  final bool? isActive;
  final bool? isDiscount;
  final int? v;
  final String? category;

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["_id"],
      name: json["name"],
      precedence: json["precedence"],
      image: json["image"],
      isActive: json["isActive"],
      isDiscount: json["isDiscount"],
      v: json["__v"],
      category: json["category"],
    );
  }
}
