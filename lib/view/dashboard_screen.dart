import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:qsurvey_flutter/view/feedback_form_screen.dart';
import 'package:qsurvey_flutter/view/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

import '../network/Utils.dart';
import '../network/api_dialog.dart';
import '../network/api_helper.dart';
import '../utils/app_modal.dart';
import '../utils/app_theme.dart';


class DashboardScreen extends StatefulWidget{
  final bool showBack;
  String id = '';
  List<dynamic> surveyDataList = [];
  DashboardScreen(this.showBack,this.id,this.surveyDataList);
  @override
  DashboardState createState()=> DashboardState();
}

class DashboardState extends State<DashboardScreen> {
  @override
  var usernameController = TextEditingController();
  bool isInternetConnected = true;
  int todayCount = 0;
  int totalCount = 0;
  bool isLoading = false;
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Container(
      color: AppTheme.blueColor,
      child: SafeArea(
        child: Scaffold(
          appBar: widget.showBack
              ? AppBar(
            backgroundColor: AppTheme.blueColor,
            title: Text(
              'Dashboard',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white
              ),
            ),
            actions: [
              IconButton(
                icon: Image.asset(
                  'assets/img_logout.png',
                  width: 25,
                  height: 25,
                ),
                onPressed: () =>  showLogOutDialog(context),

              ),
            ],
            centerTitle: true,
          )
              : PreferredSize(
              preferredSize: const Size.fromHeight(0.0),
              child: AppBar()),
          backgroundColor: Colors.white,
          extendBody: true,
          body: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                FeedbackFormScreen(true,widget.surveyDataList)));
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 110,
                          margin: EdgeInsets.only(left: 15, right: 15, top: 12, bottom: 0,),
                          decoration: BoxDecoration(
                              color:
                              AppTheme.buttonColor.withOpacity(0.15),
                              borderRadius: const BorderRadius.all(Radius.circular(10))),
                          child: Row(
                            children: [
                              //SizedBox(height: 30.0),
                              Container(
                                margin: EdgeInsets.only(left: 15,top: 30, bottom: 30),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Feedback Form',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: AppTheme.blackColor,
                                          fontWeight: FontWeight.bold
                                      ),
                                      softWrap: true,
                                    ),
                                    Text('Fill new feedback form',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: AppTheme.grayColor,
                                          fontWeight: FontWeight.normal
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Spacer(),
                              Container(
                                margin: EdgeInsets.only(right: 20),
                                child:  Image.asset('assets/plus.png',
                                  height: 45,
                                  width: 45,),
                              ),

                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print('hello');
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 130,
                          margin: EdgeInsets.only(left: 15, right: 15, top: 12, bottom: 0,),
                          decoration: BoxDecoration(
                              color:
                              AppTheme.buttonColor.withOpacity(0.15),
                              borderRadius: const BorderRadius.all(Radius.circular(10))),
                          child: Row(
                            children: [
                              //SizedBox(height: 30.0),
                              Container(
                                margin: EdgeInsets.only(left: 15,top: 30, bottom: 30),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Todays Count',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: AppTheme.blackColor,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Text('Total count of feedback form\nsubmitted today.',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: AppTheme.grayColor,
                                          fontWeight: FontWeight.normal
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Spacer(),
                              Container(
                                margin: EdgeInsets.only(right: 20),
                                child:  Text(
                                  todayCount.toString(),
                                  style: TextStyle(
                                      fontSize: 28,
                                      color: AppTheme.buttonOrangeColor,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              )
                              ,

                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print('hello');
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 130,
                          margin: EdgeInsets.only(left: 15, right: 15, top: 12, bottom: 0,),
                          decoration: BoxDecoration(
                              color:
                              AppTheme.buttonColor.withOpacity(0.15),
                              borderRadius: const BorderRadius.all(Radius.circular(10))),
                          child: Row(
                            children: [
                              //SizedBox(height: 30.0),
                              Container(
                                margin: EdgeInsets.only(left: 15,top: 30, bottom: 30),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Total Count',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: AppTheme.blackColor,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Text('Total count of feedback from \nsubmitted at server.',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: AppTheme.grayColor,
                                          fontWeight: FontWeight.normal
                                      ),

                                    )
                                  ],
                                ),
                              ),
                              Spacer(),
                              Container(
                                margin: EdgeInsets.only(right: 20),
                                child: Text(
                                  totalCount.toString(),
                                  style: TextStyle(
                                      fontSize: 28,
                                      color: AppTheme.buttonOrangeColor,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 40.0),
                GestureDetector(
                  onTap: () {
                   checkAnswerStatus();
                  },
                  child: Container(
                      margin:
                      const EdgeInsets.symmetric(horizontal: 16),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppTheme.buttonOrangeColor,
                          borderRadius: BorderRadius.circular(6)),
                      height: 50,
                      child: const Center(
                        child: Text('Syn Now',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white)),
                      )),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 0), () {
      checkInternetConnection();
     // print(widget.surveyDataList);
      //checkAnswerStatus();
    });


  }
  Future<void> checkInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        isInternetConnected = false;
      });
      Toast.show("Please connect internet !!",
          duration: Toast.lengthLong,
          gravity: Toast.bottom,
          backgroundColor: Colors.red);
    } else {
      setState(() {
        isInternetConnected = true;
      });
      getData();
    }
  }

  checkAnswerStatus() async {
    FocusScope.of(context).unfocus();
    APIDialog.showAlertDialog(context, 'Please wait...');
    SharedPreferences prefs=await SharedPreferences.getInstance();
    var data=prefs.getString("answer_list");

    if (data!= null){
      if(data!=null || data!="")
      {
        Navigator.of(context).pop();
        List<dynamic> list2 = jsonDecode(data!);
        submitAnswers(list2);

      }
    }else{
      Future.delayed(Duration(seconds: 1), () async {
        Navigator.of(context).pop();
        String? id = await MyUtils.getSharedPreferences("empId");
        if (id == 'QD2281'){
          todayCount = todayCount+1;
        }
        Toast.show("sync sucessfully !!",
            duration: Toast.lengthLong,
            gravity: Toast.bottom,
            backgroundColor: Colors.green);
      });

    }



  }

  submitAnswers(List<dynamic> answers) async {


    String? empId=await MyUtils.getSharedPreferences("empId");
    String? name=await MyUtils.getSharedPreferences("name");

    var requestModel = {
      "name": name,
      "id": empId,
      "answer" : answers
    };

    ApiBaseHelper helper = ApiBaseHelper();
    var response =
    await helper.postAPINew('Avanti/SubmitAppSurvey', requestModel, context);
    var responseJSON = json.decode(response.body);
    //print(responseJSON);

    if (responseJSON['code'] == 200) {
      Toast.show("success !!",
          duration: Toast.lengthLong,
          gravity: Toast.bottom,
          backgroundColor: Colors.green);



      MyUtils.saveSharedPreferences("answer_list", "");
      getData();
    } else {
      Toast.show(responseJSON['message'],
          duration: Toast.lengthLong,
          gravity: Toast.bottom,
          backgroundColor: Colors.red);
    }




  }


  showLogOutDialog(BuildContext context) {
    Widget cancelButton = GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: Text("Cancel"));
    Widget continueButton = GestureDetector(
        onTap: (){
          Navigator.pop(context);
          _logOut();
        },

        child: Text("Logout",style: TextStyle(
            color: Colors.red
        ),));

    AlertDialog alert = AlertDialog(
      title: Text("Log Out"),
      content: Text("Are you sure you want to Log out ?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  _logOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    AppModel.setLoginStatus(false);
    MyUtils.saveSharedPreferences('id', '');
    MyUtils.saveSharedPreferences('name', '');
    MyUtils.saveSharedPreferences('empId', '');
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
            (Route<dynamic> route) => false);
  }
  getData() async {
    FocusScope.of(context).unfocus();
    APIDialog.showAlertDialog(context, 'Please wait...');
    ApiBaseHelper helper = ApiBaseHelper();
    var response =
    await helper.get('avanti/getDetails'+'?id='+widget.id,context);
    var responseJSON = json.decode(response.body);
    if (responseJSON["code"] == 200){

      Navigator.of(context).pop();
    }
    todayCount = responseJSON["data"]["todayCount"];
    totalCount = responseJSON["data"]["totalCount"];
    setState(() {});

  }
}