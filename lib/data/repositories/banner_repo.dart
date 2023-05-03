import 'package:beauty_skin/data/api/banner_api.dart';
import 'package:beauty_skin/data/models/banner_model.dart';

class BannerRepository {
  // Get all banners
  Future<List<BannerModel>> fetchBanners() async {
    final apiLoader = BannerApi.getAll();

    final data = await apiLoader.load();

    return (data as Iterable)
        .map<BannerModel>((e) => BannerModel.fromMap(e))
        .toList();
  }

  // Get all banners 2
  Future<List<BannerModel>> fetchBanners2() async {
    final apiLoader = BannerApi.getAll2();

    final response = await apiLoader.load();

    return (response.data["rows"] as Iterable)
        .map<BannerModel>((e) => BannerModel.fromMap(e))
        .toList();
  }

  ///Singleton factory
  static final BannerRepository _instance = BannerRepository._internal();
  factory BannerRepository() => _instance;
  BannerRepository._internal();
}
