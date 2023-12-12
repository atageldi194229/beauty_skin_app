import 'package:beauty_skin/presentations/widgets/others/loading.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:beauty_skin/constants/constants.dart';
import 'package:beauty_skin/presentations/widgets/error_states/no_image.dart';

class BannerCard extends StatelessWidget {
  const BannerCard({
    super.key,
    required this.image,
    this.name = "banner_name",
    this.description = "banner_description",
  });

  final String image;
  final String name;
  final String description;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        // Get.to(() => BannerProfileView(name, image, description));
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        width: size.width,
        decoration: const BoxDecoration(
          borderRadius: kBorderRadius10,
        ),
        child: ClipRRect(
          borderRadius: kBorderRadius10,
          child: CachedNetworkImage(
            fadeInCurve: Curves.ease,
            imageUrl: image,
            imageBuilder: (context, imageProvider) => Container(
              width: size.width,
              decoration: BoxDecoration(
                borderRadius: kBorderRadius10,
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) => const Loading(),
            errorWidget: (context, url, error) => const NoImage(),
          ),
        ),
      ),
    );
  }
}
