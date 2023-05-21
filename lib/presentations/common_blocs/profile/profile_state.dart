part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final String? phoneNumber;
  final String? username;
  final List<DeliveryAddressModel> deliveryAddresses;
  final String? language;

  const ProfileLoaded({
    this.phoneNumber,
    this.username,
    required this.deliveryAddresses,
    this.language,
  });

  @override
  List<Object?> get props => [
        phoneNumber,
        username,
        deliveryAddresses,
        language,
      ];
}

class ProfileLoadFailure extends ProfileState {
  final String error;

  const ProfileLoadFailure(this.error);

  @override
  List<Object> get props => [error];
}
