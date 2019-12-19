import 'package:flutter/material.dart';
import 'package:flutter_contact_list/screens/home/home.screen.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashPage extends SplashScreen{
  SplashPage():super(
      seconds: 14,
      navigateAfterSeconds: new HomeScreen(),
      title: new Text('Welcome In SplashScreen'),
      image: new Image.asset('assets/splash.png'),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      loaderColor: Colors.red
  );
}