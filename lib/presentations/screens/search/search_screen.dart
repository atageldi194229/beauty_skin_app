import 'dart:async';

import 'package:beauty_skin/constants/constants.dart';
import 'package:beauty_skin/data/api/product/product_api.dart';
import 'package:beauty_skin/data/models/brand/brand_model.dart';
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
  bool isMore = true;
  int page = 0;
  List<ProductModel> products = [];
  final TextEditingController searchController = TextEditingController();

  Timer? _debounce;
  final _productRepo = ProductRepository();

  @override
  void dispose() {
    _debounce?.cancel();
    searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchProducts();

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
      brandId: widget.filter.brand?.id,
    ));

    if (mounted) {
      if (products.isNotEmpty) {
        setState(() => this.products = [...this.products, ...products]);
      } else {
        setState(() => isMore = false);
      }
    }
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: TextField(
        controller: searchController,
        keyboardType: TextInputType.text,
        autofocus: false,
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
    final category = widget.filter.category;
    final subCategory = widget.filter.subCategory;
    final brand = widget.filter.brand;
    String text = "";
    TextStyle? style = Theme.of(context).textTheme.titleMedium;

    if (category != null) {
      text += category.nameTranslate(context);
    }

    if (category != null && subCategory != null) {
      text += " > ";
    }

    if (subCategory != null) {
      text += subCategory.nameTranslate(context);
    }

    if (brand != null) {
      text = brand.nameTranslate(context) ?? "";
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
}
