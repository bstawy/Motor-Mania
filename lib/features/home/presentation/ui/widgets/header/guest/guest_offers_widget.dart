import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../../../core/widgets/shimmer_loading_widget.dart';
import '../../../../../domain/entities/offer_entity.dart';
import '../../../../logic/home_cubit/home_cubit.dart';
import 'guest_offers_loaded_widget.dart';

class GuestOffersWidget extends StatelessWidget {
  const GuestOffersWidget({super.key});

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
            height: 123.h,
            containerColor: ColorsManager.darkBlue,
            baseColor: const Color(0xFF1A1B28),
            highlightColor: const Color(0xFF33354E),
          ).setOnlyPadding(0, 12.h, 16.w, 16.w);
        } else if (state is OffersLoaded) {
          List<OfferEntity> offers = state.offers;

          offers = offers
              .where((offer) => offer.id == 1 || offer.id == 2 || offer.id == 3)
              .toList();

          List<String> guestOffersUrl =
              offers.map((offer) => offer.imageUrl).toList();

          return GuestOffersLoadedWidget(offersUrl: guestOffersUrl);
        } else if (state is OffersError) {
          return Text(
            state.failure.message ?? "",
            style: const TextStyle(color: Colors.white),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
