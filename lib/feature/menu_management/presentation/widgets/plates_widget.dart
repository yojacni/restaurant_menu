import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_menu/core/global/widgets/custom_network_image.dart';
import 'package:restaurant_menu/core/global/widgets/item_container.dart';
import 'package:restaurant_menu/core/routes/routes.dart';
import 'package:restaurant_menu/feature/menu_management/domain/entity/extra_choice.dart';
import 'package:restaurant_menu/feature/menu_management/domain/entity/menu_item.dart';
import 'package:restaurant_menu/feature/menu_management/presentation/pages/plate_details_page.dart';

class PlatesWidget extends StatelessWidget {
  const PlatesWidget({
    required this.plates,
    required this.extrachoices,
    super.key,
  });
  final List<Plate> plates;
  final List<ExtraChoice>? extrachoices;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenUtil.defaultSize.height,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(bottom: 20.h),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20.h,
          ),
          itemCount: plates.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: EdgeInsets.only(
                left: 16.w,
                right: 16.w,
              ),
              child: GestureDetector(
                onTap: () {
                  context.pushNamed(
                    Routes.plateDetail,
                    extra: PlaceDetailsPageParams(
                      plate: plates[index],
                      extrachoices: extrachoices,
                    ),
                  );
                },
                child: ItemContainer(
                  isSelected: false,
                  width: double.infinity,
                  height: 200.h,
                  borderRadius: 20.r,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.r),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
                          flex: 4,
                          child: CustomNetWorkImage(
                              imageUrl:
                                  'https://www.recetasnestle.com.mx/sites/default/files/inline-images/comidas-fritas-plato-apanado-ensalada.jpg'),
                        ),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: Text(
                              plates[index].name,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 10.sp,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(child: Container()),
                            Flexible(
                              flex: 2,
                              child: Text(
                                '\$${plates[index].price}',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Icon(
                                Icons.arrow_forward_ios_sharp,
                                color: Colors.black,
                                size: 16.sp,
                              ),
                            ),
                            SizedBox(height: 5.h),
                          ],
                        ),
                        SizedBox(height: 5.h),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
