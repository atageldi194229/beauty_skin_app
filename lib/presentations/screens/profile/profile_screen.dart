import 'package:beauty_skin/configs/config.dart';
import 'package:beauty_skin/constants/constants.dart';
import 'package:beauty_skin/presentations/common_blocs/language/language_bloc.dart';
import 'package:beauty_skin/utils/language.dart';
import 'package:beauty_skin/localization/translate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Translate.of(context).translate("profile"))),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(kdefaultPadding * 2),
            child: _buildForm(context),
          ),
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Form(
      child: Column(
        children: [
          _buildPhoneInput(),
          const SizedBox(height: kdefaultPadding),
          _buildUsernameInput(),
          const SizedBox(height: kdefaultPadding * 3),
          _buildLanguageDropdown(context),
          const SizedBox(height: kdefaultPadding * 3),
          _buildFormButton(
            context,
            name: "delivery_addresses",
            onTap: () {},
            iconData: IconlyBold.location,
          ),
          const SizedBox(height: kdefaultPadding * 3),
          _buildFormButton(
            context,
            name: "order_history",
            onTap: () {},
            iconData: Icons.history,
          ),
          const SizedBox(height: kdefaultPadding * 3),
          _buildFormButton(
            context,
            name: "about_us",
            onTap: () {
              AppRouter()
                  .navigatorKey
                  .currentState
                  ?.pushNamed(AppRouter.ABOUT_US);
            },
            iconData: Icons.info_outline,
          ),
          const SizedBox(height: kdefaultPadding * 3),
          _buildSaveButton(),
        ],
      ),
    );
  }

  Widget _buildSaveButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: kdefaultPadding * 2,
          horizontal: kdefaultPadding * 3,
        ),
      ),
      onPressed: () {},
      child: const Text("save"),
    );
  }

  Widget _buildPhoneInput() {
    return TextFormField(
      controller: phoneController,
      maxLength: 8,
      keyboardType: TextInputType.phone,
      decoration: const InputDecoration(
        labelText: "phone_number",
        prefix: Text("+993 "),
        prefixIcon: Icon(IconlyBold.call),
      ),
    );
  }

  Widget _buildUsernameInput() {
    return TextFormField(
      controller: usernameController,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        labelText: "username",
        prefixIcon: Icon(IconlyBold.profile),
      ),
    );
  }

  Widget _buildFormButton(
    BuildContext context, {
    VoidCallback? onTap,
    required String name,
    IconData? iconData,
  }) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.symmetric(
          horizontal: kdefaultPadding,
          vertical: kdefaultPadding * 1.5,
        ),
        decoration: BoxDecoration(
          borderRadius: kBorderRadius5,
          border: Border.all(width: 1, color: Colors.grey),
        ),
        child: Row(
          children: [
            Icon(iconData, color: Colors.grey),
            const SizedBox(width: kdefaultPadding),
            Text(name),
            const Spacer(),
            const Icon(Icons.navigate_next_outlined, color: Colors.grey),
            const SizedBox(width: kdefaultPadding),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageDropdown(BuildContext context) {
    return DropdownButtonFormField(
      isDense: true,
      value: Translate.of(context).locale,
      focusColor: Colors.transparent,
      decoration: const InputDecoration(
        labelText: "language",
        prefixIcon: Icon(Icons.language_outlined),
      ),
      items: AppLanguage.supportLanguage.map<DropdownMenuItem<Locale>>((e) {
        return DropdownMenuItem(
          value: e,
          child: Text(UtilLanguage.getLanguageName(e.languageCode)),
        );
      }).toList(),
      onChanged: (selectedLanguage) {
        if (selectedLanguage == null) return;

        BlocProvider.of<LanguageBloc>(context)
            .add(LanguageChanged(selectedLanguage));
      },
    );
  }
}
