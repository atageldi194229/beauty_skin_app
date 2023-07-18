import 'package:beauty_skin/data/api/order_api.dart';
import 'package:beauty_skin/data/boxes.dart';
import 'package:beauty_skin/data/models/order/order.dart';

class OrderRepository {
  Future<OrderResponseModel?> fetchOrder(int orderId) async {
    try {
      final response = await OrderApi.getOne(orderId);
      response.data["order"]["products"] = response.data["products"];
      return OrderResponseModel.fromMap(response.data);
    } catch (e) {
      await Boxes.getOrders().delete(orderId);
      return null;
    }
  }

  Future<void> createOrder(OrderModel order) async {
    final response = await OrderApi.create(order.toMap());

    final orderId = response.data["order_id"] as int;

    await Boxes.getOrders().put(orderId, orderId);
  }

  Future<List<OrderResponseModel>> fetchAllOrders() async {
    final orderIds = Boxes.getOrders().values.toList().reversed;

    final result = await Future.wait(orderIds.map((orderId) => fetchOrder(orderId)));

    return result.whereType<OrderResponseModel>().toList();
  }

  ///Singleton factory
  static final OrderRepository _instance = OrderRepository._internal();
  factory OrderRepository() => _instance;
  OrderRepository._internal();
}
