import 'dart:async';

import 'package:beauty_skin/data/models/banner_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:beauty_skin/configs/size_config.dart';
import 'package:beauty_skin/constants/constants.dart';
import 'package:beauty_skin/presentations/widgets/cards/banner_card.dart';

class BannerListView extends StatefulWidget {
  const BannerListView({super.key, required this.banners});

  final List<BannerModel> banners;

  @override
  State<BannerListView> createState() => _BannersViewState();
}

class _BannersViewState extends State<BannerListView> {
  int _currentIndex = 0;
  final _dotUpdater = StreamController<int>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CarouselSlider.builder(
          itemCount: widget.banners.length,
          itemBuilder: (context, index, count) {
            return BannerCard(
              image: widget.banners[index].imageUrl,
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
            return dots(widget.banners.length);
          },
        ),
      ],
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
