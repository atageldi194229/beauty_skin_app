import 'package:beauty_skin/presentations/widgets/others/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:beauty_skin/configs/size_config.dart';
import 'package:beauty_skin/constants/constants.dart';

class BannerLoading extends StatelessWidget {
  const BannerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      height: SizeConfig.screenHeight / 4,
      width: SizeConfig.screenWidth,
      decoration: const BoxDecoration(
        borderRadius: kBorderRadius15,
        color: kGreyColor,
      ),
      child: const Loading(),
    );
  }
}
