import 'package:beauty_skin/data/api/order_api.dart';
import 'package:beauty_skin/data/boxes.dart';
import 'package:beauty_skin/data/models/order/order.dart';

class OrderRepository {
  Future<OrderResponseModel?> fetchOrder(int orderId) async {
    try {
      final response = await OrderApi.getOne(orderId);
      response.data["order"]["products"] = response.data["products"];
      return OrderResponseModel.fromMap(response.data["order"]);
    } catch (e) {
      await Boxes.getOrders().delete(orderId);
      return null;
    }
  }

  Future<int> createOrder(OrderModel order) async {
    final response = await OrderApi.create(order.toMap());

    final orderId = response.data["order_id"] as int;

    await Boxes.getOrders().put(orderId, orderId);

    return orderId;
  }

  Future<List<OrderResponseModel>> fetchAllOrders() async {
    final orderBox = Boxes.getOrders();

    final orderIds = orderBox.values.toList();

    final result = await Future.wait(orderIds.map((orderId) => fetchOrder(orderId)));

    return result.whereType<OrderResponseModel>().toList();
  }

  ///Singleton factory
  static final OrderRepository _instance = OrderRepository._internal();
  factory OrderRepository() => _instance;
  OrderRepository._internal();
}
