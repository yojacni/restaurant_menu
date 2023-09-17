import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:restaurant_menu/feature/menu_management/data/models/response_model/choice_response_model.dart';
import 'package:restaurant_menu/feature/menu_management/data/models/response_model/size_response_model.dart';
import 'package:restaurant_menu/feature/menu_management/domain/entity/enums/temper_enum.dart';
import 'package:restaurant_menu/feature/menu_management/domain/entity/menu_item.dart';

PlateResponseModel userProfileFromJson(String str) =>
    PlateResponseModel.fromJson(json.decode(str) as Map<String, dynamic>);

class PlateResponseModel extends Equatable {
  const PlateResponseModel({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.choices,
    required this.size,
    required this.temper,
  });

  factory PlateResponseModel.fromJson(Map<String, dynamic> json) =>
      PlateResponseModel(
        id: json['id'] as int,
        name: json['name'] as String,
        price: json['price'] as String,
        description: json['description'] as String,
        choices: (json['choices'] as List<dynamic>?)
            ?.map(
                (e) => ChoiceResponseModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        size: (json['size'] as List<dynamic>?)
            ?.map((e) => SizeResponseModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        temper: json['temper'] != null
            ? Temper.values.firstWhere(
                (element) => element.toString() == json['temper'] as String,
              )
            : null,
      );

  final int id;
  final String name;
  final String price;
  final String description;
  final List<ChoiceResponseModel>? choices;
  final List<SizeResponseModel>? size;
  final Temper? temper;

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        price,
      ];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'description': description,
        'choices': choices?.map((e) => e.toJson()).toList(),
        'size': size?.map((e) => e.toJson()).toList(),
        'temper': temper?.toString(),
      };

  Plate toEntity() => Plate(
        id: id,
        name: name,
        price: price,
        description: description,
        choices: choices?.map((e) => e.toEntity()).toList(),
        size: size?.map((e) => e.toEntity()).toList(),
        temper: temper,
      );
}
