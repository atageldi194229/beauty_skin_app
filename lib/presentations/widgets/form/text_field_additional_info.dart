import 'package:beauty_skin/localization/translate.dart';
import 'package:flutter/material.dart';

class TextFieldAdditionalInfo extends StatelessWidget {
  const TextFieldAdditionalInfo({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      minLines: 4,
      // validator: (value) {
      //   if (value == null || value.isEmpty) {
      //     return "empty".tr(context);
      //   }

      //   return null;
      // },
      decoration: InputDecoration(
        labelText: "additional_information".tr(context),
        alignLabelWithHint: true,
      ),
    );
  }
}
