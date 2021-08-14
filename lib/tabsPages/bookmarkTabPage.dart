import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:music_app/AllScreens/loginScreen.dart';

class BookmarkTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              "Your Name",
              style: TextStyle(
                fontSize: 55.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Brand-Regular',
              ),
            ),

            Text(
              "Hello" + " User",
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.blueGrey[200],
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Brand-Regular'
              ),
            ),

            SizedBox(
              height: 20,
              width: 200,
              child: Divider(
                color: Colors.white,
              ),
            ),

            SizedBox(height: 40.0,),

            InfoCard(
              text: "98210 xxxxx",
              icon: Icons.phone,
              onPressed: () async {
                print("this is phone.");
              },
            ),

            InfoCard(
              text: "youremail@gmail.com",
              icon: Icons.email,
              onPressed: () async {
                print("this is email.");
              },
            ),

            InfoCard(
              //text: driversInformation.car_color + " " + driversInformation.car_model + " " + driversInformation.car_number,
              text: "your" + "favourite" + "playlist",
              icon: Icons.music_note,
              onPressed: () async {
                print("this is car info.");
              },
            ),

            GestureDetector(
              onTap: ()
              {
                FirebaseAuth.instance.signOut();
                Navigator.pushNamedAndRemoveUntil(context, LoginScreen.idScreen, (route) => false);
              },
              child: Card(
                color: Colors.red,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 110.0),
                child: ListTile(
                  trailing: Icon(
                    Icons.follow_the_signs_outlined,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Sign out",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontFamily: 'Brand Bold',
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget
{
  final String text;
  final IconData icon;
  Function onPressed;

  InfoCard({this.text, this.icon, this.onPressed,});

  @override
  Widget build(BuildContext context)
  {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
        child: ListTile(
          leading: Icon(
            icon,
            color: Colors.black87,
          ),
          title: Text(
            text,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 16.0,
              fontFamily: 'Brand Bold',
            ),
          ),
        ),
      ),
    );
  }
}