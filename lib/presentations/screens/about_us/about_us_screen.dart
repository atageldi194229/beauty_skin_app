import 'package:beauty_skin/constants/constants.dart';
import 'package:beauty_skin/localization/translate.dart';
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
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding * 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Beauty Skin",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: kDefaultPadding * 2),
              Text(
                "about_us_beuaty_skin".tr(context),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: kDefaultPadding * 2),
              Text(
                "delivery".tr(context),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: kDefaultPadding * 2),
              Text(
                "about_us_delivery".tr(context),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: kDefaultPadding * 2),
              Text(
                "contact_us".tr(context),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: kDefaultPadding * 2),
              _buildKeyValueText(
                context,
                "phone_number".tr(context),
                "+99362048189".tr(context),
              ),
              _buildKeyValueText(
                context,
                "IMO".tr(context),
                "+99361446933".tr(context),
              ),
              _buildKeyValueText(
                context,
                "Link".tr(context),
                "+99361446933".tr(context),
              ),
              _buildKeyValueText(
                context,
                "Instagram".tr(context),
                "beauty_skin.Tm".tr(context),
              ),
            ],
          ),
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
