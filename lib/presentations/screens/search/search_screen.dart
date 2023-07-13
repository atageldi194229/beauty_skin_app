import 'dart:async';

import 'package:beauty_skin/constants/constants.dart';
import 'package:beauty_skin/data/api/product/product_api.dart';
import 'package:beauty_skin/data/models/category/category_model.dart';
import 'package:beauty_skin/data/models/category/sub_category_model.dart';
import 'package:beauty_skin/data/models/product/product_model.dart';
import 'package:beauty_skin/data/repositories/product_repo.dart';
import 'package:beauty_skin/localization/translate.dart';
import 'package:beauty_skin/presentations/screens/search/product_filter.dart';
import 'package:beauty_skin/presentations/widgets/grid_products.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.filter});

  final ProductFilter filter;

  @override
  State<SearchScreen> createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  final _productRepo = ProductRepository();
  Timer? _debounce;
  List<ProductModel> products = [];
  bool isMore = true;
  int page = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      searchController.addListener(() {
        if (_debounce?.isActive ?? false) _debounce?.cancel();
        _debounce = Timer(const Duration(milliseconds: 500), () {
          clearResults();
          fetchProducts();
        });
      });
    });
  }

  clearResults() {
    setState(() {
      page = 0;
      products.clear();
    });
  }

  fetchProducts() async {
    isMore = true;

    var products = await _productRepo.fetchProducts(ProductQueryParameters(
      page: ++page,
      search: searchController.text,
      categoryId: widget.filter.category?.id,
      subCategoryId: widget.filter.subCategory?.id,
    ));

    if (products.isNotEmpty) {
      setState(() => this.products = [...this.products, ...products]);
    } else {
      setState(() => isMore = false);
    }
  }

  @override
  void dispose() {
    _debounce?.cancel();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCategoryTile(),
            Expanded(
              child: GridProducts(
                products: products,
                isMore: isMore,
                getMore: () {
                  fetchProducts();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: TextField(
        controller: searchController,
        keyboardType: TextInputType.text,
        autofocus: true,
        textAlignVertical: TextAlignVertical.center,
        style: FONT_CONST.REGULAR_WHITE_18,
        decoration: InputDecoration(
          isDense: true,
          hintText: "search".tr(context),
          hintStyle: FONT_CONST.REGULAR_WHITE_18,
          border: InputBorder.none,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.close_outlined),
          onPressed: () => searchController.clear(),
        ),
        const SizedBox(width: kDefaultPadding),
      ],
    );
  }

  Widget _buildCategoryTile() {
    CategoryModel? category;
    SubCategoryModel? subCategory;
    String text = "";
    // TextStyle? style = Theme.of(context).textTheme.headlineSmall;
    TextStyle? style = Theme.of(context).textTheme.titleMedium;

    if (widget.filter.category != null) {
      category = widget.filter.category;
    }

    if (widget.filter.subCategory != null) {
      subCategory = widget.filter.subCategory;
    }

    if (category != null) {
      text += category.nameTranslate(context);
    }

    if (category != null && subCategory != null) {
      text += " > ";
    }

    if (subCategory != null) {
      text += subCategory.nameTranslate(context);
    }

    if (text == "") {
      return Container();
    }

    return Material(
      elevation: 1,
      child: ListTile(
        style: ListTileStyle.drawer,
        title: Text(text, style: style),
      ),
    );

    // return Container(
    //   padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 2)
    //       .copyWith(top: kDefaultPadding),
    //   width: double.infinity,
    //   height: kToolbarHeight,
    //   child: Align(
    //     alignment: Alignment.centerLeft,
    //     child: Text(text, style: style),
    //   ),
    // );
  }
}
