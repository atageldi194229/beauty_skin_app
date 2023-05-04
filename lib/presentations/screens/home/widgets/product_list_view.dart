import 'package:beauty_skin/data/models/product_model2.dart';
import 'package:beauty_skin/presentations/widgets/cards/product_card2.dart';
import 'package:flutter/material.dart';
import 'package:beauty_skin/constants/constants.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({
    super.key,
    required this.products,
    this.onBottom,
  });

  final List<ProductModel2> products;
  final VoidCallback? onBottom;

  @override
  Widget build(BuildContext context) {
    double cardWidth = 150;
    double cardHeight = cardWidth * 1.3;

    return SizedBox(
      height: 200,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: kdefaultPadding * 2),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Container(
            width: cardWidth,
            height: cardHeight,
            padding: const EdgeInsets.only(right: kdefaultPadding),
            child: ProductCard2(
                imageUrl: products[index].imageUrl,
                description: products[index].productName!,
                price: products[index].price!),
          );
        },
      ),
    );

    // return FutureBuilder<List<ProductModel2>>(
    //     future: ProductRepository().fetchCategories2(),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return const Center(child: CircularProgressIndicator());
    //         // return const Center(child: CircularProgressIndicator());
    //       } else if (snapshot.hasError) {
    //         // return ErrorState(
    //         //   onTap: () {
    //         //     BannerService().getBanners();
    //         //   },
    //         // );
    //         return const Center(child: Text("Load error"));
    //       } else if (snapshot.data!.isEmpty) {
    //         // return SizedBox(
    //         //   height: SizeConfig.screenHeight / 4,
    //         //   child: EmptyStateText(),
    //         // );s
    //         return const Center(child: Text("No products"));
    //       }

    //       var products = snapshot.data!;

    //       // return;
    //     });
  }
}