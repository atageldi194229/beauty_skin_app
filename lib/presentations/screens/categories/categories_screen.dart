import 'package:beauty_skin/utils/utils.dart';
import 'package:flutter/material.dart';

import 'widgets/categories_list_view.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: CategoriesListView(),
        ),
      ),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text("categories".tr(context)),
    );
  }
}
