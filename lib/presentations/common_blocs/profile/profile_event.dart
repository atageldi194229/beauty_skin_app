part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

/// Load profile from storage
class LoadProfile extends ProfileEvent {}

/// Delivery addresses changed
class AddressListChanged extends ProfileEvent {
  final DeliveryAddressModel deliveryAddress;
  final ListMethod method;

  const AddressListChanged(
      {required this.deliveryAddress, required this.method});

  @override
  List<Object> get props => [deliveryAddress, method];
}

/// Profile was updated
class ProfileUpdated extends ProfileEvent {
  final String phoneNumber;
  final String username;

  const ProfileUpdated(this.phoneNumber, this.username);

  @override
  List<Object> get props => [phoneNumber, username];
}
