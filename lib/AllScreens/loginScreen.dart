import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:music_app/AllScreens/signupScreen.dart';
import 'package:music_app/AllWidgets/progressDialog.dart';

import '../main.dart';
import 'mainscreen.dart';

class LoginScreen extends StatelessWidget
{
  static const String idScreen= "login";

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SizedBox(height: 250.0,),
              Text(
                "LOGIN",
                style: TextStyle(color: Colors.white,fontSize: 30.0, fontFamily: "Brand Bold",fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 50.0),

              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Container(
                      child: TextField(
                        controller: emailTextEditingController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelText: "Email",
                          labelStyle: TextStyle(
                            fontSize: 14.0,
                          ),
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 10.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(1),
                          ),
                        ),
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ),
                    SizedBox(height: 20.0,),

                    TextField(

                      controller: passwordTextEditingController,
                      obscureText: true,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        labelText: "Password",
                        labelStyle: TextStyle(
                          fontSize: 14.0,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 10.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1),
                        ),
                      ),
                      style: TextStyle(fontSize: 14.0),
                    ),
                    SizedBox(height: 25.0,),

                    ElevatedButton(
                      child: Container(
                        height: 60.0,
                        child: Center(
                          child: Text(
                            "LOGIN",
                            style: TextStyle(color: Colors.white, fontSize: 12.0, fontFamily: "Brand Bold"),
                          ),
                        ),
                      ),

                      onPressed: ()
                      {
                        if(!emailTextEditingController.text.contains("@"))
                        {
                          displayToastMessage("Email address is not Valid", context);
                        }
                        else if(passwordTextEditingController.text.isEmpty)
                        {
                          displayToastMessage("Password is mandatory", context);
                        }
                        else
                        {
                          loginAndAuthenticateUser(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.red,
                        primary: Colors.red,
                        onPrimary: Colors.white,
                        textStyle: TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                    ),

                  ],
                ),
              ),

              SizedBox(height: 15.0),

              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamedAndRemoveUntil(context, SignupScreen.idScreen, (route) => false);
                },
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.black,
                  primary: Colors.black,
                  onPrimary: Colors.red,
                  textStyle: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
                  child: Text(
                    "Don't, Have an Account? SignUp here.",
                  ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void loginAndAuthenticateUser(BuildContext context) async
  {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context)
        {
          return ProgressDialog(message: "Authenticating, Please wait...",);
        }
    );

    final User firebaseUser = (await _firebaseAuth
        .signInWithEmailAndPassword(
        email: emailTextEditingController.text,
        password: passwordTextEditingController.text
    ).catchError((errMsg){
      Navigator.pop(context);
      displayToastMessage("Error : " + errMsg.toString(), context);
    })).user;

    if(firebaseUser != null) //user created
        {
      usersRef.child(firebaseUser.uid).once().then((DataSnapshot snap){
        if(snap.value != null)
        {
          Navigator.pushNamedAndRemoveUntil(context, MainScreen.idScreen, (route) => false);
          displayToastMessage("You are logged-in now.", context);
        }
        else
        {
          Navigator.pop(context);
          _firebaseAuth.signOut();
          displayToastMessage("No records exist for this user. Please create a new account", context);
        }
      });
    }
    else
    {
      Navigator.pop(context);
      //error occured - display error message
      displayToastMessage("Error Occured, can not be signed in", context);
    }
  }

}
