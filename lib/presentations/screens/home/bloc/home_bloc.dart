import 'package:beauty_skin/data/models/banner_model.dart';
import 'package:beauty_skin/data/models/category/category_model.dart';
import 'package:beauty_skin/data/models/category/sub_category_model.dart';
import 'package:beauty_skin/data/models/home_response_model.dart';
import 'package:beauty_skin/data/repositories/banner_repo.dart';
import 'package:beauty_skin/data/repositories/category_repo.dart';
import 'package:beauty_skin/data/repositories/home_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final _bannerRepository = BannerRepository();
  final _categoryRepository = CategoryRepository();
  final _homeRepository = HomeRepository();

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
      late List<BannerModel> banners;
      late List<CategoryModel> categories;
      late List<SubCategoryModel> subCategories;
      late List<int> subCategoryIds;

      await Future.wait([
        _bannerRepository.fetchBanners().then(
              (value) => banners = value,
            ),
        _categoryRepository.fetchCategories().then(
          (r) {
            categories = r.categories;
            subCategories = r.subCategories;
          },
        ),
        _homeRepository
            .fetchStructure()
            .then((value) => subCategoryIds = value.subCategoryIds),
      ]);

      HomeResponse homeResponse = HomeResponse(
        banners: banners,
        categories: categories,
        subCategories: subCategories,
        subCategoryIds: subCategoryIds,
      );

      emit(HomeLoaded(homeResponse: homeResponse));
    } catch (error, stackTrace) {
      emit(HomeLoadFailure(error.toString()));
      addError(error, stackTrace);
    }
  }
}

class HomeResponse {
  final List<BannerModel> banners;
  final List<CategoryModel> categories;
  final List<SubCategoryModel> subCategories;
  final List<int> subCategoryIds;

  HomeResponse({
    required this.banners,
    required this.categories,
    required this.subCategories,
    required this.subCategoryIds,
  });
}
