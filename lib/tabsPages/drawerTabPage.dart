import 'package:flutter/material.dart';

class DrawerTabPage extends StatelessWidget
{
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      key: scaffoldKey,
      drawer: Container(
        color: Colors.white,
        width: 255.0,

        child: Drawer(
          child: ListView(
            children: [
              Container(
                height: 165.0,
                child: DrawerHeader(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Row(
                    children: [
                      Image.asset("images/taxi.png",height: 65.0, width: 65.0,),
                      SizedBox(width: 16.0,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Profile Name",style: TextStyle(fontSize: 16.0, fontFamily: "Brand-Bold"),),
                          SizedBox(height: 6.0,),
                          Text("Visit Profile"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              Divider(),

              SizedBox(height: 12.0,),

              //drawerbody
              ListTile(
                leading: Icon(Icons.history),
                title: Text("History", style: TextStyle(fontSize: 15.0),),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Visit Profile", style: TextStyle(fontSize: 15.0),),
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text("About", style: TextStyle(fontSize: 15.0),),
              ),

            ],
          ),
        ),
      ),

      body: Stack(

        children:[
        Positioned(
          top: 65.0,
          right: 25.0,
          child: GestureDetector(
            onTap: ()
            {
              scaffoldKey.currentState.openDrawer();
            },
            child: Container(

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22.0),
                boxShadow: [ BoxShadow(
                  color: Colors.white,
                  blurRadius: 6.0,
                  spreadRadius: 0.5,
                  offset: Offset(
                    0.7,
                    0.7,
                  ),
                ),
                ],
              ),

              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.menu, color: Colors.black,),
                radius: 20.0,
              ),
              //  Text("This is Drawer Tabs Page",textAlign: TextAlign.center,),
            ),

          ),
        ),
      ]

      ),

      //Hamburder icon for drawer



    );
  }
}