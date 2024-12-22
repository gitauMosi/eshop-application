// To parse this JSON data, do
//
//     final productData = productDataFromJson(jsonString);

import 'dart:convert';

ProductData productDataFromJson(String str) => ProductData.fromJson(json.decode(str));

String productDataToJson(ProductData data) => json.encode(data.toJson());

class ProductData {
    String status;
    String message;
    List<Product> products;

    ProductData({
        required this.status,
        required this.message,
        required this.products,
    });

    factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
        status: json["status"],
        message: json["message"],
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
    };
}

class Product {
    int id;
    String title;
    String image;
    int price;
    String description;
    String brand;
    String model;
    String? color;
    Category category;
    int? discount;
    bool? popular;
    bool? onSale;

    Product({
        required this.id,
        required this.title,
        required this.image,
        required this.price,
        required this.description,
        required this.brand,
        required this.model,
        this.color,
        required this.category,
        this.discount,
        this.popular,
        this.onSale,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        price: json["price"],
        description: json["description"],
        brand: json["brand"],
        model: json["model"],
        color: json["color"],
        category: categoryValues.map[json["category"]]!,
        discount: json["discount"],
        popular: json["popular"],
        onSale: json["onSale"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "price": price,
        "description": description,
        "brand": brand,
        "model": model,
        "color": color,
        "category": categoryValues.reverse[category],
        "discount": discount,
        "popular": popular,
        "onSale": onSale,
    };
}

enum Category {
    AUDIO,
    GAMING,
    MOBILE,
    TV
}

final categoryValues = EnumValues({
    "audio": Category.AUDIO,
    "gaming": Category.GAMING,
    "mobile": Category.MOBILE,
    "tv": Category.TV
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
