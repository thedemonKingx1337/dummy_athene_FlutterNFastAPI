import 'dart:convert';

List<PersonModel> personModelFromJson(String str) => List<PersonModel>.from(
    json.decode(str).map((x) => PersonModel.fromJson(x)));

String personModelToJson(List<PersonModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PersonModel {
  int? id;
  String? name;
  String? position;
  String? image;
  String? description;

  PersonModel({
    this.id,
    this.name,
    this.position,
    this.image,
    this.description,
  });

  factory PersonModel.fromJson(Map<String, dynamic> json) => PersonModel(
        id: json["id"],
        name: json["name"],
        position: json["position"],
        image: json["image"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "position": position,
        "image": image,
        "description": description,
      };
}
