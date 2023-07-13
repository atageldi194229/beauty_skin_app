import 'package:beauty_skin/constants/constants.dart';
import 'package:beauty_skin/localization/translate.dart';
import 'package:flutter/material.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({super.key, this.onTap, this.priceOfGoods = 0});

  final VoidCallback? onTap;
  final double priceOfGoods;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: kBorderRadius10,
      child: Ink(
        padding: const EdgeInsets.all(kDefaultPadding * 2),
        decoration: const BoxDecoration(
          color: COLOR_CONST.primaryColor,
          borderRadius: kBorderRadius10,
        ),
        child: Row(
          children: [
            Text(
              "checkout".tr(context),
              style: const TextStyle(color: Colors.white),
            ),
            const Icon(Icons.navigate_next_outlined, color: Colors.white),
            const Spacer(),
            Text(
              "$priceOfGoods TMT",
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
