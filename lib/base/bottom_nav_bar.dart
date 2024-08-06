import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:ticket_app/screens/home_screen.dart';
import 'package:ticket_app/screens/settings_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  //list is iterate using index
  final appScreens = [
    const HomeScreen(),
    const Center(child: Text("Search")),
    const Center(child: Text("Tickets")),
    const Center(child: Text("Profile"))
  ];

  //change our index for bottom navbar
  int _selectedIndex=0;

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex=index;
      if (index == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SettingsPage()),
        );
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      selectedItemColor: Colors.blueGrey,
      unselectedItemColor: const Color(0xFF526400),
      showSelectedLabels: false,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons.ic_fluent_home_add_regular),
            activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
            label: "Home"),
        /*BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons.ic_fluent_search_regular),
            activeIcon: Icon(FluentSystemIcons.ic_fluent_search_filled),
            label: "Search"),*/
        BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons.ic_fluent_settings_regular),
            activeIcon: Icon(FluentSystemIcons.ic_fluent_settings_filled),
            label: "Settings"),
        /*BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
            activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),
            label: "Profile"),*/
      ],
    );
  }
}