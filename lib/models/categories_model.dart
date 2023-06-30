import 'dart:convert';

class CategoriesModel {
    String category;
    String data;

    CategoriesModel({
        required this.category,
        required this.data,
    });

    factory CategoriesModel.fromRawJson(String str) => CategoriesModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CategoriesModel.fromJson(Map<String, dynamic> json) => CategoriesModel(
        category: json["category"],
        data: json["data"],
    );

    Map<String, dynamic> toJson() => {
        "category": category,
        "data": data,
    };
}
