// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomDismissible extends StatelessWidget {
  final Function(DismissDirection) onDismissed;
  final Widget child;
  final Icon? removeIcon;

  const CustomDismissible({
    Key? key,
    required this.onDismissed,
    required this.child,
    this.removeIcon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: key!,
      direction: DismissDirection.endToStart,
      onDismissed: onDismissed,
      background: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        decoration: const BoxDecoration(color: Color(0xFFFFE6E6)),
        child: Row(
          children: [
            const Spacer(),
            removeIcon != null ? removeIcon! : const Icon(Icons.remove),
          ],
        ),
      ),
      child: child,
    );
  }
}
