import 'package:beauty_skin/constants/constants.dart';
import 'package:beauty_skin/data/models/product/product_model.dart';
import 'package:beauty_skin/presentations/screens/detail_product/widgets/add_to_cart_bar.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import 'widgets/product_images.dart';
import 'widgets/product_info.dart';

class DetailProductScreen extends StatelessWidget {
  final ProductModel product;

  const DetailProductScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: ListView(
          children: [
            ProductImagesWidget(
              images: product.images,
              brand: product.brand,
            ),
            ProductInfoWidget(product: product),
            const SizedBox(height: kDefaultPadding),
            AddToCartBarWidget(product: product),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 1,
      centerTitle: true,
      leadingWidth: 50,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
          size: 20,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            if (product.images.isEmpty) return;

            Share.share(
              product.images.first,
              subject: 'Beauty Skin App: ${product.nameTranslate(context)}',
            );
          },
          icon: const Icon(Icons.share, color: Colors.black),
        ),
      ],
      title: Text(
        product.nameTranslate(context),
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
      ),
    );
  }
}
