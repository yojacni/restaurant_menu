import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:restaurant_menu/core/network/connectivity.dart';
import 'package:restaurant_menu/core/network/internet_checker.dart';
import 'package:restaurant_menu/core/service_locator/service_locator.dart';
import 'package:restaurant_menu/feature/menu_management/data/datasources/remote/menu_management_remote_datasource.dart';
import 'package:restaurant_menu/feature/menu_management/data/repositories/menu_management_repository_impl.dart';
import 'package:restaurant_menu/feature/menu_management/domain/repository/menu_management_repository.dart';
import 'package:restaurant_menu/feature/menu_management/domain/usecase/get_categories_usecase.dart';

Future<void> injectRepositories({
  required FirebaseDatabase firebaseDatabase,
}) async {
  final connectivityService = ConnectivityServiceImpl(
    Connectivity(),
    InternetChecker(),
  );
  final menuManagementRemoteAPI = FirebaseMenuManagementRemoteApiImpl(
    firebaseDatabase,
  );

  final menuRepository = MenuManagementRepositoryImpl(
    menuManagementRemoteAPI,
    connectivityService,
  );

  ServiceLocator.instance.put<MenuManagementRepository>(menuRepository);

  ServiceLocator.instance.put<GetCategoriesUseCase>(
    GetCategoriesUseCase(menuRepository),
  );

  await connectivityService.initialize();
}

class Repositories {
  Repositories._();

  static MenuManagementRepository get account => ServiceLocator.instance.find();
}

class UseCases {
  UseCases._();

  static GetCategoriesUseCase get getCategoriesUseCase =>
      ServiceLocator.instance.find();
}
