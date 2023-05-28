import 'package:beauty_skin/data/api/home_client.dart';
import 'package:beauty_skin/data/models/home_response_model.dart';

class HomeRepository {
  // Get all banners
  Future<HomeResponseModel> fetchStructure() async {
    final response = await HomeApi.fetchHomeStructure();
    return HomeResponseModel.fromMap(response.data["data"][0]);
  }

  ///Singleton factory
  static final HomeRepository _instance = HomeRepository._internal();
  factory HomeRepository() => _instance;
  HomeRepository._internal();
}
