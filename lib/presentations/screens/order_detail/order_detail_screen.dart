import 'package:beauty_skin/data/models/order/order.dart';
import 'package:beauty_skin/localization/translate.dart';
import 'package:flutter/material.dart';

import 'widgets/body.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({required this.order, super.key});

  final OrderResponseModel order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ordered_products".tr(context)),
      ),
      body: Body(order: order),
    );
  }
}
