import 'package:badges/badges.dart';
import 'package:beauty_skin/configs/config.dart';
import 'package:beauty_skin/constants/constants.dart';
import 'package:beauty_skin/data/models/order/order.dart';
import 'package:beauty_skin/data/models/product/product_model.dart';
import 'package:beauty_skin/localization/translate.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderItemWidget extends StatelessWidget {
  const OrderItemWidget({
    super.key,
    required this.order,
  });

  final OrderResponseModel order;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 3,
      child: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    List<Widget> items = [
      _buildKeyValueText(context, "status".tr(context), "${order.status}"),
      _buildKeyValueText(context, "full_name".tr(context), "${order.fullName}"),
      _buildKeyValueText(context, "phone_number".tr(context), "${order.phoneNumber}"),
      _buildKeyValueText(context, "address".tr(context), "${order.address}"),
      _buildKeyValueText(context, "payment".tr(context), "${order.toleg}"),
      _buildKeyValueText(context, "created_at".tr(context), "${order.createdAtFormatted}"),
      _buildKeyValueText(context, "comment".tr(context), "${order.comment}"),
      _imagesPart(context),
    ];

    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(AppRouter.DETAIL_ORDER, arguments: order);
      },
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, i) => items[i],
        itemCount: items.length,
        separatorBuilder: (_, __) => const Divider(),
      ),
    );
  }

  Widget _buildKeyValueText(BuildContext context, String key, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: kDefaultPadding * .5),
      child: Row(
        children: [
          Text(key, style: Theme.of(context).textTheme.titleMedium),
          const Spacer(flex: 1),
          Expanded(
            flex: 10,
            child: Text(
              value,
              textAlign: TextAlign.right,
              overflow: TextOverflow.clip,
            ),
          ),
        ],
      ),
    );
  }

  Widget _imagesPart(BuildContext context) {
    return SizedBox(
      height: 80.w,
      child: ListView.builder(
        padding: const EdgeInsets.all(kDefaultPadding).copyWith(top: 0),
        scrollDirection: Axis.horizontal,
        itemCount: order.products?.length ?? 0,
        itemBuilder: (context, index) {
          final productItem = order.products![index];

          final imageUrl = productItem.product.images.isNotEmpty ? productItem.product.images[0] : null;

          return Padding(
            padding: const EdgeInsets.only(right: kDefaultPadding),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 2,
                  color: Colors.grey.shade200,
                  style: BorderStyle.solid,
                ),
                borderRadius: kBorderRadius5,
              ),
              child: Badge(
                badgeStyle: const BadgeStyle(badgeColor: Colors.lightGreen),
                badgeContent: Text(
                  "${productItem.count}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    // fontFamily: montserratMedium,
                  ),
                ),
                badgeAnimation: const BadgeAnimation.fade(),
                child: ClipRRect(
                  borderRadius: kBorderRadius5,
                  child: LayoutBuilder(builder: (context, constraints) {
                    return imageUrl != null
                        ? CachedNetworkImage(
                            imageUrl: imageUrl,
                            fit: BoxFit.contain,
                            width: constraints.maxHeight,
                            height: constraints.maxHeight,
                            placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
                          )
                        : Container(
                            width: constraints.maxHeight,
                            height: constraints.maxHeight,
                            color: Colors.amber,
                          );
                  }),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
