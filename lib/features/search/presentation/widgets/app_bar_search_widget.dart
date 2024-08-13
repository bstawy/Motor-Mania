import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/text/text_styles.dart';
import '../../../../core/config/theme/colors_manager.dart';
import '../../../../core/helpers/debouncer.dart';
import '../../../../core/helpers/extensions/extensions.dart';
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
    return TextField(
      controller: _searchController,
      onChanged: (value) => _onSearchQueryChanged(value),
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      autofocus: true,
      style: TextStyles.font14DarkBlueMedium,
      decoration: InputDecoration(
        hintText: "What are you looking for?",
        hintStyle: TextStyles.font12BlueGreyMedium,
        prefixIcon: Padding(
          padding: EdgeInsets.only(right: 16.w),
          child: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            color: ColorsManager.darkBlue,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
