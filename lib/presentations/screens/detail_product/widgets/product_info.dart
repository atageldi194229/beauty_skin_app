import 'package:beauty_skin/configs/config.dart';
import 'package:beauty_skin/constants/constants.dart';
import 'package:beauty_skin/data/models/product/product_model.dart';
import 'package:beauty_skin/presentations/common_blocs/favorite/favorite_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ProductInfoWidget extends StatefulWidget {
  const ProductInfoWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  ProductInfoWidgetState createState() => ProductInfoWidgetState();
}

class ProductInfoWidgetState extends State<ProductInfoWidget> {
  ProductModel get product => widget.product;

  // local states
  bool seeMore = false;

  void onSeeMore() => setState(() => seeMore = !seeMore);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: SizeConfig.defaultPadding),
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProductName(),
                  const SizedBox(height: kDefaultPadding),
                  _buildPrice(),
                  SizedBox(height: SizeConfig.defaultSize * 2),
                ],
              ),
              const Spacer(),
              BlocBuilder<FavoriteBloc, FavoriteState>(
                builder: (context, state) {
                  bool isFavorited = false;
                  var productToRemove = product;

                  if (state is FavoritesLoaded) {
                    if (state.products.any((e) => e == product)) {
                      isFavorited = true;
                      productToRemove =
                          state.products.firstWhere((e) => e == product);
                    }
                  }

                  return FloatingActionButton(
                    onPressed: () {
                      if (isFavorited) {
                        context
                            .read<FavoriteBloc>()
                            .add(RemoveFavoriteItemModel(productToRemove));
                      } else {
                        context
                            .read<FavoriteBloc>()
                            .add(AddFavoriteItemModel(product));
                      }
                    },
                    child: Icon(
                      isFavorited ? IconlyBold.heart : IconlyLight.heart,
                      color: Colors.white,
                    ),
                  );
                },
              ),
              SizedBox(width: SizeConfig.defaultSize * 2),
            ],
          ),
          // Row(
          //   children: [
          //     SizedBox(width: SizeConfig.defaultPadding),
          //     _buildSoldQuantity(),
          //     const SizedBox(width: kDefaultPadding),
          //     Container(height: 15, width: 2, color: Colors.black12),
          //     const SizedBox(width: kDefaultPadding),
          //   ],
          // ),
          const Divider(height: 1),
          const SizedBox(height: kDefaultPadding * 2),
          _buildDescription(),
        ],
      ),
    );
  }

  _buildProductName() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 2),
      child: Text(
        product.nameTranslate(context),
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }

  _buildPrice() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${product.discountPrice} TMT",
            style: FONT_CONST.BOLD_PRIMARY_24,
          ),
          if (product.price != product.discountPrice)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                "${product.price}",
                style: const TextStyle(decoration: TextDecoration.lineThrough),
              ),
            ),
        ],
      ),
    );
  }

  // _buildSoldQuantity() {
  //   return Text.rich(
  //     TextSpan(
  //       style: FONT_CONST.BOLD_DEFAULT,
  //       children: [
  //         TextSpan(
  //           text: 'sold'.tr(context),
  //           style: FONT_CONST.BOLD_DEFAULT_18,
  //         ),
  //         TextSpan(
  //           text: " 12",
  //           style: FONT_CONST.BOLD_PRIMARY_18,
  //         ),
  //       ],
  //     ),
  //   );
  // }

  _buildDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.contentTranslate(context),
            style: FONT_CONST.REGULAR_DEFAULT_18,
            // maxLines: seeMore ? null : 2,
          ),
          const SizedBox(height: kDefaultPadding * 2),

          // See more button
          // Center(
          //   child: GradientButtonFb1(
          //     onPressed: onSeeMore,
          //     text: seeMore
          //         ? 'see_less.tr(context)
          //         : 'see_more'.tr(context),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class GradientButtonFb1 extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const GradientButtonFb1(
      {required this.text, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const primaryColor = COLOR_CONST.primaryColor; // Color(0xff4338CA);
    const secondaryColor = COLOR_CONST.secondaryColor; // Color(0xff6D28D9);
    const accentColor = Color(0xffffffff);

    const double borderRadius = 15;

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        gradient: const LinearGradient(colors: [primaryColor, secondaryColor]),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          alignment: Alignment.center,
          padding: MaterialStateProperty.all(
            const EdgeInsets.only(right: 75, left: 75, top: 15, bottom: 15),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(color: accentColor, fontSize: 16),
        ),
      ),
    );
  }
}
