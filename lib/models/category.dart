// To parse this JSON data, do
//
//     final categoryData = categoryDataFromJson(jsonString);

import 'dart:convert';

CategoryData categoryDataFromJson(String str) => CategoryData.fromJson(json.decode(str));

String categoryDataToJson(CategoryData data) => json.encode(data.toJson());

class CategoryData {
    String status;
    String message;
    List<String> categories;

    CategoryData({
        required this.status,
        required this.message,
        required this.categories,
    });

    factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
        status: json["status"],
        message: json["message"],
        categories: List<String>.from(json["categories"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "categories": List<dynamic>.from(categories.map((x) => x)),
    };
}
