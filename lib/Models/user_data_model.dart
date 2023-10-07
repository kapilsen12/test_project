import 'package:flutter/foundation.dart';

class UserDataModel {
  final int id;
  final String name;
  final Map image;
  final Map address;
  final String phoneNumber;

  UserDataModel({
    required this.id,
    required this.name,
    required this.image,
    required this.address,
    required this.phoneNumber,
  });
  factory UserDataModel.fromJson(Map<String, dynamic> json, int id) {
    return UserDataModel(
      id: id,
      address: json['location'],
      phoneNumber: json['phone'],
      name:
          "${json["name"]["title"]}. ${json["name"]["first"]} ${json["name"]["last"]}",
      image: json["picture"],
    );
  }
}
