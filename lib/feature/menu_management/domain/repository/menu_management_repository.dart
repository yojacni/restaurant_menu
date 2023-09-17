import 'package:dartz/dartz.dart';
import 'package:restaurant_menu/core/errors/failures.dart';
import 'package:restaurant_menu/feature/menu_management/data/models/response_model/category_response_model.dart';

// ignore: one_member_abstracts
abstract class MenuManagementRepository {
  Future<Either<Failure, List<CategoryResponseModel>>> getCategories();
}
