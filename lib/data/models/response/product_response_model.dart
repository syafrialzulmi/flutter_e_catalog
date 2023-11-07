// {
//     "title": "New Product",
//     "price": 10,
//     "description": "A description",
//     "images": [
//         "https://placeimg.com/640/480/any"
//     ],
//     "category": {
//         "id": 1,
//         "name": "Clothes",
//         "image": "https://i.imgur.com/zQwsC2m.jpeg",
//         "creationAt": "2023-11-07T03:27:07.000Z",
//         "updatedAt": "2023-11-07T03:27:07.000Z"
//     },
//     "id": 206,
//     "creationAt": "2023-11-07T03:44:51.000Z",
//     "updatedAt": "2023-11-07T03:44:51.000Z"
// }
import 'dart:convert';

class ProductResponseModel {
  String? title;
  int? price;
  String? description;
  List<String>? images;
  Category? category;
  int? id;
  DateTime? creationAt;
  DateTime? updatedAt;

  ProductResponseModel({
    this.title,
    this.price,
    this.description,
    this.images,
    this.category,
    this.id,
    this.creationAt,
    this.updatedAt,
  });

  factory ProductResponseModel.fromJson(String str) =>
      ProductResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductResponseModel.fromMap(Map<String, dynamic> json) =>
      ProductResponseModel(
        title: json["title"],
        price: json["price"],
        description: json["description"],
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
        category: json["category"] == null
            ? null
            : Category.fromMap(json["category"]),
        id: json["id"],
        creationAt: json["creationAt"] == null
            ? null
            : DateTime.parse(json["creationAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "price": price,
        "description": description,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "category": category?.toMap(),
        "id": id,
        "creationAt": creationAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class Category {
  int? id;
  String? name;
  String? image;
  DateTime? creationAt;
  DateTime? updatedAt;

  Category({
    this.id,
    this.name,
    this.image,
    this.creationAt,
    this.updatedAt,
  });

  factory Category.fromJson(String str) => Category.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        creationAt: json["creationAt"] == null
            ? null
            : DateTime.parse(json["creationAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "image": image,
        "creationAt": creationAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
