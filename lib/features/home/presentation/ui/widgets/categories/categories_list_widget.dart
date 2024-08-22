import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/helpers/extensions/extensions.dart';
import '../../../logic/home_cubit/home_cubit.dart';
import 'categories_list_loaded_widget.dart';
import 'categories_list_loading_widget.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: context.read<HomeCubit>()..getHomeCategories(),
      buildWhen: (previous, current) {
        return current is CategoriesLoading ||
            current is CategoriesLoaded ||
            current is CategoriesError;
      },
      builder: (context, state) {
        if (state is CategoriesLoading) {
          return const CategoriesListLoadingWidget();
        } else if (state is CategoriesLoaded) {
          return CategoriesListLoadedWidget(categories: state.categories);
        } else if (state is CategoriesError) {
          return Center(
            child: Text(state.failure.message ?? "").setHorizontalPadding(16.w),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
