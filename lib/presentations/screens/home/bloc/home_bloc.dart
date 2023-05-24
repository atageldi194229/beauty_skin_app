import 'package:beauty_skin/data/models/banner_model.dart';
import 'package:beauty_skin/data/models/category/category_model.dart';
import 'package:beauty_skin/data/models/category/sub_category_model.dart';
import 'package:beauty_skin/data/models/product/product_model.dart';
import 'package:beauty_skin/data/repositories/banner_repo.dart';
import 'package:beauty_skin/data/repositories/category_repo.dart';
import 'package:beauty_skin/data/repositories/product_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final _bannerRepository = BannerRepository();
  final _productRepository = ProductRepository();
  final _categoryRepository = CategoryRepository();

  HomeBloc() : super(HomeLoading()) {
    on<LoadHome>(_mapLoadHomeToState);
    on<RefreshHome>(
      (event, emit) async {
        emit(HomeLoading());
        await _mapLoadHomeToState(event, emit);
      },
    );
  }

  _mapLoadHomeToState(HomeEvent event, Emitter<HomeState> emit) async {
    try {
      late List<ProductModel> popularProducts;
      late List<BannerModel> banners;
      late List<CategoryModel> categories;
      late List<SubCategoryModel> subCategories;

      await Future.wait([
        _productRepository.fetchProducts().then(
              (value) => popularProducts = value,
            ),
        _bannerRepository.fetchBanners().then(
              (value) => banners = value,
            ),
        _categoryRepository.fetchCategories().then(
          (r) {
            categories = r.categories;
            subCategories = r.subCategories;
          },
        ),
      ]);

      HomeResponse homeResponse = HomeResponse(
        banners: banners,
        categories: categories,
        subCategories: subCategories,
        popularProducts: popularProducts,
        discountProducts: popularProducts,
      );

      emit(HomeLoaded(homeResponse: homeResponse));
    } catch (e) {
      emit(HomeLoadFailure(e.toString()));
    }
  }
}

class HomeResponse {
  final List<BannerModel> banners;
  final List<CategoryModel> categories;
  final List<SubCategoryModel> subCategories;
  final List<ProductModel> popularProducts;
  final List<ProductModel> discountProducts;

  HomeResponse({
    required this.banners,
    required this.categories,
    required this.subCategories,
    required this.popularProducts,
    required this.discountProducts,
  });
}
