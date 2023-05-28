import 'package:beauty_skin/data/api/product/product_api.dart';
import 'package:beauty_skin/data/models/cart_item_model.dart';
import 'package:beauty_skin/data/models/category/sub_category_model.dart';
import 'package:beauty_skin/data/models/product/product_model.dart';
import 'package:beauty_skin/data/repositories/product_repo.dart';
import 'package:beauty_skin/presentations/common_blocs/cart/cart_bloc.dart';
import 'package:beauty_skin/presentations/widgets/cards/product_card2.dart';
import 'package:beauty_skin/presentations/widgets/others/loading.dart';
import 'package:flutter/material.dart';
import 'package:beauty_skin/constants/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryProductListView extends StatefulWidget {
  const CategoryProductListView({
    super.key,
    required this.subCategory,
  });

  final SubCategoryModel subCategory;

  @override
  State<CategoryProductListView> createState() =>
      _CategoryProductListViewState();
}

class _CategoryProductListViewState extends State<CategoryProductListView> {
  // A list to hold the products loaded from the API
  List<ProductModel> products = [];

  // The current page and limit parameters for the API
  int _page = 1;

  // A flag to indicate if there are more products to load from the API
  bool _hasNextPage = true;

  // A flag to indicate if the initial loading is running
  bool _isFirstLoadRunning = false;

  // A flag to indicate if the load more function is running
  bool _isLoadMoreRunning = false;

  // A scroll controller for the list view
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();

    _firstLoad();
    // Create a scroll controller and add a listener to it
    _controller = ScrollController()..addListener(_loadMore);
  }

  @override
  void dispose() {
    // Remove the listener from the scroll controller when the widget is disposed
    _controller.removeListener(_loadMore);
    super.dispose();
  }

  // A function that sends a GET request to the API and fetches the first batch of products
  void _firstLoad() async {
    setState(() {
      _isFirstLoadRunning = true;
    });

    try {
      final fetchedProducts = await ProductRepository().fetchProducts(
        ProductQueryParameters(
          page: _page,
          subCategoryId: widget.subCategory.id,
        ),
      );
      setState(() {
        products = fetchedProducts;
      });
    } catch (err) {
      debugPrint('Something went wrong: $err');
    }

    setState(() {
      _isFirstLoadRunning = false;
    });
  }

  // A function that sends a GET request to the API and fetches more products when scrolling to the end of the list view
  void _loadMore() async {
    if (_hasNextPage &&
        !_isFirstLoadRunning &&
        !_isLoadMoreRunning &&
        _controller.position.extentAfter < 500) {
      setState(() {
        _isLoadMoreRunning = true;
      });

      _page += 1;

      try {
        final fetchedProducts = await ProductRepository().fetchProducts(
          ProductQueryParameters(
            page: _page,
            subCategoryId: widget.subCategory.id,
          ),
        );

        if (fetchedProducts.isNotEmpty) {
          setState(() {
            products.addAll(fetchedProducts);
          });
        } else {
          setState(() {
            _hasNextPage = false;
          });
        }
      } catch (err) {
        debugPrint('Something went wrong: $err');
      }

      setState(() {
        _isLoadMoreRunning = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double cardWidth = 200;
    double cardHeight = cardWidth * 1.3;

    if (_isFirstLoadRunning) {
      return SizedBox(
        height: cardHeight,
        child: const Loading(),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(kdefaultPadding * 2),
          child: Text(
            widget.subCategory.nameTranslate(context),
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: cardHeight,
          child: BlocBuilder<CartBloc, CartState>(
            builder: (context, cartState) {
              List<CartItemModel>? cart;

              if (cartState is CartLoaded) {
                cart = cartState.cart;
              }

              return ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: kdefaultPadding * 2,
                ),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: products.length + (_isLoadMoreRunning ? 1 : 0),
                itemBuilder: (context, index) {
                  if (products.length == index) {
                    return const Loading();
                  }

                  bool inCart = false;

                  if (cart != null) {
                    inCart = cart.any((e) => e.productInfo == products[index]);
                  }

                  return Container(
                    width: cardWidth,
                    height: cardHeight,
                    padding: const EdgeInsets.only(right: kdefaultPadding),
                    child: ProductCard2(
                      product: products[index],
                      inCart: inCart,
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
