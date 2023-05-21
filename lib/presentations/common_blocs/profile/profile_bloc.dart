import 'dart:async';

import 'package:beauty_skin/data/models/delivery_address_model.dart';
import 'package:beauty_skin/data/repositories/profile_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final _profileRepo = ProfileRepository();

  ProfileBloc() : super(ProfileLoading()) {
    on<LoadProfile>(_mapLoadProfileToState);
    on<AddressListChanged>(_mapAddressListChangedToState);
    on<ProfileUpdated>(_mapProfileUpdatedToState);
  }

  FutureOr<void> _mapLoadProfileToState(
    LoadProfile event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      final phoneNumber = _profileRepo.getPhoneNumber();
      final username = _profileRepo.getUsername();
      final language = _profileRepo.getLanguage();

      final deliveryAddresses = await _profileRepo.fetchAdresses();

      emit(ProfileLoaded(
        deliveryAddresses: deliveryAddresses,
        phoneNumber: phoneNumber,
        username: username,
        language: language,
      ));
    } catch (e) {
      emit(ProfileLoadFailure(e.toString()));
    }
  }

  FutureOr<void> _mapAddressListChangedToState(
    AddressListChanged event,
    Emitter<ProfileState> emit,
  ) async {
    var deliveryAddress = event.deliveryAddress;

    switch (event.method) {
      case ListMethod.add:
        await _profileRepo.addDeliveryAddress(deliveryAddress);
        break;
      case ListMethod.delete:
        await _profileRepo.removeDeliveryAddress(deliveryAddress);
        break;
      case ListMethod.update:
        await _profileRepo.updateDeliveryAddress(deliveryAddress);
        break;
      default:
    }

    add(LoadProfile());
  }

  FutureOr<void> _mapProfileUpdatedToState(
    ProfileUpdated event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      await _profileRepo.updateProfile(
        phoneNumber: event.phoneNumber,
        username: event.username,
      );

      add(LoadProfile());
    } catch (e) {
      emit(ProfileLoadFailure(e.toString()));
    }
  }
}

enum ListMethod { add, delete, update }
