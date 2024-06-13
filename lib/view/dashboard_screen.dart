import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:qsurvey_flutter/view/feedback_form_screen.dart';
import 'package:qsurvey_flutter/view/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

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
  String policyUrl = '';
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
                  onTap: () async {
                    final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FeedbackFormScreen(true,widget.surveyDataList),
                        ));
                    if (result != null){
                      getData();
                    }
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //             FeedbackFormScreen(true,widget.surveyDataList)));
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
                GestureDetector(
                  onTap: () {
                    openUrl();
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 100,
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
                                    Text('Privacy Policy of QDSurvey',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: AppTheme.blackColor,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ],
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
  void openUrl() async {
    String url = policyUrl;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
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
   // var data=prefs.getString("answer_list");
   // prefs.setStringList("feedback_list",[]);
    List<String>? data= await prefs.getStringList("feedback_list")??[];

    List<String>? lucList=prefs.getStringList("LUC")??[];
    List<String>? otherList=prefs.getStringList("Others")??[];

    if (data.length!=0){
      if(data.isNotEmpty && data.length!=0)
      {
        Navigator.of(context).pop();



      }


      else
        {
          Navigator.of(context).pop();
          Toast.show("Nothing to sync!!",
              duration: Toast.lengthLong,
              gravity: Toast.bottom,
              backgroundColor: Colors.blue);
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

  submitAnswers(List<dynamic> allAnswersList,List<String>? lucList,List<String>? otherList,int pos,int totalLength) async {
    List<dynamic> allAnswers=[];

    for(int i=0;i<allAnswersList.length;i++)
      {
        List<dynamic> data = jsonDecode(allAnswersList[i]);
        allAnswers.add(data);
      }

    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? empId=await MyUtils.getSharedPreferences("empId");
    String? name=await MyUtils.getSharedPreferences("name");



    var requestModel = {
      "name": name,
      "id": empId,
      "answer" : allAnswers
    };

    ApiBaseHelper helper = ApiBaseHelper();
    var response =
    await helper.postAPINew('Avanti/SubmitAppSurvey', requestModel, context);
    var responseJSON = json.decode(response.body);

    print('Opening URL: $lucList');
    print('Opening other URL: $otherList');
    if (responseJSON['code'] == 200) {

      print("INEDDEX "+pos.toString());


      Toast.show("success !!",
          duration: Toast.lengthLong,
          gravity: Toast.bottom,
          backgroundColor: Colors.green);



      preferences.setStringList("feedback_list",[]);
      //getData();

      print("Image Uploading triggered");

      if(lucList!=null && lucList.length!=0)
      {
        _uploadFiles(lucList);
       // getImageData(0,lucList,otherList);
      }


      if(otherList!=null && otherList.length!=0)
      {
        _uploadFiles1(otherList);
       // getImageData(1,lucList,otherList);
      }




     // MyUtils.saveSharedPreferences("answer_list", "");

    } else {
      Toast.show(responseJSON['message'],
          duration: Toast.lengthLong,
          gravity: Toast.bottom,
          backgroundColor: Colors.red);
    }




  }
  _uploadFiles(List<String>? lucList) async {
    String? loanNumber=await MyUtils.getSharedPreferences("loan_number");
    String? branchName=await MyUtils.getSharedPreferences("branch_name");
    String? partnerName=await MyUtils.getSharedPreferences("partner_name");
    FocusScope.of(context).unfocus();
    APIDialog.showAlertDialog(context, 'Uploading Images...');
    // String fileName = xFile.path.split('/').last;
    FormData? formData= FormData.fromMap({
      "Id": loanNumber,
      "artifactType": "LUC",
    });

    for (int i = 0; i <lucList!.length; i++) {
      //  String fileName = ${loanvalue.loan_number}-${(loanvalue.branch).split(' ').join('_')}-${(loanvalue.partner).split(' ').join('_')}-${Date.now() + '-' + i}.jpeg
      String fileNameNew = '';

      // if (loanData.length!=0){
      //   fileNameNew = loanData[0]["loan_number"].toString()+"-"+loanData[0]["branch"].toString()+"-"+loanData[0]["partner"].toString()+"-"+"LUC"+"-"+i.toString()+"."+lucList[i].split('.').last;
      // }else{
        fileNameNew = loanNumber.toString()+"-"+branchName.toString()+"-"+partnerName.toString()+"-"+"LUC"+"-"+i.toString()+"."+lucList[i].split('.').last;

     // }
      //String fileName = loanData[0]["loan_number"].toString()+"-"+loanData[0]["branch"].toString()+"-"+loanData[0]["partner"].toString()+"-"+DateTime.now().toString()+"-"+i.toString()+"."+lucList[i].split('.').last;

      print("File Name is "+fileNameNew);
      var path = lucList[i].toString();
      formData.files.addAll([
        MapEntry("file", await MultipartFile.fromFile(path, filename: fileNameNew))
      ]);
    }

    Dio dio = Dio();
    dio.options.headers['Content-Type'] = 'multipart/form-data';
    // dio.options.headers['Authorization'] = "Bearer " + AppModel.token;
    print("https://api.doyoursurvey.com:3009/Avanti/saveImage");
    var response = await dio.post(
        "https://api.doyoursurvey.com:3009/Avanti/saveImage",
        data: formData);
    print(response.data);
    Navigator.pop(context);
    if (response.data['code'] == 200) {
      Toast.show(response.data['message'].toString(),
          duration: Toast.lengthLong,
          gravity: Toast.bottom,
          backgroundColor: Colors.green);

    } else {
      Toast.show(response.data['message'].toString(),
          duration: Toast.lengthLong,
          gravity: Toast.bottom,
          backgroundColor: Colors.red);
    }
  }
  _uploadFiles1(List<String>? otherList) async {
    FocusScope.of(context).unfocus();
    String? loanNumber=await MyUtils.getSharedPreferences("loan_number");
    String? branchName=await MyUtils.getSharedPreferences("branch_name");
    String? partnerName=await MyUtils.getSharedPreferences("partner_name");
    APIDialog.showAlertDialog(context, 'Uploading Images...');
    // String fileName = xFile.path.split('/').last;
    FormData? formData= FormData.fromMap({
      "Id":loanNumber,
      "artifactType": "Other",
    });

    for (int i = 0; i <otherList!.length; i++) {
      String fileName = '';

      // if (loanData.length!=0){
      //   fileName = loanData[0]["loan_number"].toString()+"-"+loanData[0]["branch"].toString()+"-"+loanData[0]["partner"].toString()+"-"+i.toString()+"."+otherList[i].split('.').last;
      // }else{
        fileName = loanNumber.toString()+"-"+branchName.toString()+"-"+partnerName.toString()+"-"+i.toString()+"."+otherList[i].split('.').last;

     // }
      print("File Name is 1 "+fileName);
     // String fileName = loanData[0]["loan_number"].toString()+"-"+loanData[0]["branch"].toString()+"-"+loanData[0]["partner"].toString()+"-"+DateTime.now().toString()+"-"+i.toString()+"."+otherList[i].split('.').last;

      var path = otherList[i].toString();
      // var name = ${loanvalue.loan_number}-${(loanvalue.branch).split(' ').join('_')}-${(loanvalue.partner).split(' ').join('_')}-${Date.now() + '-' + i}.jpeg
      formData.files.addAll([
        MapEntry("file", await MultipartFile.fromFile(path, filename: fileName))
      ]);
    }

    Dio dio = Dio();
    dio.options.headers['Content-Type'] = 'multipart/form-data';
    // dio.options.headers['Authorization'] = "Bearer " + AppModel.token;
    print("https://api.doyoursurvey.com:3009/Avanti/saveImage");
    var response = await dio.post(
        "https://api.doyoursurvey.com:3009/Avanti/saveImage",
        data: formData);
    print(response.data);
    Navigator.pop(context);
    if (response.data['code'] == 200) {
      Toast.show(response.data['message'].toString(),
          duration: Toast.lengthLong,
          gravity: Toast.bottom,
          backgroundColor: Colors.green);


    } else {
      Toast.show(response.data['message'].toString(),
          duration: Toast.lengthLong,
          gravity: Toast.bottom,
          backgroundColor: Colors.red);
    }
  }
  // getImageData(int type,List<String>? lucList,List<String>? otherList) async {
  //
  //   APIDialog.showAlertDialog(context, "Please wait...");
  //
  //   String? loanNumber=await MyUtils.getSharedPreferences("loan_number");
  //
  //   var requestModel = {
  //     "loan_number": loanNumber
  //   };
  //
  //   ApiBaseHelper helper = ApiBaseHelper();
  //   var response =
  //   await helper.postAPINew('Avanti/loanDetails', requestModel, context);
  //   var responseJSON = json.decode(response.body);
  //   Navigator.pop(context);
  //   print(responseJSON);
  //   print(type);
  //   if(responseJSON["data"].length!=0)
  //   {
  //     if(type==0)
  //     {
  //       _uploadFiles(responseJSON["data"],lucList);
  //     }
  //     else
  //     {
  //       _uploadFiles1(responseJSON["data"],otherList);
  //    }
  //
  //   }
  //   else
  //   {
  //     if(type==0)
  //     {
  //       _uploadFiles(responseJSON["data"],lucList);
  //     }
  //     else
  //     {
  //       _uploadFiles1(responseJSON["data"],otherList);
  //    }
  //     // Toast.show("Invalid loan number",
  //     //     duration: Toast.lengthLong,
  //     //     gravity: Toast.bottom,
  //     //     backgroundColor: Colors.red);
  //   }
  //
  //
  //
  //
  // }
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
    policyUrl = responseJSON["policy"];
    print(policyUrl);
    setState(() {});

  }
}