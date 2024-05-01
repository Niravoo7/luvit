import 'package:equatable/equatable.dart';

class Card extends Equatable {
  const Card({
    this.images,
    this.name,
    this.description,
    this.likeCount,
    this.location,
    this.age,
    this.tags,
  });

  final List<String>? images;
  final String? name;
  final String? description;
  final int? likeCount;
  final String? location;
  final int? age;
  final List<String>? tags;

  @override
  List<Object?> get props =>
      [images, name, description, likeCount, location, age, tags];
}
