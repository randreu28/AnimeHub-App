import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:p1_coronado/screens/discover_screen.dart';
import 'package:p1_coronado/screens/my_list_screen/favorites_tab.dart';
import 'package:p1_coronado/screens/my_list_screen/completed_tab.dart';
import 'package:p1_coronado/screens/my_list_screen/watching_tab.dart';
import 'package:p1_coronado/screens/profile_screen.dart';
import 'package:p1_coronado/widgets/auth_gate.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const AuthGate(
    app: ProviderScope(child: MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const NavBar(),
    );
  }
}

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    ProfileScreen(),
    DiscoverScreen(),
    TabBarView(
      children: [
        WatchingTab(),
        CompletedTab(),
        FavoritesTab(),
      ],
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My anime list'),
          bottom: _selectedIndex == 2
              ? const TabBar(
                  tabs: [
                    Tab(
                      text: "Watching",
                    ),
                    Tab(text: "Completed"),
                    Tab(text: "Favorites"),
                  ],
                )
              : null,
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Discover',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'My list',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blueAccent[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
