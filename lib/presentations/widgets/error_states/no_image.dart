import 'package:flutter/material.dart';
import 'package:beauty_skin/localization/translate.dart';

class NoImage extends StatelessWidget {
  const NoImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(Translate.of(context).translate('noImage')));
  }
}
