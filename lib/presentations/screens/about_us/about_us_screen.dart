import 'package:beauty_skin/constants/constants.dart';
import 'package:beauty_skin/utils/utils.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text("about_us".tr(context)),
    );
  }

  _buildBody(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(kdefaultPadding * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "delivery".tr(context),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: kdefaultPadding * 2),
            Text(
              "deliver service in ashgabat deliver service in ashgabat deliver service in ashgabat deliver service in ashgabat deliver service in ashgabat deliver service in ashgabat",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: kdefaultPadding * 2),
            Text(
              "contact_us".tr(context),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: kdefaultPadding * 2),
            _buildKeyValueText(
              context,
              "phone_number".tr(context),
              "+99312345678".tr(context),
            ),
            _buildKeyValueText(
              context,
              "imo".tr(context),
              "+99312345678".tr(context),
            ),
            _buildKeyValueText(
              context,
              "instagram".tr(context),
              "beauty_skin_tm".tr(context),
            ),
          ],
        ),
      ),
    );
  }

  _buildKeyValueText(BuildContext context, String key, String value) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(key, style: Theme.of(context).textTheme.titleSmall),
        ),
        Expanded(
          flex: 1,
          child: Text(value, style: Theme.of(context).textTheme.bodyMedium),
        ),
      ],
    );
  }
}
