// To parse this JSON data, do
//
//     final blogModel = blogModelFromJson(jsonString);

import 'dart:convert';

List<BlogModel> blogModelFromJson(String str) => List<BlogModel>.from(json.decode(str).map((x) => BlogModel.fromJson(x)));

String blogModelToJson(List<BlogModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BlogModel {
  String title;
  String text;
  String imageName;

  BlogModel({
    required this.title,
    required this.text,
    required this.imageName,
  });

  factory BlogModel.fromJson(Map<String, dynamic> json) => BlogModel(
        title: json["title"],
        text: json["text"],
        imageName: json["imageName"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "text": text,
        "imageName": imageName,
      };
}
