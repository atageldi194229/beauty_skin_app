import 'package:beauty_skin/localization/translate.dart';
import 'package:flutter/material.dart';

import 'widgets/body.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("orders".tr(context)),
      ),
      body: const Body(),
    );
  }
}
