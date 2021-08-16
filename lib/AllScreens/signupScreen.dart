import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:music_app/AllScreens/loginScreen.dart';
import 'package:music_app/AllWidgets/progressDialog.dart';
import 'package:music_app/main.dart';

import 'mainscreen.dart';

class SignupScreen extends StatelessWidget
{
  static const String idScreen= "signup";

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController nameTextEditingController = TextEditingController();

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
                "SIGN UP",
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
                        controller: nameTextEditingController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelText: "Name",
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
                            "SIGN UP",
                            style: TextStyle(color: Colors.white, fontSize: 12.0, fontFamily: "Brand Bold"),
                          ),
                        ),
                      ),

                      onPressed: ()
                      {

                        if(nameTextEditingController.text.length < 4)
                        {
                          displayToastMessage("Name must be at least 3 Characters", context);
                        }
                        else if(!emailTextEditingController.text.contains(RegExp("[a-z0-9!#%&'*+/=?^_`{|}~.-]+@[a-z0-9-]+(\.[a-z0-9-]+)*")))
                        {
                          displayToastMessage("Email address is not Valid", context);
                        }
                        else if(passwordTextEditingController.text.length < 7)
                        {
                          displayToastMessage("Password must be at least 7 characters", context);
                        }
                        else
                        {
                          registerNewUser(context);
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

                    SizedBox(height: 10.0,),

                    TextButton(onPressed: (){
                      Navigator.pushNamedAndRemoveUntil(context, LoginScreen.idScreen, (route) => false);
                    },
                      style: TextButton.styleFrom(
                        shadowColor: Colors.black,
                        primary: Colors.red,
                        textStyle: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Already, Have an Account? Sign In."
                          ,),
                      )
                      ,)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void registerNewUser(BuildContext context) async
  {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context)
        {
          return ProgressDialog(message: "Registering, Please wait...",);
        }
    );

    final User firebaseUser = (await _firebaseAuth.createUserWithEmailAndPassword(
    email: emailTextEditingController.text,
    password: passwordTextEditingController.text
    ).catchError((errMsg){
      Navigator.pop(context);
      //display message in SnackBar with white background
      displayToastMessage("Error : " + errMsg.toString(), context);
    })).user;

  if(firebaseUser != null) //user created
    {
    //save user info to database
    Map userDataMap = {
    "name": nameTextEditingController.text.trim(),
    "email": emailTextEditingController.text.trim(),
    };

    usersRef.child(firebaseUser.uid).set(userDataMap);
    displayToastMessage("Congratulations, your account has been created", context);
    //mainscreen is home screen
    Navigator.pushNamedAndRemoveUntil(context, MainScreen.idScreen, (route) => false);
    }
    else
    {
    Navigator.pop(context);
    //error occured - display error message
    //display message in SnackBar with white background
    displayToastMessage("New user account has not been created", context);
    }
  }
}

displayToastMessage(String message, BuildContext context)
{
  Fluttertoast.showToast(msg: message);
}
