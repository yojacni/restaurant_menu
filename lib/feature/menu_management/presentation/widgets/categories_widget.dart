import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_menu/core/global/widgets/custom_network_image.dart';
import 'package:restaurant_menu/core/global/widgets/item_container.dart';
import 'package:restaurant_menu/feature/menu_management/domain/entity/category.dart';
import 'package:restaurant_menu/feature/menu_management/presentation/controller/menu_management/menu_management_bloc.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    required this.categories,
    required this.selectedCategoryIndex,
    super.key,
  });
  final List<Category> categories;
  final int selectedCategoryIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 16.w : 0,
              right: 16.w,
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    context.read<MenuManagementBloc>().add(
                          CategoryChangedEvent(
                            categoryIndexSelected: index,
                          ),
                        );
                  },
                  child: ItemContainer(
                    isSelected: selectedCategoryIndex == index,
                    width: 80.w,
                    height: 80.h,
                    borderRadius: 20.r,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                      child: CustomNetWorkImage(
                        imageUrl: categories[index].image,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  categories[index].name,
                  style: TextStyle(fontSize: 8.sp),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
