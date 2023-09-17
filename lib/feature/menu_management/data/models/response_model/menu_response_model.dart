import 'package:equatable/equatable.dart';
import 'package:restaurant_menu/feature/menu_management/data/models/response_model/category_response_model.dart';
import 'package:restaurant_menu/feature/menu_management/domain/entity/menu.dart';

class MenuResponseModel extends Equatable {
  const MenuResponseModel({
    required this.categories,
  });

  factory MenuResponseModel.fromJson(Map<String, dynamic> json) =>
      MenuResponseModel(
        categories: (json['categories'] as List<dynamic>)
            .map(
              (e) => CategoryResponseModel.fromJson(
                Map<String, dynamic>.from(e as Map),
              ),
            )
            .toList(),
      );
  final List<CategoryResponseModel> categories;

  Map<String, dynamic> toJson() => {
        'categories': categories.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [
        categories,
      ];

  Menu toEntity() => Menu(
        categories: categories.map((e) => e.toEntity()).toList(),
      );
}
