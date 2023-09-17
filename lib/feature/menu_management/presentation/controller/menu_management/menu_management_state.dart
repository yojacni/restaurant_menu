part of 'menu_management_bloc.dart';

@immutable
class MenuManagementState extends Equatable {
  const MenuManagementState({
    this.status = SubmissionStatusEnum.initial,
    this.categories = const [],
    this.selectedCategoryIndex = 0,
  });

  final SubmissionStatusEnum status;
  final List<Category> categories;
  final int selectedCategoryIndex;

  MenuManagementState copyWith({
    SubmissionStatusEnum? status,
    List<Category>? categories,
    int? selectedCategoryIndex,
  }) {
    return MenuManagementState(
      status: status ?? this.status,
      categories: categories ?? this.categories,
      selectedCategoryIndex:
          selectedCategoryIndex ?? this.selectedCategoryIndex,
    );
  }

  @override
  List<Object?> get props => [
        status,
        categories,
        selectedCategoryIndex,
      ];
}
