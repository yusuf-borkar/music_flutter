import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:music_app/tabsPages/musicTabPage.dart';
import 'package:music_app/tabsPages/showTabPage.dart';
import 'package:music_app/tabsPages/songsTabPage.dart';

//new
class HomeTabPage extends StatefulWidget
{
  /*
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 8),
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              child: Row(
                children: <Widget>[

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  */
  @override
  _State createState() => _State();
}

class _State extends State<HomeTabPage>
{


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      //const EdgeInsets.fromLTRB(25,75,25,7),
      //const EdgeInsets.only(left: 16, right: 16),

      child: MaterialApp(
        title: "Movies App",
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              //flexibleSpace: Text("Hello"),

              bottom: TabBar(
                isScrollable: true,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.red,
                ),
                unselectedLabelColor: Colors.grey,
                tabs: [
                Tab(text: "    Movies    ",),
                Tab(text: "    Shows    ",),
                Tab(text: "    Music    ",),
              ],
              ),
              /*
              leading: CircleAvatar(
                radius: 100,
                child: Image.asset("images/user_icon.png"),

              ),
              title: Text("Chelsie Brett"),
              */
              title: new Text("Chelsie Brett", textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Open Sans', fontWeight: FontWeight.bold)),
              leading: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Image.asset(
                    "images/user_icon.png",
                    scale: 7.0,
                  ),
              ),


              //centerTitle: false,
              //titleSpacing: 15,

              actions: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.5),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  margin: EdgeInsets.all(5),
                  child: Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(top: 0.0),
                        child: IconButton(onPressed:(){},icon: Icon(
                        Icons.search,size: 25,color: Colors.grey,)),
                      ),
                    ],
                  ),
                ),
              ],

              /*actions: <Widget>[
                IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              ],*/
            ),

            body: TabBarView(
              children: [
                SongsTabPage(),
                ShowTabPage(),
                MusicTabPage(),
            ],
            ),
          ),
        ),
        debugShowCheckedModeBanner:false
      ),
    );
  }
}
