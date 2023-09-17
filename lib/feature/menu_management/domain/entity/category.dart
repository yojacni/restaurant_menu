import 'package:equatable/equatable.dart';
import 'package:restaurant_menu/feature/menu_management/domain/entity/extra_choice.dart';
import 'package:restaurant_menu/feature/menu_management/domain/entity/menu_item.dart';

class Category extends Equatable {
  const Category({
    required this.id,
    required this.name,
    required this.image,
    required this.plates,
    required this.extraChoices,
  });

  final int id;
  final String name;
  final String image;
  final List<Plate> plates;
  final List<ExtraChoice>? extraChoices;

  @override
  List<Object?> get props => [
        id,
        name,
        image,
        plates,
        extraChoices,
      ];
}
