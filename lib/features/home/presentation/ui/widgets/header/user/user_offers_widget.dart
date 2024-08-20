import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/helpers/extensions/padding_ext.dart';
import '../../../../../../../core/widgets/shimmer_loading_widget.dart';
import '../../../../logic/home_cubit/home_cubit.dart';

class UserOffersWidget extends StatelessWidget {
  const UserOffersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: context.read<HomeCubit>()..getHomeOffers(),
      buildWhen: (previous, current) {
        return current is OffersLoading ||
            current is OffersLoaded ||
            current is OffersError;
      },
      builder: (context, state) {
        if (state is OffersLoading) {
          return ShimmerLoadingWidget(
            width: double.infinity,
            height: 138.h,
          ).setHorizontalPadding(24.w);
        } else if (state is OffersLoaded) {
          List<String> offersUrl =
              state.offers.map((offer) => offer.imageUrl).toList();
          return CarouselSlider(
            items: (offersUrl).map((url) => Image.network(url)).toList(),
            options: CarouselOptions(
              height: 138.h,
              viewportFraction: 0.8.r,
              enlargeCenterPage: true,
              enlargeFactor: 0.17.r,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
            ),
          );
        } else if (state is OffersError) {
          return Text(state.failure.message ?? "");
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
