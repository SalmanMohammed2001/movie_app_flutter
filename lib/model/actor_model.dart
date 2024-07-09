import 'package:logger/logger.dart';

import 'company_model.dart';

class ActorModel {
  int id;
  String name;
  String? character;
  String? image;

  ActorModel({
    required this.id,
    required this.name,
    this.character,
    this.image,
  });

  factory ActorModel.fromJson(Map<String, dynamic> json) {
    return ActorModel(
      id: json['id'],
      name: json['name'],
      character: json['character'],
      image: json['profile_path'],
    );
  }
}
