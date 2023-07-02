import 'package:flutter/material.dart';
import 'package:phsps_api_work/presentation/settings/settings_view.dart';
import 'package:side_navigation/side_navigation.dart';

import '../settings/settings_controller.dart';
import 'content/home/users.dart';

class DrawerWidget extends StatefulWidget {
  static const String routeName = '/drawer.screen';
  const DrawerWidget({super.key, required this.controller});
  final SettingsController controller;

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> views = [
      const Users(),
      const Center(
        child: Text('Account'),
      ),
      SettingsView(controller: widget.controller)
    ];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Row(
        children: [
          /// Pretty similar to the BottomNavigationBar!
          SideNavigationBar(
            toggler: const SideBarToggler(
              shrinkIcon: Icons.arrow_right_rounded,
              expandIcon: Icons.arrow_left_rounded,
            ),
            initiallyExpanded: false,
            selectedIndex: selectedIndex,
            header: const SideNavigationBarHeader(
                image: Icon(Icons.admin_panel_settings_rounded),
                title: Text('PHSPS DATABASE'),
                subtitle: Text('phsps admin platform')),
            items: const [
              SideNavigationBarItem(
                icon: Icons.people_alt_rounded,
                label: 'All Customers',
              ),
              SideNavigationBarItem(
                icon: Icons.person,
                label: 'Account',
              ),
              SideNavigationBarItem(
                icon: Icons.settings,
                label: 'Settings',
              ),
            ],
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),

          /// Make it take the rest of the available width
          Expanded(
            child: views.elementAt(selectedIndex),
          )
        ],
      ),
    );
  }
}
