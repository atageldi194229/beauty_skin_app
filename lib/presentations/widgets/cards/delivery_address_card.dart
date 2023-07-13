import 'package:beauty_skin/constants/constants.dart';
import 'package:beauty_skin/data/models/delivery_address_model.dart';
import 'package:flutter/material.dart';

class DeliveryAddressCard extends StatelessWidget {
  const DeliveryAddressCard({
    super.key,
    required this.deliveryAddress,
    this.onEditPressed,
    this.onTap,
  });

  final DeliveryAddressModel deliveryAddress;
  final VoidCallback? onEditPressed;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: kBorderRadius5,
      elevation: 3,
      shadowColor: Colors.grey,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          vertical: kDefaultPadding,
          horizontal: kDefaultPadding * 2,
        ),
        onTap: onTap,
        title: Text(
          deliveryAddress.name,
          style: FONT_CONST.BOLD_DEFAULT_18,
        ),
        subtitle: Text(
          deliveryAddress.address,
          style: FONT_CONST.REGULAR_PRIMARY,
        ),
        trailing: IconButton(
          onPressed: onEditPressed,
          icon: const Icon(
            Icons.edit_outlined,
            color: COLOR_CONST.primaryColor,
          ),
        ),
      ),
    );
  }
}
