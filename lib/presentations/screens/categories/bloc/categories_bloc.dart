import 'dart:async';

import 'package:beauty_skin/data/models/brand/brand_model.dart';
import 'package:beauty_skin/data/models/category/category_model.dart';
import 'package:beauty_skin/data/models/category/sub_category_model.dart';
import 'package:beauty_skin/data/repositories/brand_repo.dart';
import 'package:beauty_skin/data/repositories/category_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final _categoryRepository = CategoryRepository();
  final _brandRepository = BrandRepository();

  CategoriesBloc() : super(CategoriesLoading()) {
    on<LoadCategories>(_mapLoadCategoriesToState);
    on<RefreshCategories>(
      (event, emit) async {
        emit(CategoriesLoading());
        await _mapLoadCategoriesToState(event, emit);
      },
    );
  }

  FutureOr<void> _mapLoadCategoriesToState(
    CategoriesEvent event,
    Emitter<CategoriesState> emit,
  ) async {
    try {
      late CategoriesResponse categoriesResponse;
      late List<BrandModel> brands;

      await Future.wait([
        _brandRepository.fetchBrands().then((r) {
          brands = r;
        }),
        _categoryRepository.fetchCategories().then((r) {
          categoriesResponse = CategoriesResponse(
            categories: r.categories,
            subCategories: r.subCategories,
          );
        }),
      ]);

      // final r = await _categoryRepository.fetchCategories();

      // categories = r.categories;
      // subCategories = r.subCategories;

      // CategoriesResponse categoriesResponse = CategoriesResponse(
      //   categories: categories,
      //   subCategories: subCategories,
      // );

      emit(CategoriesLoaded(
        categoriesResponse: categoriesResponse,
        brands: brands,
      ));
    } catch (e) {
      emit(CategoriesLoadFailure(e.toString()));
    }
  }
}

class CategoriesResponse {
  final List<CategoryModel> categories;
  final List<SubCategoryModel> subCategories;

  CategoriesResponse({
    required this.categories,
    required this.subCategories,
  });
}
