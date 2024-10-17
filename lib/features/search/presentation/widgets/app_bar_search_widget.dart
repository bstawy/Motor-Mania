import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../../core/helpers/debouncer.dart';
import '../../../../core/helpers/extensions/extensions.dart';
import '../../../../core/helpers/extensions/theme_ext.dart';
import '../logic/search_cubit.dart';

class AppBarSearchWidget extends StatefulWidget {
  const AppBarSearchWidget({super.key});

  @override
  State<AppBarSearchWidget> createState() => _AppBarSearchWidgetState();
}

class _AppBarSearchWidgetState extends State<AppBarSearchWidget> {
  late TextEditingController _searchController;
  final Debouncer _debouncer = Debouncer(milliseconds: 300);
  String lastQuery = "";

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // debounce search query to avoid multiple requests
  // send search request only when user stop typing
  void _onSearchQueryChanged(String query) {
    _debouncer.run(() {
      if (query != lastQuery) {
        lastQuery = query;
        context.read<SearchCubit>().search(query);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final customTextStyles = context.textStyles;
    final customColors = context.colors;

    return TextField(
      controller: _searchController,
      onChanged: (value) => _onSearchQueryChanged(value),
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      autofocus: true,
      style: customTextStyles.headlineMedium?.copyWith(
        fontWeight: FontWeightHelper.medium,
      ),
      decoration: InputDecoration(
        hintText: "What are you looking for?",
        hintStyle: customTextStyles.headlineSmall?.copyWith(
          color: ColorsManager.blueGrey,
          fontWeight: FontWeightHelper.medium,
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.only(right: 16.w),
          child: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            color: customColors.primary,
          ),
        ),
      ),
    );
  }
}
