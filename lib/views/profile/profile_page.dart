import 'package:flutter/material.dart';

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
          IconButton(onPressed: () {}, icon: const Icon(Icons.edit_outlined))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CircleAvatar(
                radius: 50,
              ),
              const Text(
                "name",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const Text("@Username"),
              const Text("info@gmail.com"),
              const SizedBox(
                height: 20,
              ),
              customListTile(
                  context, "Your Favourites", Icons.favorite_outline, () {}),
              customListTile(context, "Payment",
                  Icons.account_balance_wallet_outlined, () {}),
              customListTile(context, "Refer A Friend", Icons.people, () {}),
              customListTile(context, "Promotions", Icons.local_offer, () {}),
              customListTile(context, "Settings", Icons.settings, () {}),
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
      leading: Icon(
        icon,
        color: Theme.of(context).colorScheme.primary,
      ),
      title: Text(name),
      onTap: function,
    );
  }
}
