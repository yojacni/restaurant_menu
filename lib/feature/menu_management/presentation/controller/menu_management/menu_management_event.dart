part of 'menu_management_bloc.dart';

@immutable
abstract class MenuManagementEvent extends Equatable {
  const MenuManagementEvent();

  @override
  List<Object> get props => [];
}

class MenuManagementFetchCategoriesEvent extends MenuManagementEvent {
  @override
  List<Object> get props => [];
}

class CategoryChangedEvent extends MenuManagementEvent {
  const CategoryChangedEvent({required this.categoryIndexSelected});

  final int categoryIndexSelected;

  @override
  List<Object> get props => [
        categoryIndexSelected,
      ];
}
