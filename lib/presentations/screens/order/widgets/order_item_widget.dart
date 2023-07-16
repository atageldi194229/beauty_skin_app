import 'package:beauty_skin/constants/constants.dart';
import 'package:beauty_skin/data/models/order/order.dart';
import 'package:beauty_skin/localization/translate.dart';
import 'package:flutter/material.dart';

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
    List<MapEntry<String, String>> entries = [
      MapEntry("status".tr(context), "${order.status}"),
      MapEntry("full_name".tr(context), "${order.fullName}"),
      MapEntry("phone_number".tr(context), "${order.phoneNumber}"),
      MapEntry("address".tr(context), "${order.address}"),
      MapEntry("payment".tr(context), "${order.toleg}"),
      MapEntry("created_at".tr(context), "${order.createdAtFormatted}"),
      MapEntry("comment".tr(context), "${order.comment}"),
    ];

    return InkWell(
      onTap: () {},
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, i) => _buildKeyValueText(context, entries[i].key, entries[i].value),
        itemCount: entries.length,
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
}
