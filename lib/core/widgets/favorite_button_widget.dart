import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../features/favorites/presentation/logic/favorites_cubit.dart';
import '../config/theme/colors_manager.dart';
import '../helpers/extensions/extensions.dart';

class FavoriteButtonWidget extends StatelessWidget {
  final dynamic product;
  final double? width, height;
  final double? iconWidth, iconHeight;
  final Color? backgroundColor;

  const FavoriteButtonWidget({
    super.key,
    required this.product,
    this.width,
    this.height,
    this.iconWidth,
    this.iconHeight,
    this.backgroundColor,
  });

  _toggleFavorite(BuildContext context, bool isFavorite) async {
    if (isFavorite) {
      await context.read<FavoritesCubit>().removeFromFavorites(product.id);
    } else {
      await context.read<FavoritesCubit>().addToFavorites(product);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isFavorite = false;

    return GestureDetector(
      onTap: () {
        _toggleFavorite(context, isFavorite);
      },
      child: Container(
        width: width ?? 28.r,
        height: height ?? 28.r,
        padding: EdgeInsets.all(6.r),
        decoration: BoxDecoration(
          color: backgroundColor ?? ColorsManager.whiteGrey,
          borderRadius: BorderRadius.circular(15.r),
        ),
        alignment: Alignment.center,
        child: BlocConsumer<FavoritesCubit, FavoritesState>(
          bloc: context.read<FavoritesCubit>(),
          listenWhen: (previous, current) {
            if (current is AddToFavoritesSuccess ||
                current is RemoveFromFavoritesSuccess) {
              return true;
            }
            return false;
          },
          buildWhen: (previous, current) {
            if (current is FavoritesLoaded) {
              return true;
            }
            return false;
          },
          listener: (context, state) {
            if (state is AddToFavoritesSuccess) {
              context.successSnackBar("Product Added to your Favorites");
            } else {
              context.successSnackBar("Product removed from your Favorites");
            }
          },
          builder: (context, state) {
            if (state is FavoritesLoaded) {
              isFavorite =
                  state.products.any((element) => element.id == product.id);
            }
            return SvgPicture.asset(
              isFavorite
                  ? "assets/icons/favorite_filled_icon.svg"
                  : "assets/icons/favorite_icon.svg",
              width: iconWidth ?? 16.r,
              height: iconHeight ?? 16.r,
            );
          },
        ),
      ),
    );
  }
}
