import 'package:equatable/equatable.dart';
import 'package:restaurant_menu/feature/menu_management/domain/entity/category.dart';

class Menu extends Equatable {
  const Menu({
    required this.categories,
  });

  final List<Category> categories;

  @override
  List<Object?> get props => [
        categories,
      ];
}
