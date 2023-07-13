import 'package:beauty_skin/constants/constants.dart';
import 'package:beauty_skin/data/models/delivery_address_model.dart';
import 'package:beauty_skin/localization/translate.dart';
import 'package:beauty_skin/presentations/common_blocs/profile/profile_bloc.dart';
import 'package:beauty_skin/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeliveryAddressModelBottomSheet extends StatefulWidget {
  final DeliveryAddressModel? deliveryAddress;

  const DeliveryAddressModelBottomSheet({Key? key, this.deliveryAddress}) : super(key: key);

  @override
  State<DeliveryAddressModelBottomSheet> createState() => _DeliveryAddressModelBottomSheetState();
}

class _DeliveryAddressModelBottomSheetState extends State<DeliveryAddressModelBottomSheet> {
  // [deliveryAddress] is null, that means addresses is empty
  // So name is default
  DeliveryAddressModel? get deliveryAddress => widget.deliveryAddress;

  // local states
  TextEditingController nameController = TextEditingController();
  TextEditingController detailAddressController = TextEditingController();

  bool get isPopulated => nameController.text.isNotEmpty && detailAddressController.text.isNotEmpty;

  @override
  void initState() {
    super.initState();

    var profileState = BlocProvider.of<ProfileBloc>(context).state;

    if (deliveryAddress != null) {
      nameController.text = deliveryAddress!.name;
      detailAddressController.text = deliveryAddress!.address;
    } else if (profileState is ProfileLoaded) {
      nameController.text = profileState.username ?? "";
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    detailAddressController.dispose();
    super.dispose();
  }

  void onSubmitAddress() {
    if (isPopulated) {
      // Create new delivery address
      var newAddress = DeliveryAddressModel(
        name: nameController.text,
        address: detailAddressController.text,
      );

      // Define method submit
      var method = deliveryAddress == null ? ListMethod.add : ListMethod.update;

      if (method == ListMethod.update) {
        newAddress = newAddress.copyWith(uuid: deliveryAddress!.uuid);
      }

      // Call delivery address event
      BlocProvider.of<ProfileBloc>(context).add(AddressListChanged(
        deliveryAddress: newAddress,
        method: method,
      ));

      Navigator.pop(context);
    } else {
      UtilDialog.showInformation(
        context,
        content: "you_need_to_complete_all_fields".tr(context),
      );
    }
  }

  void onRemoveAddress() {
    if (deliveryAddress != null) {
      BlocProvider.of<ProfileBloc>(context).add(AddressListChanged(
        deliveryAddress: deliveryAddress!,
        method: ListMethod.delete,
      ));
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding * 2).copyWith(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(height: kDefaultPadding),
            _buildInput(),
            const SizedBox(height: kDefaultPadding * 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _buildDeleteButton(),
                const SizedBox(width: kDefaultPadding * 2),
                _buildSubmitButton(),
                const SizedBox(width: kDefaultPadding * 2),
              ],
            ),
            const SizedBox(height: kDefaultPadding * 2),
          ],
        ),
      ),
    );
  }

  _buildInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 2),
      child: Column(
        children: [
          // Name input
          TextFormField(
            controller: nameController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: "name".tr(context),
            ),
          ),

          const SizedBox(height: kDefaultPadding * 2),

          // detail address
          TextFormField(
            controller: detailAddressController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: "detail_address".tr(context),
            ),
            maxLines: null,
          ),
        ],
      ),
    );
  }

  _buildSubmitButton() {
    return ElevatedButton(
      onPressed: onSubmitAddress,
      style: ElevatedButton.styleFrom(
        backgroundColor: COLOR_CONST.primaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Text(
          "confirm".tr(context),
          style: FONT_CONST.BOLD_WHITE_18,
        ),
      ),
    );
  }

  _buildDeleteButton() {
    return ElevatedButton(
      onPressed: onRemoveAddress,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Text(
          "delete".tr(context),
          style: FONT_CONST.BOLD_WHITE_18.copyWith(color: Colors.red),
        ),
      ),
    );
  }
}
