import 'package:beauty_skin/configs/router.dart';
import 'package:beauty_skin/data/models/brand/brand_model.dart';
import 'package:beauty_skin/presentations/screens/categories/bloc/categories_bloc.dart';
import 'package:beauty_skin/presentations/screens/search/product_filter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BrandsListView extends StatelessWidget {
  const BrandsListView({super.key});

  @override
  Widget build(BuildContext context) {
    final brands = context.select((CategoriesBloc bloc) {
      final state = bloc.state;

      if (state is CategoriesLoaded) {
        return state.brands;
      }

      return [];
    });

    // return const SingleChildScrollView(
    //   child: Icon(Icons.account_circle_outlined),
    // );

    return GridView.builder(
      itemCount: brands.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 2 / 3,
      ),
      itemBuilder: (context, index) {
        return BrandCard(brand: brands[index]);
      },
    );
  }
}

class BrandCard extends StatelessWidget {
  const BrandCard({
    super.key,
    required this.brand,
  });

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppRouter().navigatorKey.currentState?.pushNamed(
              AppRouter.SEARCH,
              arguments: ProductFilter(
                brand: brand,
              ),
            );
      },
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: Column(
          children: [
            Expanded(
              child: CachedNetworkImage(
                imageUrl: brand.imagePath ?? "",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8.0),
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(brand.nameTranslate(context) ?? ""),
            ),
          ],
        ),
      ),
    );
  }
}
