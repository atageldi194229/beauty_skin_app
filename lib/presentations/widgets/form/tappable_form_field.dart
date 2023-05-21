import 'package:flutter/material.dart';

class TappableFormField extends StatelessWidget {
  const TappableFormField({
    super.key,
    this.value,
    this.labelText = "",
    this.onTap,
    this.prefixIcon,
    this.errorText,
  });

  final String? value;
  final String labelText;
  final VoidCallback? onTap;
  final Widget? prefixIcon;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    String value = this.labelText;
    String? labelText;

    if (this.value != null) {
      labelText = value;
      value = this.value!;
    }

    return InkWell(
      onTap: onTap,
      child: Ink(
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: labelText,
            prefixIcon: prefixIcon,
            suffixIcon: const Icon(Icons.navigate_next_outlined),
            errorText: errorText,
          ),
          child: Text(value),
        ),
      ),
    );
  }
}
