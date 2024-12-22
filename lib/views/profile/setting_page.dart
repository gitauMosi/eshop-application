import 'package:eshop/controllers/theme_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AppSettingsPage extends StatelessWidget {
   AppSettingsPage({super.key});

  final ThemeController themeController = Get.find();

  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Settings"),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          SettingsSection(
            title: "GENERAL",
            items: [
              SettingsItem(icon: Icons.notifications, title: "Notifications"),
              SettingsItem(icon: Icons.description, title: "Agreements"),
              SettingsItem(icon: Icons.privacy_tip, title: "Releases from confidentiality"),
              SettingsItem(icon: Icons.lock, title: "Password"),
              SettingsItem(icon: Icons.pin, title: "Pin"),
              SettingsItem(icon: Icons.logout, title: "Logout"),
            ],
          ),
          Obx(()=>SwitchListTile(value: themeController.isDarkMode.value,
          title: Text(themeController.isDarkMode.value ? "Light mode" : "Dark Mode"), onChanged: (value){
            themeController.toggleTheme();
          }),),
          SettingsSection(
            title: "FEEDBACK",
            items: [
              SettingsItem(icon: Icons.feedback, title: "App feedback"),
              SettingsItem(icon: Icons.bug_report, title: "Bug report"),
            ],
          ),
          SettingsSection(
            title: "LEGAL",
            items: [
              SettingsItem(icon: Icons.privacy_tip_outlined, title: "Privacy"),
              SettingsItem(icon: Icons.gavel, title: "Imprint"),
            ],
          ),
        ],
      ),
    );
  }
}

class SettingsSection extends StatelessWidget {
  final String title;
  final List<SettingsItem> items;

  SettingsSection({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[600]),
        ),
        ...items.map((item) => item).toList(),
        SizedBox(height: 16),
      ],
    );
  }
}

class SettingsItem extends StatelessWidget {
  final IconData icon;
  final String title;

  SettingsItem({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blueGrey[50],
        child: Icon(icon, color: Theme.of(context).colorScheme.primary),
      ),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        // Handle navigation or action
      },
    );
  }
}