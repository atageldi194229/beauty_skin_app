import 'package:flutter/material.dart';
import 'package:beauty_skin/constants/constants.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: COLOR_CONST.backgroundColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(kdefaultPadding * 2),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      appLogo,
                      height: 80.0,
                      width: 80.0,
                    ),
                    const SizedBox(width: kdefaultPadding * 2),
                    const Text(
                      "Sapaly Mahabat",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: kdefaultPadding * 4),
                Row(
                  children: [
                    Image.asset(
                      assetUser,
                      width: 40.0,
                      height: 40.0,
                    ),
                    const SizedBox(width: kdefaultPadding),
                    const Text(
                      'Garynja Yorunjayev',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Image.asset(
                      assetLocale,
                      width: 20.0,
                      height: 20.0,
                    ),
                    const SizedBox(width: kdefaultPadding),
                    const Text(
                      'En',
                      // style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildMenuButton(asset: assetHome, name: "Home"),
                _buildMenuButton(asset: assetCategories, name: "Categories"),
                _buildMenuButton(asset: assetAboutUs, name: "About us"),
                _buildMenuButton(asset: assetSales, name: "Sales"),
                _buildMenuButton(asset: assetNewArrival, name: "New arrival"),
                _buildMenuButton(asset: assetShops, name: "Shops"),
                _buildMenuButton(asset: assetContacts, name: "Contacts"),
              ],
            ),
          ),
          _buildMenuButton(
            asset: assetPhone,
            name: "+993 63 508564",
            assetSize: 24,
          ),
          _buildMenuButton(
            asset: assetPhone,
            name: "+993 12 973168",
            assetSize: 24,
          ),
        ],
      ),
    );
  }

  Widget _buildMenuButton({
    required String asset,
    required String name,
    VoidCallback? onTap,
    double assetSize = 32,
  }) {
    return ListTile(
      onTap: onTap,
      minVerticalPadding: kdefaultPadding,
      title: Text(
        name,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      leading: Image.asset(
        asset,
        width: assetSize,
        height: assetSize,
      ),
    );
  }
}
