import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:livvy_app/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  List<Widget> tabItems = [
    const HomeScreen(),
    const Center(child: Text("1")),
    const Center(child: Text("2")),
    const Center(child: Text("3")),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabItems[_selectedIndex],
      bottomNavigationBar: FlashyTabBar(
        selectedIndex: _selectedIndex,
        showElevation: true,
        backgroundColor: Colors.white,
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
        }),
        items: [
          FlashyTabBarItem(
            icon: const Icon(UniconsLine.estate, size: 30),
            title: Text('Beranda',
                style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontSize: 18)),
            activeColor: Theme.of(context).colorScheme.secondary,
          ),
          FlashyTabBarItem(
            icon: const Icon(UniconsLine.tag_alt, size: 30),
            title: Text('Properti',
                style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontSize: 18)),
            activeColor: Theme.of(context).colorScheme.secondary,
          ),
          FlashyTabBarItem(
            icon: const Icon(UniconsLine.user_circle, size: 30),
            title: Text('Profil',
                style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontSize: 18)),
            activeColor: Theme.of(context).colorScheme.secondary,
          ),
        ],
      ),
    );
  }
}
