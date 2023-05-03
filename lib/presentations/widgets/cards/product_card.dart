import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:beauty_skin/constants/constants.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: kBorderRadius15,
          border: Border.all(
            color: const Color(0xFFE1E1E1),
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: CachedNetworkImage(
                fadeInCurve: Curves.ease,
                imageUrl:
                    "https://images.pexels.com/photos/577585/pexels-photo-577585.jpeg?auto=compress&cs=tinysrgb&w=600",
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                // placeholder: (context, url) => Center(child: spinKit()), // TODO: make me spin
                errorWidget: (context, url, error) => noImage(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(kdefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "1100M",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(width: kdefaultPadding),
                      Text(
                        "1200M",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: Colors.red,
                              decoration: TextDecoration.lineThrough,
                            ),
                      ),
                      const Spacer(),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(10),
                          backgroundColor: COLOR_CONST.primaryColor,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {},
                        child: const Icon(Icons.add_outlined),
                      ),
                    ],
                  ),
                  const SizedBox(height: kdefaultPadding),
                  Text(
                    "Баннер c чёрной подложкой 2,00x50 глянец",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget noImage() {
  return Container(
    padding: const EdgeInsets.all(6.0),
    decoration:
        BoxDecoration(color: Colors.grey[100], borderRadius: kBorderRadius15),
    child: Image.asset(
      appLogo,
      color: Colors.grey,
    ),
  );
}

// Widget spinKit() {
//   return Lottie.asset(spinKitLoading, animate: true, width: 200, height: 200);
// }