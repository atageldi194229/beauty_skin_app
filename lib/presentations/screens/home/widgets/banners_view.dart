import 'dart:async';

import 'package:beauty_skin/data/models/banner_model.dart';
import 'package:beauty_skin/data/repositories/banner_repo.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:beauty_skin/configs/size_config.dart';
import 'package:beauty_skin/constants/constants.dart';
import 'package:beauty_skin/presentations/widgets/cards/banner_card.dart';
import 'package:beauty_skin/presentations/widgets/loadings/banner_loading.dart';

class BannersView extends StatefulWidget {
  const BannersView({super.key});

  @override
  State<BannersView> createState() => _BannersViewState();
}

class _BannersViewState extends State<BannersView> {
  int _currentIndex = 0;
  final _dotUpdater = StreamController<int>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BannerModel>>(
      future: BannerRepository().fetchBanners2(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const BannerLoading();
          // return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          // return ErrorState(
          //   onTap: () {
          //     BannerService().getBanners();
          //   },
          // );
          return const Center(child: Text("Load error"));
        } else if (snapshot.data!.isEmpty) {
          // return SizedBox(
          //   height: SizeConfig.screenHeight / 4,
          //   child: EmptyStateText(),
          // );
          return const Center(child: Text("No images"));
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CarouselSlider.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index, count) {
                return BannerCard(
                  image: snapshot.data![index].imageUrl,
                );
              },
              options: CarouselOptions(
                onPageChanged: (index, CarouselPageChangedReason a) {
                  _currentIndex = index;
                  _dotUpdater.add(index);
                  // setState(() {
                  // });
                },
                height: SizeConfig.screenHeight / 4,
                viewportFraction: 1.0,
                autoPlay: true,
                scrollPhysics: const BouncingScrollPhysics(),
                autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                autoPlayAnimationDuration: const Duration(milliseconds: 2000),
              ),
            ),
            StreamBuilder(
              stream: _dotUpdater.stream,
              builder: (context, _) {
                return dots(snapshot.data!.length);
              },
            ),
          ],
        );
      },
    );
  }

  SizedBox dots(int length) {
    return SizedBox(
      height: 4,
      width: SizeConfig.screenWidth,
      child: Center(
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: length,
          itemBuilder: (_, int index) => dot(index),
        ),
      ),
    );
  }

  AnimatedContainer dot(int index) {
    return AnimatedContainer(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      duration: const Duration(milliseconds: 500),
      curve: Curves.decelerate,
      height: 16,
      width: 18,
      decoration: BoxDecoration(
        color: _currentIndex == index
            ? COLOR_CONST.primaryColor
            : Colors.grey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}
