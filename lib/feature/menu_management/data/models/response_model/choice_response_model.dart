import 'package:equatable/equatable.dart';
import 'package:restaurant_menu/feature/menu_management/domain/entity/choice.dart';

class ChoiceResponseModel extends Equatable {
  const ChoiceResponseModel({
    required this.name,
  });
  //Generate fromJson and toJson

  factory ChoiceResponseModel.fromJson(Map<String, dynamic> json) =>
      ChoiceResponseModel(
        name: json['name'] as String,
      );
  final String name;

  @override
  List<Object?> get props => [
        name,
      ];

  Map<String, dynamic> toJson() => {
        'name': name,
      };

  Choice toEntity() => Choice(
        name: name,
      );
}
