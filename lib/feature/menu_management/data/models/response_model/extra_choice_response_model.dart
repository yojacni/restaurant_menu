import 'package:equatable/equatable.dart';
import 'package:restaurant_menu/feature/menu_management/domain/entity/extra_choice.dart';

class ExtraChoiceResponseModel extends Equatable {
  const ExtraChoiceResponseModel({
    required this.name,
    required this.cost,
  });

  factory ExtraChoiceResponseModel.fromJson(Map<String, dynamic> json) =>
      ExtraChoiceResponseModel(
        name: json['name'] as String,
        cost: json['cost'] as String,
      );
  final String name;
  final String cost;

  @override
  List<Object?> get props => [
        name,
        cost,
      ];

  Map<String, dynamic> toJson() => {
        'name': name,
        'cost': cost,
      };

  ExtraChoice toEntity() => ExtraChoice(
        name: name,
        cost: cost,
      );
}
