import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:restaurant_menu/feature/menu_management/data/models/response_model/extra_choice_response_model.dart';
import 'package:restaurant_menu/feature/menu_management/data/models/response_model/menu_item_response_model.dart';
import 'package:restaurant_menu/feature/menu_management/domain/entity/category.dart';

CategoryResponseModel userProfileFromJson(String str) =>
    CategoryResponseModel.fromJson(json.decode(str) as Map<String, dynamic>);

class CategoryResponseModel extends Equatable {
  const CategoryResponseModel({
    required this.id,
    required this.name,
    required this.image,
    required this.plates,
    required this.extraChoices,
  });

  factory CategoryResponseModel.fromJson(Map<String, dynamic> json) =>
      CategoryResponseModel(
        id: json['id'] as int,
        name: json['name'] as String,
        image: json['image'] as String,
        plates: (json['plates'] as List<dynamic>)
            .map((e) => PlateResponseModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        extraChoices: (json['extraChoices'] as List<dynamic>?)
            ?.map((e) =>
                ExtraChoiceResponseModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  final int id;
  final String name;
  final String image;
  final List<PlateResponseModel> plates;
  final List<ExtraChoiceResponseModel>? extraChoices;

  @override
  List<Object?> get props => [
        id,
        name,
        image,
        plates,
        extraChoices,
      ];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'plates': plates.map((e) => e.toJson()).toList(),
        'extraChoices': extraChoices?.map((e) => e.toJson()).toList(),
      };

  Category toEntity() => Category(
        id: id,
        name: name,
        image: image,
        plates: plates.map((e) => e.toEntity()).toList(),
        extraChoices: extraChoices?.map((e) => e.toEntity()).toList(),
      );
}
