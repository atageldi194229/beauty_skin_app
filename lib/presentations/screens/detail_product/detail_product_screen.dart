import 'package:beauty_skin/data/models/product/product_model2.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import 'widgets/product_images.dart';
import 'widgets/product_info.dart';

class DetailProductScreen extends StatelessWidget {
  final ProductModel2 product;

  const DetailProductScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: ListView(
          children: [
            ProductImagesWidget(images: [product.imageUrl]),
            ProductInfoWidget(product: product),
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
            Share.share(
              product.imageUrl,
              subject: 'Beauty Skin App: ${product.productName}',
            );
          },
          icon: const Icon(Icons.share, color: Colors.black),
        ),
      ],
      title: Text(
        product.productName!,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
      ),
    );
  }
}
