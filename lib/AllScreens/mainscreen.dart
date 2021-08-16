import 'package:flutter/material.dart';
import 'package:music_app/tabsPages/bookmarkTabPage.dart';
import 'package:music_app/tabsPages/drawerTabPage.dart';
import 'package:music_app/tabsPages/homeTabPage.dart';
import 'package:music_app/tabsPages/ratingTabPage.dart';

class MainScreen extends StatefulWidget
{

  static const String idScreen = "mainScreen";


  @override
  _MainScreenState createState() => _MainScreenState();

}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin
{

  TabController tabController;
  int selectedIndex = 0;

  void onItemClicked(int index)
  {
    setState(() {
      selectedIndex = index;
      tabController.index = selectedIndex;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: tabController,
        children: [
          HomeTabPage(),
          RatingTabPage(),
          BookmarkTabPage(),
          DrawerTabPage(),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        showSelectedLabels: false,

        items: <BottomNavigationBarItem>[

          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 33.0,),
            label: "something",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star,size: 33.0,),
            label: "Ratings",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark, size: 33.0,),
            label: "Bookmarks",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.menu, size: 33.0,),
            label: "Drawer",
          ),
        ],


        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.red,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(fontSize: 11.0),
        showUnselectedLabels: false,
        currentIndex: selectedIndex,
        onTap: onItemClicked,

      ),
    );
  }
}


    