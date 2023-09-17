import 'package:dartz/dartz.dart';
import 'package:restaurant_menu/core/errors/failures.dart';
import 'package:restaurant_menu/core/usecases/usecase.dart';
import 'package:restaurant_menu/feature/menu_management/data/models/response_model/category_response_model.dart';
import 'package:restaurant_menu/feature/menu_management/domain/repository/menu_management_repository.dart';

class GetCategoriesUseCase
    implements UseCase<List<CategoryResponseModel>, NoParams> {
  GetCategoriesUseCase(this.repository);
  final MenuManagementRepository repository;

  @override
  Future<Either<Failure, List<CategoryResponseModel>>> call(
    NoParams params,
  ) async {
    return repository.getCategories();
  }
}
