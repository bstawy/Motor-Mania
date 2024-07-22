import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/config/theme/colors_manager.dart';
import '../../../../core/helpers/extensions/extensions.dart';

import '../../../../core/config/text/text_styles.dart';

class AppBarSearchWidget extends StatefulWidget {
  const AppBarSearchWidget({super.key});

  @override
  State<AppBarSearchWidget> createState() => _AppBarSearchWidgetState();
}

class _AppBarSearchWidgetState extends State<AppBarSearchWidget> {
  late TextEditingController _searchController;
  Timer? _debounceTimer;
  String lastQuery = "";

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  // debounce search query to avoid multiple requests
  // send search request only when user stop typing
  void _onSearchQueryChanged(String query) {
    if (_debounceTimer?.isActive ?? false) {
      _debounceTimer?.cancel();
    }

    _debounceTimer = Timer(const Duration(milliseconds: 300), () {
      if (query.isNotEmpty && query != lastQuery) {
        lastQuery = query;
        // context.read<ProductsCubit>().search(query);
        //TODO: Implement search method
      }
      if (_searchController.text.isEmpty) {
        // context.read<ProductsCubit>().clearSearch();
        // TODO: implement clear search method
      }
    });
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchController,
      onChanged: (value) => _onSearchQueryChanged(value),
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      autofocus: true,
      style: TextStyles.font14DarkBlueMedium,
      decoration: InputDecoration(
        hintText: "What are you looking for?",
        hintStyle: TextStyles.font12LightGreyMedium,
        prefixIcon: Padding(
          padding: EdgeInsets.only(right: 16.w),
          child: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            color: ColorsManager.darkkBlue,
          ),
        ),
      ),
    );
  }
}
