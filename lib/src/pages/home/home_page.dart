import 'package:flutter/material.dart';
import 'package:flutter_demo/src/pages/home/screens/posts/posts_screen.dart';
import 'package:flutter_demo/src/theme/colors.dart';

import 'drawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  static const routeName = '/';
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  /// _selectedIndex is used by the bottom navigation
  /// to show which index was selected
  int _selectedIndex = 0;

  /// when a button is pressed on the bottom navigation bar, this will be called
  void _onItemTapped(int index) {
    // setState tells the application to redraw items because something changed
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called

    return Scaffold(
      key: _scaffoldKey,
      endDrawer: getHomeRightDrawer(context),
      // setup the AppBar for Home Page
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: Padding(
          padding: const EdgeInsets.only(bottom: 0, top: 0, left: 15, right: 0),
          child: Center(
            child: Image.asset(
              'assets/images/double_circle.png',
              fit: BoxFit.cover,
              height: 35,
              width: 35,
            ),
          ),
        ),
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            color: AppColors.iconColor,
            icon: const Icon(Icons.notifications_active_outlined),
            tooltip: 'Alert',
            onPressed: () {},
          ),
          IconButton(
            color: AppColors.iconColor,
            icon: Stack(
              children: <Widget>[
                Container(
                    padding: const EdgeInsets.only(top: 2, right: 4),
                    child: const Icon(Icons.messenger_outline_rounded)),
                Positioned(
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: AppColors.accent,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 14,
                      minHeight: 14,
                    ),
                    child: const Text(
                      '1',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
            tooltip: 'Message',
            onPressed: () {},
          ),
          IconButton(
            color: AppColors.iconColor,
            icon: const Icon(Icons.menu),
            tooltip: 'Menu',
            onPressed: () {
              _scaffoldKey.currentState!.openEndDrawer();
            },
          ),
        ],
      ),
      body: Container(
        decoration: (Theme.of(context).brightness == Brightness.dark)
            ? const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: FractionalOffset.centerRight,
                  colors: [AppColors.primary, AppColors.gradientLight],
                  stops: [0, 1],
                ),
              )
            : null,
        child: Center(
          //child: _widgetOptions.elementAt(_selectedIndex),
          child: getPostsScreen(context),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: AppColors.accent,
        unselectedItemColor: AppColors.iconColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            //backgroundColor: Theme.of(context).colorScheme.primary,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
            //backgroundColor: Theme.of(context).colorScheme.primary,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
            //backgroundColor: Theme.of(context).colorScheme.primary,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'Info',
            //backgroundColor: Theme.of(context).colorScheme.primary,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_outlined),
            label: 'Profile',
            //backgroundColor: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }
}
