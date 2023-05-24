import 'package:beauty_skin/localization/translate.dart';
import 'package:beauty_skin/presentations/screens/categories/bloc/categories_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/categories_list_view.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesBloc()..add(LoadCategories()),
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: const SafeArea(
          child: SingleChildScrollView(
            child: CategoriesListView(),
          ),
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
