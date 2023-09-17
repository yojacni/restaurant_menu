import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_menu/core/entities/enums/submission_status_enum.dart';
import 'package:restaurant_menu/core/global/widgets/custom_background_image.dart';
import 'package:restaurant_menu/core/global/widgets/custom_progress_indicator.dart';
import 'package:restaurant_menu/feature/menu_management/domain/entity/category.dart';
import 'package:restaurant_menu/feature/menu_management/presentation/controller/menu_management/menu_management_bloc.dart';
import 'package:restaurant_menu/feature/menu_management/presentation/widgets/categories_widget.dart';
import 'package:restaurant_menu/feature/menu_management/presentation/widgets/plates_widget.dart';
import 'package:restaurant_menu/inject_repositories.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MenuManagementBloc(
        UseCases.getCategoriesUseCase,
      ),
      child: const _HomePageView(),
    );
  }
}

class _HomePageView extends StatefulWidget {
  const _HomePageView();

  @override
  State<_HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<_HomePageView> {
  @override
  void initState() {
    context
        .read<MenuManagementBloc>()
        .add(MenuManagementFetchCategoriesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MenuManagementBloc, MenuManagementState>(
      listener: (context, state) {},
      bloc: context.read<MenuManagementBloc>(),
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              const CustomBackGroundImage(),
              _buildBody(state.categories, context),
              if (state.status == SubmissionStatusEnum.sent)
                const CustomCircularProgressIndicator(),
            ],
          ),
        );
      },
    );
  }
}

Widget _buildBody(List<Category> categories, BuildContext context) {
  if (categories.isEmpty) {
    return const SizedBox.shrink();
  }

  return _HomePageBody(
    categories: categories,
  );
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({
    required this.categories,
  });
  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<MenuManagementBloc, MenuManagementState>(
        builder: (context, state) {
          return Column(
            children: [
              SizedBox(
                height: 80.h,
              ),
              CategoriesWidget(
                selectedCategoryIndex: state.selectedCategoryIndex,
                categories: categories,
              ),
              SizedBox(
                height: 10.h,
              ),
              PlatesWidget(
                extrachoices:
                    categories[state.selectedCategoryIndex].extraChoices,
                plates: categories[state.selectedCategoryIndex].plates,
              ),
            ],
          );
        },
      ),
    );
  }
}
