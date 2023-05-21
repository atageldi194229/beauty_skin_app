import 'package:beauty_skin/localization/translate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class TextFieldUsername extends StatelessWidget {
  const TextFieldUsername({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "username".tr(context),
        prefixIcon: const Icon(IconlyBold.profile),
      ),
    );
  }
}
