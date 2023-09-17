import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart' show immutable;
import 'package:restaurant_menu/core/entities/enums/submission_status_enum.dart';
import 'package:restaurant_menu/core/usecases/usecase.dart';
import 'package:restaurant_menu/feature/menu_management/domain/entity/category.dart';
import 'package:restaurant_menu/feature/menu_management/domain/usecase/get_categories_usecase.dart';

part 'menu_management_event.dart';

part 'menu_management_state.dart';

class MenuManagementBloc
    extends Bloc<MenuManagementEvent, MenuManagementState> {
  MenuManagementBloc(
    this._getCategoriesUseCase,
  ) : super(const MenuManagementState()) {
    on<MenuManagementFetchCategoriesEvent>(_onFetchInfo);
    on<CategoryChangedEvent>(_onCategoryChanged);
  }

  final GetCategoriesUseCase _getCategoriesUseCase;

  Future<void> _onFetchInfo(
    MenuManagementFetchCategoriesEvent event,
    Emitter<MenuManagementState> emit,
  ) async {
    emit(state.copyWith(status: SubmissionStatusEnum.sent));

    final resp = await _getCategoriesUseCase(NoParams());

    emit(
      resp.fold((l) {
        return state.copyWith(status: SubmissionStatusEnum.fail);
      }, (r) {
        final categories = r.map((e) => e.toEntity()).toList();

        return state.copyWith(
          categories: categories,
          status: SubmissionStatusEnum.success,
        );
      }),
    );
  }

  void _onCategoryChanged(
    CategoryChangedEvent event,
    Emitter<MenuManagementState> emit,
  ) {
    emit(
      state.copyWith(
        selectedCategoryIndex: event.categoryIndexSelected,
      ),
    );
  }
}
