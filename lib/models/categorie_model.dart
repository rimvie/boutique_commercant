import 'package:meta/meta.dart';
import 'dart:convert';

CategoryModel categoryModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

class CategoryModel {
  List<Category> categories;

  CategoryModel({
    required this.categories,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    categories: json["categories"] != null
        ? List<Category>.from(
      json["categories"].map((x) => Category.fromJson(x)),
    )
        : [],
  );
}

class Category {
  String nom;
  List<String> subcategory;
  List<String> subCategory;

  Category({
    required this.nom,
    required this.subcategory,
    required this.subCategory,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    nom: json["nom"],
    subcategory: json["subcategory"] != null
        ? List<String>.from(json["subcategory"].map((x) => x))
        : [],
    subCategory: json["subCategory"] != null
        ? List<String>.from(json["subCategory"].map((x) => x))
        : [],
  );
}
