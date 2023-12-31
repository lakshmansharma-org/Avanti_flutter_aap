

import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qsurvey_flutter/network/Utils.dart';
import 'package:qsurvey_flutter/view/dashboard_screen.dart';


import 'package:qsurvey_flutter/view/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget
{
  final String token;
  SplashScreen(this.token);
  SplashState createState()=>SplashState();
}
class SplashState extends State<SplashScreen>
{
  @override
  List<dynamic> surveyDataList = [];
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Container(
            width: 200,
            height: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/qdegrees.png'),
                fit: BoxFit.contain,
              ),
            ),
          )
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    _navigateUser();

  }

  _navigateUser() async {

    bool? loginStatusValue=await MyUtils.getSharedPreferencesBool("loginStatus");
    String? empId = await MyUtils.getSharedPreferences("empId");
    if(loginStatusValue==true)
    {


      SharedPreferences preferences = await SharedPreferences.getInstance();
      var data=preferences.getString("question_list");
      List<dynamic> list2 = jsonDecode(data!);
      //var questionList=list2;
      setState(() {

      });
      Timer(
          // Duration(seconds: 2),
          //     () => Navigator.of(context).pushReplacement(MaterialPageRoute(
          //     builder: (BuildContext context) => LoginScreen())));
      Duration(seconds: 2),
          () => Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => DashboardScreen(true,empId!,list2))));

    }
    else
    {
      Timer(
          Duration(seconds: 2),
              () => Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => LoginScreen())));
    }
  }

}
