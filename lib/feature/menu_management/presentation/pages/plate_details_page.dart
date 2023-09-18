import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_menu/core/global/widgets/custom_background_image.dart';
import 'package:restaurant_menu/core/global/widgets/custom_network_image.dart';
import 'package:restaurant_menu/feature/menu_management/domain/entity/extra_choice.dart';
import 'package:restaurant_menu/feature/menu_management/domain/entity/menu_item.dart';

class PlateDetailsPage extends StatelessWidget {
  const PlateDetailsPage({
    required this.params,
    super.key,
  });
  final PlaceDetailsPageParams params;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CustomBackGroundImage(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 350.h,
                width: double.infinity,
                child: const CustomNetWorkImage(
                    imageUrl:
                        'https://images.unsplash.com/photo-1594212699903-ec8a3eca50f5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aGFtYnVyZ3Vlc2ElMjB5JTIwcGFwYXMlMjBmcml0YXN8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=800&q=60'),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  params.plate.name,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  params.plate.description,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              _CustomAggregates(
                params: params,
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _CustomAggregates extends StatelessWidget {
  const _CustomAggregates({super.key, required this.params});

  final PlaceDetailsPageParams params;

  @override
  Widget build(BuildContext context) {
    final showFirst =
        params.plate.choices != null && params.plate.choices!.isNotEmpty;
    final showSecond =
        params.plate.size != null && params.plate.size!.isNotEmpty;
    final showThird =
        params.extrachoices != null && params.extrachoices!.isNotEmpty;

    return Column(
      children: [
        if (showFirst)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: Text(
              'Customize your order',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        if (showFirst)
          SizedBox(
            height: 10.h,
          ),
        if (showFirst)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: Text(
              'Choose one between the following options',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        if (showFirst)
          SizedBox(
            height: 10.h,
          ),
        if (showFirst)
          Column(
            children: params.plate.choices == null
                ? []
                : params.plate.choices!
                    .map(
                      (option) => Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '• ${option.name}',
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
          ),
        if (showFirst)
          SizedBox(
            height: 10.h,
          ),
        if (showSecond)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: Text(
              'Choose the size of your plate',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        if (showSecond)
          SizedBox(
            height: 10.h,
          ),
        if (showSecond)
          Column(
            children: params.plate.size == null
                ? []
                : params.plate.size!
                    .map(
                      (option) => Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.h),
                        child: Row(
                          children: [
                            Text(
                              '• ${option.name}',
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              double.parse(option.disccount) == 0.0
                                  ? ''
                                  : '-\$${option.disccount} OFF',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
          ),
        if (showSecond)
          SizedBox(
            height: 10.h,
          ),
        if (showThird)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: Text(
              'Aggregates. Select one ',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        if (showThird)
          SizedBox(
            height: 10.h,
          ),
        if (showThird)
          Column(
            children: params.extrachoices == null
                ? []
                : params.extrachoices!
                    .map(
                      (option) => Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.h),
                        child: Row(
                          children: [
                            Text(
                              '• ${option.name}',
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              double.parse(option.cost) == 0.0
                                  ? 'For free'
                                  : 'Only for \$${option.cost} more',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
          ),
      ],
    );
  }
}

class PlaceDetailsPageParams {
  const PlaceDetailsPageParams({
    required this.plate,
    required this.extrachoices,
  });
  final Plate plate;
  final List<ExtraChoice>? extrachoices;
}
