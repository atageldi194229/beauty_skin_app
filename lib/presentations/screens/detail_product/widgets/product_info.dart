import 'package:beauty_skin/configs/config.dart';
import 'package:beauty_skin/constants/constants.dart';
import 'package:beauty_skin/data/models/product/product_model2.dart';
import 'package:beauty_skin/utils/utils.dart';
import 'package:flutter/material.dart';

class ProductInfoWidget extends StatefulWidget {
  const ProductInfoWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel2 product;

  @override
  ProductInfoWidgetState createState() => ProductInfoWidgetState();
}

class ProductInfoWidgetState extends State<ProductInfoWidget> {
  ProductModel2 get product => widget.product;

  // local states
  bool seeMore = false;

  void onSeeMore() => setState(() => seeMore = !seeMore);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: SizeConfig.defaultPadding),
      padding: EdgeInsets.symmetric(vertical: SizeConfig.defaultSize * 2),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProductName(),
          SizedBox(height: SizeConfig.defaultSize * 0.5),
          _buildPrice(),
          SizedBox(height: SizeConfig.defaultSize * 2),
          Row(
            children: [
              SizedBox(width: SizeConfig.defaultPadding),
              _buildSoldQuantity(),
              SizedBox(width: SizeConfig.defaultSize),
              Container(height: 15, width: 2, color: Colors.black12),
              SizedBox(width: SizeConfig.defaultSize),
            ],
          ),
          SizedBox(height: SizeConfig.defaultSize * 2),
          _buildDescription(),
        ],
      ),
    );
  }

  _buildProductName() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultPadding),
      child: Text(product.productName!, style: FONT_CONST.BOLD_DEFAULT_24),
    );
  }

  _buildPrice() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${product.price} TMT",
            style: FONT_CONST.BOLD_PRIMARY_24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              product.price!,
              style: const TextStyle(decoration: TextDecoration.lineThrough),
            ),
          ),
        ],
      ),
    );
  }

  _buildSoldQuantity() {
    return Text.rich(
      TextSpan(
        style: FONT_CONST.BOLD_DEFAULT,
        children: [
          TextSpan(
            text: Translate.of(context).translate('sold'),
            style: FONT_CONST.BOLD_DEFAULT_18,
          ),
          TextSpan(
            text: " 12",
            style: FONT_CONST.BOLD_PRIMARY_18,
          ),
        ],
      ),
    );
  }

  _buildDescription() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.productName!,
            style: FONT_CONST.REGULAR_DEFAULT_18,
            maxLines: seeMore ? null : 2,
          ),
          const SizedBox(height: 5),

          // See more button
          GestureDetector(
            onTap: onSeeMore,
            child: Text(
              seeMore
                  ? Translate.of(context).translate('see_less')
                  : Translate.of(context).translate('see_more'),
              style: FONT_CONST.BOLD_PRIMARY_18,
            ),
          ),
        ],
      ),
    );
  }
}
