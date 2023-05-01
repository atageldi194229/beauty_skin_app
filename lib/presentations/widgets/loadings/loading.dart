import 'package:flutter/material.dart';
import 'package:beauty_skin/constants/constants.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: COLOR_CONST.primaryColor,
      ),
    );
  }
}
