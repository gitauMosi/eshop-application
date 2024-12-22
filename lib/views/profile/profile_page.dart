import 'package:eshop/views/profile/edit_profile_page.dart';
import 'package:eshop/views/profile/payment_details.dart';
import 'package:eshop/views/profile/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => EditProfilePage());
              },
              icon: const Icon(Icons.edit_outlined))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    "https://www.shutterstock.com/image-photo/head-shot-portrait-close-smiling-600nw-1714666150.jpg"),
              ),
              const Text(
                "John doe",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const Text("@doe"),
              const Text("info@gmail.com"),
              const SizedBox(
                height: 20,
              ),
              customListTile(
                  context, "Track Order", Icons.delivery_dining, () {}),
              customListTile(
                  context, "Payment", Icons.account_balance_wallet_outlined,
                  () {
                Get.to(() => const PaymentPage());
              }),
              customListTile(context, "Refer A Friend", Icons.people, () {}),
              customListTile(context, "Promotions", Icons.local_offer, () {}),
              customListTile(context, "Settings", Icons.settings, () {
                 Get.to(() => AppSettingsPage());
              }),
              customListTile(context, "Log Out", Icons.logout, () {}),
            ],
          ),
        ),
      ),
    );
  }

  ListTile customListTile(
      BuildContext context, String name, IconData icon, Function() function) {
    return ListTile(
      leading: CircleAvatar(
         backgroundColor: Colors.blueGrey[50],
        child: Icon(
          icon,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      title: Text(name),
      onTap: function,
    );
  }
}
