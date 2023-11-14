import 'package:beauty_skin/data/api/brand_api.dart';
import 'package:beauty_skin/data/models/brand/brand_model.dart';

class BrandRepository {
  // Get all brands
  Future<List<BrandModel>> fetchBrands() async {
    final response = await BrandApi.getAll();

    return (response.data["data"] as Iterable)
        .map<BrandModel>((e) => BrandModel.fromMap(e))
        .toList();
  }

  ///Singleton factory
  static final BrandRepository _instance = BrandRepository._internal();
  factory BrandRepository() => _instance;
  BrandRepository._internal();
}
