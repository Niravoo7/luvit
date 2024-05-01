import 'dart:convert';

import 'package:luvit/feature/home/domain/entity/card.dart';

List<CardDataModel> cardDataModelsFromJson(String str) =>
    List<CardDataModel>.from(json.decode(str).map((x) => CardDataModel.fromJson(x)));

CardDataModel cardDataModelFromJson(String str) => CardDataModel.fromJson(json.decode(str));

String cardDataModelToJson(CardDataModel data) => json.encode(data.toJson());

class CardDataModel extends CardData {
  const CardDataModel({
    super.images,
    super.name,
    super.description,
    super.likeCount,
    super.location,
    super.age,
    super.tags,
  });

  factory CardDataModel.fromJson(Map<String, dynamic> json) => CardDataModel(
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
        name: json["name"],
        description: json["description"],
        likeCount: json["likeCount"],
        location: json["location"],
        age: json["age"],
        tags: json["tags"] == null
            ? []
            : List<String>.from(json["tags"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "name": name,
        "description": description,
        "likeCount": likeCount,
        "location": location,
        "age": age,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
      };
}

List<CardDataModel> parseMapFruitsToList(String jsonStr) {
  final Map<String, dynamic> data = jsonDecode(jsonStr);
  final cardDataModels = <CardDataModel>[];

  data.forEach((key, value) {
    final fruit = CardDataModel.fromJson(value);
    cardDataModels.add(fruit);
  });

  return cardDataModels;
}
