import 'package:beauty_skin/constants/constants.dart';
import 'package:flutter/material.dart';

class NoImageWidget extends StatelessWidget {
  const NoImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: kBorderRadius15,
      ),
      child: Image.asset(
        appLogo,
        color: Colors.grey,
      ),
    );
  }
}
