// ignore_for_file: one_member_abstracts

import 'package:firebase_database/firebase_database.dart';
import 'package:restaurant_menu/feature/menu_management/data/models/response_model/category_response_model.dart';

abstract class MenuManagementRemoteApi {
  Future<List<CategoryResponseModel>> getCategories();
}

class FirebaseMenuManagementRemoteApiImpl extends MenuManagementRemoteApi {
  FirebaseMenuManagementRemoteApiImpl(this._firebaseDatabase);

  final FirebaseDatabase _firebaseDatabase;

  @override
  Future<List<CategoryResponseModel>> getCategories() async {
    try {
      final firebaseResponse =
          await _firebaseDatabase.ref().child('menu/categories/').once();

      final listResponse =
          firebaseResponse.snapshot.value as List<dynamic>? ?? [];
      if (listResponse.isEmpty) {
        return [];
      }

      final result = listResponse.map((e) {
        final result = Map<String, dynamic>.from(e as Map);
        return CategoryResponseModel.fromJson(result);
      }).toList();

      return result;
    } catch (e) {
      rethrow;
    }
  }
}
