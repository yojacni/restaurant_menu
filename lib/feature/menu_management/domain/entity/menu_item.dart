import 'package:equatable/equatable.dart';
import 'package:restaurant_menu/feature/menu_management/domain/entity/choice.dart';
import 'package:restaurant_menu/feature/menu_management/domain/entity/enums/temper_enum.dart';
import 'package:restaurant_menu/feature/menu_management/domain/entity/size.dart';

class Plate extends Equatable {
  const Plate({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.choices,
    required this.size,
    required this.temper,
  });

  final int id;
  final String name;
  final String price;
  final String description;
  final List<Choice>? choices;
  final List<Size>? size;
  final Temper? temper;

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        price,
      ];
}
