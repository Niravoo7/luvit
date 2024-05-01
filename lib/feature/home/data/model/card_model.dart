import 'dart:convert';

import 'package:luvit/feature/home/domain/entity/card.dart';

List<CardModel> cardModelsFromJson(String str) =>
    List<CardModel>.from(json.decode(str).map((x) => CardModel.fromJson(x)));

CardModel cardModelFromJson(String str) => CardModel.fromJson(json.decode(str));

String cardModelToJson(CardModel data) => json.encode(data.toJson());

class CardModel extends Card {
  const CardModel({
    super.images,
    super.name,
    super.description,
    super.likeCount,
    super.location,
    super.age,
    super.tags,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) => CardModel(
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

List<CardModel> parseMapFruitsToList(String jsonStr) {
  final Map<String, dynamic> data = jsonDecode(jsonStr);
  final cardModels = <CardModel>[];

  data.forEach((key, value) {
    final fruit = CardModel.fromJson(value);
    cardModels.add(fruit);
  });

  return cardModels;
}
