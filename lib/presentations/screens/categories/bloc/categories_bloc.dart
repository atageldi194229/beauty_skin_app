import 'dart:async';

import 'package:beauty_skin/data/models/category/category_model.dart';
import 'package:beauty_skin/data/models/category/sub_category_model.dart';
import 'package:beauty_skin/data/repositories/category_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final _categoryRepository = CategoryRepository();

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
      late List<CategoryModel> categories;
      late List<SubCategoryModel> subCategories;

      final r = await _categoryRepository.fetchCategories();

      categories = r.categories;
      subCategories = r.subCategories;

      CategoriesResponse categoriesResponse = CategoriesResponse(
        categories: categories,
        subCategories: subCategories,
      );

      emit(CategoriesLoaded(categoriesResponse: categoriesResponse));
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
