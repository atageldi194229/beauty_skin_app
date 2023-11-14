import 'package:beauty_skin/localization/translate.dart';
import 'package:beauty_skin/presentations/screens/categories/widgets/brands_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/categories_bloc.dart';
import 'widgets/categories_list_view.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoriesBloc>(
      create: (context) => CategoriesBloc()..add(LoadCategories()),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: _buildAppBar(context),
          body: const SafeArea(
            child: TabBarView(
              children: [
                SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: CategoriesListView(),
                ),
                BrandsListView(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      flexibleSpace: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TabBar(
            labelStyle: const TextStyle(fontSize: 20),
            tabs: [
              Tab(text: "categories".tr(context)),
              Tab(text: "brands".tr(context)),
            ],
          ),
        ],
      ),
    );
  }
}
