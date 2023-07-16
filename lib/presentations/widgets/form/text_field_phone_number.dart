import 'package:beauty_skin/localization/translate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class TextFieldPhoneNumber extends StatelessWidget {
  const TextFieldPhoneNumber({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLength: 8,
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "empty".tr(context);
        }

        if (value.length != 8) {
          return "Length must be 8";
        }

        return null;
      },
      decoration: InputDecoration(
        labelText: "phone_number".tr(context),
        prefix: const Text("+993 ", style: TextStyle(fontSize: 16)),
        prefixIcon: const Icon(IconlyBold.call),
      ),
    );
  }
}
