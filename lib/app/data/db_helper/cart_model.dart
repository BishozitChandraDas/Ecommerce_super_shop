class CartModel {
  final String? id;
  final int? quantity;
  final String? name;
  final String? description;
  final dynamic price;
  final dynamic weight;
  final String? image;

  CartModel({
    this.id,
    this.quantity,
    this.name,
    this.description,
    this.price,
    this.weight,
    this.image,
  });

  // Convert CartModel instance to a map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'quantity': quantity,
      'name': name,
      'description': description,
      'price': price,
      'weight': weight,
      'image': image,
    };
  }

  // Create a CartModel instance from a map
  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      quantity: json['quantity'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      weight: json['weight'],
      image: json['image'],
    );
  }
}
