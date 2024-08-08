import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/widgets/shimmer_loading_widget.dart';
import '../../logic/home_cubit/home_cubit.dart';

class HomeGuestOffersWidget extends StatefulWidget {
  const HomeGuestOffersWidget({super.key});

  @override
  State<HomeGuestOffersWidget> createState() => _HomeGuestOffersWidgetState();
}

class _HomeGuestOffersWidgetState extends State<HomeGuestOffersWidget> {
  late final CarouselControllerPlus _controller;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getHomeOffers();
    _controller = CarouselControllerPlus();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: context.read<HomeCubit>(),
      buildWhen: (previous, current) {
        return current is OffersLoading ||
            current is OffersLoaded ||
            current is OffersError;
      },
      builder: (context, state) {
        if (state is OffersLoading) {
          return ShimmerLoadingWidget(
            width: double.infinity,
            height: 135.h,
          );
        } else if (state is OffersLoaded) {
          List<String> offersUrl =
              state.offers.map((offer) => offer.imageUrl).toList();
          return Column(
            children: [
              CarouselSlider(
                controller: _controller,
                items: (offersUrl).map((url) => Image.network(url)).toList(),
                options: CarouselOptions(
                    height: 115.h,
                    viewportFraction: 0.9.r,
                    padEnds: true,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 5),
                    onPageChanged: (index, reason) {
                      selectedIndex = index;
                      setState(() {});
                    }),
              ),
              Gap(16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 3; i++)
                    Container(
                      width: selectedIndex == i ? 16.w : 4.w,
                      height: 4.w,
                      margin: EdgeInsets.only(right: 5.w),
                      decoration: BoxDecoration(
                        color: selectedIndex == i ? Colors.white : Colors.grey,
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                    ),
                ],
              ),
            ],
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
