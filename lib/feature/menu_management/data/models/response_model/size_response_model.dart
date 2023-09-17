import 'package:equatable/equatable.dart';
import 'package:restaurant_menu/feature/menu_management/domain/entity/size.dart';

class SizeResponseModel extends Equatable {
  const SizeResponseModel({
    required this.name,
    required this.disccount,
  });

  factory SizeResponseModel.fromJson(Map<String, dynamic> json) =>
      SizeResponseModel(
        name: json['name'] as String,
        disccount: json['disccount'] as String,
      );
  final String name;
  final String disccount;

  @override
  List<Object?> get props => [
        name,
        disccount,
      ];

  Map<String, dynamic> toJson() => {
        'name': name,
        'disccount': disccount,
      };

  Size toEntity() => Size(
        name: name,
        disccount: disccount,
      );
}
