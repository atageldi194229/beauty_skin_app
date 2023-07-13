import 'package:beauty_skin/data/api/order_api.dart';
import 'package:beauty_skin/data/models/banner_model.dart';
import 'package:beauty_skin/data/models/order_model.dart';

class OrderRepository {
  // Future fetchOrder(int orderId) async {
  //   final response = await OrderApi.getOne(orderId);

  //   // return (response.data["data"] as Iterable)
  //   //     .map<BannerModel>((e) => BannerModel.fromMap(e))
  //   //     .toList();
  // }

  Future createOrder(OrderModel order) async {
    await OrderApi.create(order.toMap());
  }

  ///Singleton factory
  static final OrderRepository _instance = OrderRepository._internal();
  factory OrderRepository() => _instance;
  OrderRepository._internal();
}
