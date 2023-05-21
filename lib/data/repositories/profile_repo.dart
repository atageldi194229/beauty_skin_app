import 'dart:async';

import 'package:beauty_skin/data/boxes.dart';
import 'package:beauty_skin/data/models/delivery_address_model.dart';

class ProfileRepository {
  Future<void> updateProfile({
    String? phoneNumber,
    String? username,
  }) async {
    await Future.wait<void>([
      Boxes.getSettings().put(Setting.phoneNumber.name, phoneNumber),
      Boxes.getSettings().put(Setting.username.name, username),
    ]);
  }

  /// phone number
  String? getPhoneNumber() {
    return Boxes.getSettings().get(Setting.phoneNumber.name);
  }

  /// username
  String? getUsername() {
    return Boxes.getSettings().get(Setting.username.name);
  }

  /// username
  String? getLanguage() {
    return Boxes.getSettings().get(Setting.language.name);
  }

  /// fetch delivery addresses
  Future<List<DeliveryAddressModel>> fetchAdresses() async {
    return Boxes.getDeliveryAddressList().values.toList();
  }

  /// Add item
  /// [deliveryAddress] is data of new delivery address
  Future<void> addDeliveryAddress(DeliveryAddressModel deliveryAddress) async {
    await Boxes.getDeliveryAddressList().add(deliveryAddress);
  }

  /// Remove item
  /// [deliveryAddress] is data of delivery address
  Future<void> removeDeliveryAddress(
      DeliveryAddressModel deliveryAddress) async {
    await deliveryAddress.delete();
  }

  /// Remove item
  /// [deliveryAddress] is data of delivery address
  Future<void> updateDeliveryAddress(
      DeliveryAddressModel deliveryAddress) async {
    final addressBox = Boxes.getDeliveryAddressList();
    for (var key in addressBox.keys) {
      var e = addressBox.get(key);
      if (e != null && e.uuid == deliveryAddress.uuid) {
        await addressBox.put(key, deliveryAddress);
      }
    }
    await deliveryAddress.save();
  }

  /// clear all delivery addresses
  Future<void> clearDeliveryAddresses() async {
    await Boxes.getDeliveryAddressList().clear();
  }

  ///Singleton factory
  static final ProfileRepository _instance = ProfileRepository._internal();
  factory ProfileRepository() => _instance;
  ProfileRepository._internal();
}
