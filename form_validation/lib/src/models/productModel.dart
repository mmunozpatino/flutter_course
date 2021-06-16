// To parse this JSON data, do
//
//     final ProductModel = ProductModelFromJson(jsonString);

import 'dart:convert';

ProductModel ProductModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String ProductModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {

    String id;
    String title;
    double price;
    bool available;
    String imageUrl;

    ProductModel({
        this.id,
        this.title = '',
        this.price  = 0.0,
        this.available = true,
        this.imageUrl,
    });

    factory ProductModel.fromJson(Map<String, dynamic> json) => new ProductModel(
        id         : json["id"],
        title     : json["title"],
        price      : json["price"],
        available : json["available"],
        imageUrl    : json["imageUrl"],
    );

    Map<String, dynamic> toJson() => {
        "id"         : id,
        "title"     : title,
        "price"      : price,
        "available" : available,
        "imageUrl"    : imageUrl,
    };
}
