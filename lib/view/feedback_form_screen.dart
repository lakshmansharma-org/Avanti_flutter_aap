import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qsurvey_flutter/widgets/textfield_string_widget.dart';
import 'package:share_plus/share_plus.dart';
import 'package:toast/toast.dart';

import '../network/api_dialog.dart';
import '../network/api_helper.dart';
import '../network/constants.dart';
import '../utils/app_theme.dart';
import '../widgets/date_widget.dart';
import '../widgets/textfield_number_widget.dart';

import 'package:image_picker/image_picker.dart';
class FeedbackFormScreen extends StatefulWidget {
  final bool showBack;
  List<dynamic> surveyDataList = [];

  FeedbackFormScreen(this.showBack, this.surveyDataList);

  @override
  FeedbackFormState createState() => FeedbackFormState();
}

class FeedbackFormState extends State<FeedbackFormScreen> {
  @override

  List<TextEditingController> _controllerTab1=[];
  List<TextEditingController> _controllerTab2=[];
  List<TextEditingController> _controllerTab3=[];
  List<XFile> imageList=[];
  var question1Controller = TextEditingController();
  var question2Controller = TextEditingController();
  var question3Controller = TextEditingController();
  var question4Controller = TextEditingController();
  var question5Controller = TextEditingController();
  var question6Controller = TextEditingController();
  var question7Controller = TextEditingController();
  var question8Controller = TextEditingController();
  var question9Controller = TextEditingController();
  var question10Controller = TextEditingController();
  var question11Controller = TextEditingController();
  var question12Controller = TextEditingController();
  var question13Controller = TextEditingController();
  var question14Controller = TextEditingController();
  var question15Controller = TextEditingController();
  var question16Controller = TextEditingController();
  var question17Controller = TextEditingController();
  var question18Controller = TextEditingController();
  var question19Controller = TextEditingController();
  var question20Controller = TextEditingController();
  var question21Controller = TextEditingController();
  var question22Controller = TextEditingController();
  var question23Controller = TextEditingController();
  var question24Controller = TextEditingController();

  var question25Controller = TextEditingController();
  var question26Controller = TextEditingController();
  var question27Controller = TextEditingController();
  var question28Controller = TextEditingController();
  var question29Controller = TextEditingController();
  var question30Controller = TextEditingController();
  var question31Controller = TextEditingController();
  var number = TextEditingController();
  var text = TextEditingController();
  List<dynamic> questionList = [];
  List<dynamic> option = [];
  Set<int> selectedIndices = {};
  Set<int> selectedIndices2 = {};
  Set<int> selectedIndices3 = {};
  Set<int> selectedIndices4 = {};
  Set<int> selectedIndices5 = {};
  Set<int> selectedIndices6 = {};
  Set<int> selectedIndices7 = {};

  var selectDate = '12';
  var lucData = '13';
  var borrowerData = '14';
  int selectIndex = -1;
  int selectIndex2 = -1;
  int selectIndex4 = -1;
  int selectIndex5 = -1;
  int selectIndex6 = -1;
  int selectIndex7 = -1;
  int selectIndex8 = -1;
  int selectIndex9 = -1;
  int selectIndex10 = -1;
  int selectIndex11 = -1;
  int selectIndex12 = -1;
  int selectIndex13 = -1;
  int selectIndex14 = -1;
  int selectIndex15 = -1;
  int selectIndex16 = -1;
  int selectIndex17 = -1;
  int selectIndex18 = -1;
  int selectIndex19 = -1;
  int selectIndex20 = -1;
  int selectIndex21 = -1;
  int selectIndex22 = -1;
  int selectIndex23 = -1;
  int selectIndex24 = -1;
  int selectIndex25 = -1;
  int selectIndex26 = -1;
  int selectIndex27 = -1;
  int selectIndex28 = -1;
  int selectIndex29 = -1;
  int selectIndex30 = -1;
  int selectIndex31 = -1;
  int selectIndex32 = -1;
  int selectIndex33 = -1;
  int selectIndex34 = -1;
  int selectIndex35 = -1;
  int selectIndex36 = -1;
  int selectIndex37 = -1;
  int selectIndex38 = -1;
  int selectIndex39 = -1;
  int selectIndex40 = -1;
  int selectIndex41 = -1;
  int selectIndex42 = -1;
  int selectIndex43 = -1;
  int selectIndex44 = -1;
  int selectIndex45 = -1;
  int selectIndex46 = -1;
  int selectIndex47 = -1;
  int selectIndex48 = -1;
  int selectIndex49 = -1;
  int selectIndex50 = -1;
  int selectIndex51 = -1;
  final ImagePicker picker = ImagePicker();
  int questionIndex = 0;
  late bool isSelected;
  DateTime? _startDate = null;
  DateTime? _startDate2 = null;
  DateTime? _startDate3 = null;
  DateTime? _startDate4 = null;
  DateTime? _startDate5 = null;

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? pickedStartDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime
          .now()
          .year - 5),
      lastDate: DateTime(DateTime
          .now()
          .year + 5),
    );

    if (pickedStartDate != null && pickedStartDate != _startDate) {
      setState(() {
        _startDate = pickedStartDate;
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedStartDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime
          .now()
          .year - 5),
      lastDate: DateTime(DateTime
          .now()
          .year + 5),
    );

    if (pickedStartDate != null && pickedStartDate != _startDate2) {
      setState(() {
        _startDate2 = pickedStartDate;
      });
    }
  }
  Future<void> _selectDatepic(BuildContext context) async {
    final DateTime? pickedStartDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime
          .now()
          .year - 5),
      lastDate: DateTime(DateTime
          .now()
          .year + 5),
    );

    if (pickedStartDate != null && pickedStartDate != _startDate3) {
      setState(() {
        _startDate3 = pickedStartDate;
      });
    }
  }

  Future<void> _selectDate4pic(BuildContext context) async {
    final DateTime? pickedStartDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime
          .now()
          .year - 5),
      lastDate: DateTime(DateTime
          .now()
          .year + 5),
    );

    if (pickedStartDate != null && pickedStartDate != _startDate4) {
      setState(() {
        _startDate4 = pickedStartDate;
      });
    }
  }

  Future<void> _selectDate5pic(BuildContext context) async {
    final DateTime? pickedStartDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime
          .now()
          .year - 5),
      lastDate: DateTime(DateTime
          .now()
          .year + 5),
    );

    if (pickedStartDate != null && pickedStartDate != _startDate5) {
      setState(() {
        _startDate5 = pickedStartDate;
      });
    }
  }


  Widget build(BuildContext context) {
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    return Container(
      color: AppTheme.blueColor,
      child: SafeArea(
        child: Scaffold(
            appBar: widget.showBack
                ? AppBar(
              backgroundColor: AppTheme.blueColor,
              title: Text(
                'Feedback Form',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white
                ),
              ),
              centerTitle: true,
            )
                : PreferredSize(
                preferredSize: const Size.fromHeight(0.0),
                child: AppBar()),
            backgroundColor: Colors.white,
            extendBody: true,
            body:


            questionIndex == 0 ?
            TextFieldNumberWidget(
              controller: question1Controller,
              onNextTap: () {
                if (question1Controller.text == "" ||
                    question1Controller.text.length != 13) {
                  final snackBar = SnackBar(
                    content: Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      // Adjust left and right margins
                      child: Text(
                        'Please enter valid loan number',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 3),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }

                else {
                  questionIndex = questionIndex + 1;
                  setState(() {

                  });
                }
              },

              onPreviousTap: () {

              },

              questionMessage: questionList[questionIndex]['que_message'],
              questionName: questionList[questionIndex]['question'],

            )
                
                

            :

            questionIndex == 1 ?
            TextFieldStringWidget(
              controller: question2Controller,
              onNextTap: () {
                if (question2Controller.text == "") {
                  final snackBar = SnackBar(
                    content: Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      // Adjust left and right margins
                      child: Text(
                        'Please enter a valid name',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 3),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }

                else {
                  questionIndex = questionIndex + 1;
                  setState(() {

                  });
                }
              },

              onPreviousTap: () {
                questionIndex = questionIndex - 1;
                setState(() {

                });
              },

              questionMessage: questionList[questionIndex]['que_message'],
              questionName: questionList[questionIndex]['question'],

            ) :
            questionIndex == 2 ?
            TextFieldStringWidget(
              controller: question3Controller,
              onNextTap: () {
                if (question3Controller.text == "") {
                  final snackBar = SnackBar(
                    content: Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      // Adjust left and right margins
                      child: Text(
                        'Field is required',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 3),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }

                else {
                  questionIndex = questionIndex + 1;
                  setState(() {

                  });
                }
              },

              onPreviousTap: () {
                questionIndex = questionIndex - 1;
                setState(() {

                });
              },

              questionMessage: questionList[questionIndex]['que_message'],
              questionName: questionList[questionIndex]['question'],

            ) :
            questionIndex == 3 ?

            TextFieldStringWidget(
              controller: question4Controller,
              onNextTap: () {
                if (question4Controller.text == "") {
                  final snackBar = SnackBar(
                    content: Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      // Adjust left and right margins
                      child: Text(
                        'Field is required',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 3),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }

                else {
                  questionIndex = questionIndex + 1;
                  setState(() {

                  });
                }
              },

              onPreviousTap: () {
                questionIndex = questionIndex - 1;
                setState(() {

                });
              },

              questionMessage: questionList[questionIndex]['que_message'],
              questionName: questionList[questionIndex]['question'],

            ) :
            questionIndex == 4 ?
            DateWidget(
              startDate: _startDate,
              onCalenderTap: () {
                _selectStartDate(context);
              },
              onNextTap: () {
                if (_startDate == null) {
                  final snackBar = SnackBar(
                    content: Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      // Adjust left and right margins
                      child: Text(
                        'Field is required',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 3),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }

                else {
                  questionIndex = questionIndex + 1;
                  setState(() {

                  });
                }
              },

              onPreviousTap: () {
                questionIndex = questionIndex - 1;
                setState(() {

                });
              },

              questionMessage: questionList[questionIndex]['que_message'],
              questionName: questionList[questionIndex]['question'],

            ) :

            questionIndex == 5 ?

            TextFieldStringWidget(
              controller: question5Controller,
              onNextTap: () {
                if (question5Controller.text == "") {
                  final snackBar = SnackBar(
                    content: Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      // Adjust left and right margins
                      child: Text(
                        'Field is required',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 3),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }

                else {
                  questionIndex = questionIndex + 1;
                  setState(() {

                  });
                }
              },

              onPreviousTap: () {
                questionIndex = questionIndex - 1;
                setState(() {

                });
              },

              questionMessage: questionList[questionIndex]['que_message'],
              questionName: questionList[questionIndex]['question'],

            ) :


            questionIndex == 6 ?

            Container(
              margin: EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      height: 300,

                      child: ListView.builder(
                          padding: EdgeInsets.only(bottom: 16.0),
                          itemCount: questionList[questionIndex]['options']
                              .length,
                          shrinkWrap: true,
                          //physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int pos) {
                            return Padding(
                                padding: const EdgeInsets.only(
                                  left: 0.0, top: 8.0, bottom: 8.0,),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        selectedIndices.contains(pos)
                                            ? InkWell(
                                          onTap: (){
                                            if (selectedIndices.contains(
                                                pos)) {
                                              selectedIndices.remove(pos);
                                            }
                                            setState(() {

                                            });
                                          },
                                            child:Image.asset('assets/check.png',
                                            width: 24, height: 24))
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unCheck.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectedIndices.add(pos);
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                    // selectedIndices.contains(pos) ?
                                    // Container(
                                    //   margin: EdgeInsets.only(right: 12),
                                    //   child: TextFormField(
                                    //     //validator: checkPasswordValidator,
                                    //       controller: number,
                                    //       decoration: InputDecoration(
                                    //         contentPadding: EdgeInsets.zero,
                                    //         labelText: 'Monthly Income',
                                    //         labelStyle: const TextStyle(
                                    //           fontSize: 15.0,
                                    //           color: AppTheme.grayColor,
                                    //         ),
                                    //       )),
                                    // ) : Container(),
                                  ],
                                )
                            );
                          }),
                    ), // TextField Container
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectedIndices.isNotEmpty){
                                questionIndex = questionIndex + 1;
                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ) :

            questionIndex == 7 ?
            Container(
              margin: EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      height: 300,

                      child: ListView.builder(
                          padding: EdgeInsets.only(bottom: 16.0),
                          itemCount: questionList[questionIndex]['options']
                              .length,
                          shrinkWrap: true,
                          //physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int pos) {
                            _controllerTab1.add(TextEditingController());
                            return Padding(
                                padding: const EdgeInsets.only(
                                  left: 0.0, top: 8.0, bottom: 8.0,),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        selectedIndices2.contains(pos)
                                            ? InkWell(
                                            onTap: (){
                                              if (selectedIndices2.contains(
                                                  pos)) {
                                                selectedIndices2.remove(pos);
                                              }
                                              setState(() {

                                              });
                                            },
                                            child:Image.asset('assets/check.png',
                                                width: 24, height: 24))
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unCheck.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectedIndices2.add(pos);
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                    selectedIndices2.contains(pos) ?
                                    Container(
                                      margin: EdgeInsets.only(right: 12),
                                      child: TextFormField(
                                        //validator: checkPasswordValidator,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter.digitsOnly, // Allow only numbers
                                          ],
                                          controller: _controllerTab1[pos],
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.zero,
                                            labelText: 'Monthly Income',
                                            labelStyle: const TextStyle(
                                              fontSize: 15.0,
                                              color: AppTheme.grayColor,
                                            ),
                                          )),
                                    ) : Container(),
                                  ],
                                )
                            );
                          }),
                    ), // TextField Container
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectedIndices2.isNotEmpty && question25Controller.text != ""){
                                questionIndex = questionIndex + 1;
                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option and enter amount.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ) :// multiple selection with text field issue pending

            questionIndex == 8 ?


            Container(
              margin: EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      height: 300,

                      child: ListView.builder(
                          padding: EdgeInsets.only(bottom: 16.0),
                          itemCount: questionList[questionIndex]['options']
                              .length,
                          shrinkWrap: true,
                          //physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int pos) {
                            return Padding(
                                padding: const EdgeInsets.only(
                                  left: 0.0, top: 8.0, bottom: 8.0,),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        selectedIndices3.contains(pos)
                                            ? InkWell(
                                            onTap: (){
                                              if (selectedIndices3.contains(
                                                  pos)) {
                                                selectedIndices3.remove(pos);
                                              }
                                              setState(() {

                                              });
                                            },
                                            child:Image.asset('assets/check.png',
                                                width: 24, height: 24))
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unCheck.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectedIndices3.add(pos);
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                    // selectedIndices3.contains(pos) ?
                                    // Container(
                                    //   margin: EdgeInsets.only(right: 12),
                                    //   child: TextFormField(
                                    //     //validator: checkPasswordValidator,
                                    //       controller: number,
                                    //       decoration: InputDecoration(
                                    //         contentPadding: EdgeInsets.zero,
                                    //         labelText: 'Monthly Income',
                                    //         labelStyle: const TextStyle(
                                    //           fontSize: 15.0,
                                    //           color: AppTheme.grayColor,
                                    //         ),
                                    //       )),
                                    // ) : Container(),
                                  ],
                                )
                            );
                          }),
                    ), // TextField Container
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectedIndices3.isNotEmpty){
                                questionIndex = questionIndex + 1;
                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ) :


            questionIndex == 9 ?


            Container(
              margin: EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      height: 300,

                      child: ListView.builder(
                          padding: EdgeInsets.only(bottom: 16.0),
                          itemCount: questionList[questionIndex]['options']
                              .length,
                          shrinkWrap: true,
                          //physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int pos) {
                            _controllerTab2.add(TextEditingController());
                            return Padding(
                                padding: const EdgeInsets.only(
                                  left: 0.0, top: 8.0, bottom: 8.0,),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        selectedIndices4.contains(pos)
                                            ? InkWell(
                                            onTap: (){
                                              if (selectedIndices4.contains(
                                                  pos)) {
                                                selectedIndices4.remove(pos);
                                              }
                                              setState(() {

                                              });
                                            },
                                            child:Image.asset('assets/check.png',
                                                width: 24, height: 24))
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unCheck.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectedIndices4.add(pos);
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                    selectedIndices4.contains(pos) ?
                                    Container(
                                      margin: EdgeInsets.only(right: 12),
                                      child: TextFormField(
                                        //validator: checkPasswordValidator,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter.digitsOnly, // Allow only numbers
                                          ],
                                          controller: _controllerTab2[pos],
                                          //controller: number,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.zero,
                                            labelText: 'Monthly Income',
                                            labelStyle: const TextStyle(
                                              fontSize: 15.0,
                                              color: AppTheme.grayColor,
                                            ),
                                          )),
                                    ) : Container(),
                                  ],
                                )
                            );
                          }),
                    ), // TextField Container
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectedIndices4.isNotEmpty && question26Controller.text != ""){
                                questionIndex = questionIndex + 1;
                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option and enter amount.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ) ://multiple selection with text field issue pending
            questionIndex == 10 ?
            TextFieldNumberWidget(
              controller: question6Controller,
              onNextTap: () {
                if (question6Controller.text == "") {
                  final snackBar = SnackBar(
                    content: Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      // Adjust left and right margins
                      child: Text(
                        'Answer cannot be empty',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 3),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }

                else {
                  questionIndex = questionIndex + 1;
                  setState(() {

                  });
                }
              },

              onPreviousTap: () {
                questionIndex = questionIndex - 1;
                setState(() {

                });
              },

              questionMessage: questionList[questionIndex]['que_message'],
              questionName: questionList[questionIndex]['question'],

            ) :

            questionIndex == 11 ?
            TextFieldNumberWidget(
              controller: question7Controller,
              onNextTap: () {
                if (question7Controller.text == "") {
                  final snackBar = SnackBar(
                    content: Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      // Adjust left and right margins
                      child: Text(
                        'Answer cannot be empty',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 3),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }

                else {
                  questionIndex = questionIndex + 1;
                  setState(() {

                  });
                }
              },

              onPreviousTap: () {
                questionIndex = questionIndex - 1;
                setState(() {

                });
              },

              questionMessage: questionList[questionIndex]['que_message'],
              questionName: questionList[questionIndex]['question'],

            ) :

            questionIndex == 12 ?

            TextFieldNumberWidget(
              controller: question8Controller,
              onNextTap: () {
                if (question8Controller.text == "") {
                  final snackBar = SnackBar(
                    content: Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      // Adjust left and right margins
                      child: Text(
                        'Answer cannot be empty',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 3),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }

                else {
                  questionIndex = questionIndex + 1;
                  setState(() {

                  });
                }
              },

              onPreviousTap: () {
                questionIndex = questionIndex - 1;
                setState(() {

                });
              },

              questionMessage: questionList[questionIndex]['que_message'],
              questionName: questionList[questionIndex]['question'],

            ) :
            questionIndex == 13 ?
            TextFieldNumberWidget(
              controller: question9Controller,
              onNextTap: () {
                if (question9Controller.text == "") {
                  final snackBar = SnackBar(
                    content: Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      // Adjust left and right margins
                      child: Text(
                        'Answer cannot be empty',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 3),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }

                else {
                  questionIndex = questionIndex + 1;
                  setState(() {

                  });
                }
              },

              onPreviousTap: () {
                questionIndex = questionIndex - 1;
                setState(() {

                });
              },

              questionMessage: questionList[questionIndex]['que_message'],
              questionName: questionList[questionIndex]['question'],

            ) :


            questionIndex == 14 ?

            TextFieldNumberWidget(
              controller: question10Controller,
              onNextTap: () {
                if (question10Controller.text == "") {
                  final snackBar = SnackBar(
                    content: Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      // Adjust left and right margins
                      child: Text(
                        'Answer cannot be empty',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 3),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }

                else {
                  questionIndex = questionIndex + 1;
                  setState(() {

                  });
                }
              },

              onPreviousTap: () {
                questionIndex = questionIndex - 1;
                setState(() {

                });
              },

              questionMessage: questionList[questionIndex]['que_message'],
              questionName: questionList[questionIndex]['question'],

            ) ://done---


            questionIndex == 15 ?

            Container(
              //height: 110,
              margin: EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 150,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex == pos
                                            ? Image.asset(
                                            'assets/selectRadio.png',
                                            width: 24, height: 24)
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unSelectRadio.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectIndex = pos;
                                              print(selectIndex);
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                          // selectIndex != 3 ?
                          // Column(
                          //   children: [
                          //     SizedBox(height: 16.0),
                          //     Container(
                          //       margin: EdgeInsets.only(right: 12),
                          //       child: TextFormField(
                          //         //validator: checkPasswordValidator,
                          //           controller: question27Controller,
                          //           keyboardType: TextInputType.number,
                          //           inputFormatters: <TextInputFormatter>[
                          //             FilteringTextInputFormatter.digitsOnly, // Allow only numbers
                          //           ],
                          //           decoration: InputDecoration(
                          //             contentPadding: EdgeInsets.zero,
                          //             labelText: 'Enter number',
                          //             labelStyle: const TextStyle(
                          //               fontSize: 15.0,
                          //               color: AppTheme.grayColor,
                          //             ),
                          //           )),
                          //     ),
                          //     SizedBox(height: 16.0),
                          //   ],
                          // ) : Container(),
                        ],
                      ),
                    ), // TextField Container
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectIndex != -1){
                                questionIndex = questionIndex + 1;
                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ) :



            questionIndex == 16 ?

            TextFieldNumberWidget(
              controller: question11Controller,
              onNextTap: () {
                if (question11Controller.text == "") {
                  final snackBar = SnackBar(
                    content: Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      // Adjust left and right margins
                      child: Text(
                        'Answer cannot be empty',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 3),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }

                else {
                  questionIndex = questionIndex + 1;
                  setState(() {

                  });
                }
              },

              onPreviousTap: () {
                questionIndex = questionIndex - 1;
                setState(() {

                });
              },

              questionMessage: questionList[questionIndex]['que_message'],
              questionName: questionList[questionIndex]['question'],

            ) :


            questionIndex == 17 ?


            TextFieldNumberWidget(
              controller: question12Controller,
              onNextTap: () {
                if (question12Controller.text == "") {
                  final snackBar = SnackBar(
                    content: Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      // Adjust left and right margins
                      child: Text(
                        'Answer cannot be empty',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 3),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }

                else {
                  questionIndex = questionIndex + 1;
                  setState(() {

                  });
                }
              },

              onPreviousTap: () {
                questionIndex = questionIndex - 1;
                setState(() {

                });
              },

              questionMessage: questionList[questionIndex]['que_message'],
              questionName: questionList[questionIndex]['question'],

            ) :

            questionIndex == 18 ?
            TextFieldNumberWidget(
              controller: question13Controller,
              onNextTap: () {
                if (question13Controller.text == "") {
                  final snackBar = SnackBar(
                    content: Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      // Adjust left and right margins
                      child: Text(
                        'Answer cannot be empty',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 3),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }

                else {
                  questionIndex = questionIndex + 1;
                  setState(() {

                  });
                }
              },

              onPreviousTap: () {
                questionIndex = questionIndex - 1;
                setState(() {

                });
              },

              questionMessage: questionList[questionIndex]['que_message'],
              questionName: questionList[questionIndex]['question'],

            ):


            questionIndex == 19 ?


            Container(
              margin: EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      height: 300,

                      child: ListView.builder(
                          padding: EdgeInsets.only(bottom: 16.0),
                          itemCount: questionList[questionIndex]['options']
                              .length,
                          shrinkWrap: true,
                          //physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int pos) {
                            return Padding(
                                padding: const EdgeInsets.only(
                                  left: 0.0, top: 8.0, bottom: 8.0,),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        selectedIndices5.contains(pos)
                                            ? InkWell(
                                            onTap: (){
                                              if (selectedIndices5.contains(
                                                  pos)) {
                                                selectedIndices5.remove(pos);
                                              }
                                              setState(() {

                                              });
                                            },
                                            child:Image.asset('assets/check.png',
                                                width: 24, height: 24))
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unCheck.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectedIndices5.add(pos);
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                    // selectedIndices5.contains(pos) ?
                                    // Container(
                                    //   margin: EdgeInsets.only(right: 12),
                                    //   child: TextFormField(
                                    //     //validator: checkPasswordValidator,
                                    //       controller: number,
                                    //       decoration: InputDecoration(
                                    //         contentPadding: EdgeInsets.zero,
                                    //         labelText: 'Monthly Income',
                                    //         labelStyle: const TextStyle(
                                    //           fontSize: 15.0,
                                    //           color: AppTheme.grayColor,
                                    //         ),
                                    //       )),
                                    // ) : Container(),
                                  ],
                                )
                            );
                          }),
                    ), // TextField Container
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectedIndices5.isNotEmpty){
                                questionIndex = questionIndex + 1;
                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ) :

            questionIndex == 20 ?


            TextFieldNumberWidget(
              controller: question14Controller,
              onNextTap: () {
                if (question14Controller.text == "") {
                  final snackBar = SnackBar(
                    content: Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      // Adjust left and right margins
                      child: Text(
                        'Answer cannot be empty',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 3),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }

                else {
                  questionIndex = questionIndex + 1;
                  setState(() {

                  });
                }
              },

              onPreviousTap: () {
                questionIndex = questionIndex - 1;
                setState(() {

                });
              },

              questionMessage: questionList[questionIndex]['que_message'],
              questionName: questionList[questionIndex]['question'],

            ):


            questionIndex == 21 ?

            DateWidget(
              startDate: _startDate2,
              onCalenderTap: () {
                _selectDate(context);
              },
              onNextTap: () {
                if (_startDate2 == null) {
                  final snackBar = SnackBar(
                    content: Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      // Adjust left and right margins
                      child: Text(
                        'Field is required',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 3),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }

                else {
                  questionIndex = questionIndex + 1;
                  setState(() {

                  });
                }
              },

              onPreviousTap: () {
                questionIndex = questionIndex - 1;
                setState(() {

                });
              },

              questionMessage: questionList[questionIndex]['que_message'],
              questionName: questionList[questionIndex]['question'],

            ) ://done+++++

            questionIndex == 22 ?

            Container(
              //height: 110,
              margin: EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 300,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex2 == pos
                                            ? Image.asset(
                                            'assets/selectRadio.png',
                                            width: 24, height: 24)
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unSelectRadio.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectIndex2 = pos;
                                              print(selectIndex2);
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ), // TextField Container
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectIndex2 != -1){
                                questionIndex = questionIndex + 1;
                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ) :

            questionIndex == 23 ?

            Container(
              //height: 110,
              margin: EdgeInsets.only(left: 15,
                right: 15,
                top: 15,
                bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 150,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex4 == pos
                                            ? Image.asset(
                                            'assets/selectRadio.png',
                                            width: 24, height: 24)
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unSelectRadio.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectIndex4 = pos;
                                              print(selectIndex4);
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                          selectIndex4 == 3 ?
                          Column(
                            children: [
                              SizedBox(height: 16.0),
                              Container(
                                margin: EdgeInsets.only(right: 12),
                                child: TextFormField(
                                  //validator: checkPasswordValidator,
                                    controller: question28Controller,
                                    keyboardType: TextInputType.text,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')), // Allow only alphabetic characters
                                    ],
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      labelText: 'Type Text',
                                      labelStyle: const TextStyle(
                                        fontSize: 15.0,
                                        color: AppTheme.grayColor,
                                      ),
                                    )),
                              ),
                              SizedBox(height: 16.0),
                            ],
                          ) : Container(),
                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectIndex4 != -1){
                                if (selectIndex4 == 3){
                                  if (question28Controller.text != ""){
                                    questionIndex = questionIndex + 1;
                                  }else{
                                    final snackBar = SnackBar(
                                      content: Container(
                                        margin: EdgeInsets.only(left: 20, right: 20),
                                        // Adjust left and right margins
                                        child: Text(
                                          'Please enter text.',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      backgroundColor: Colors.red,
                                      duration: Duration(seconds: 3),
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                  }
                                }else{
                                  questionIndex = questionIndex + 1;
                                }

                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ) :

            questionIndex == 24 ?

            Container(
              //height: 110,
              margin: EdgeInsets.only(left: 15,
                right: 15,
                top: 15,
                bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 460,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex5 == pos
                                            ? Image.asset(
                                            'assets/selectRadio.png',
                                            width: 24, height: 24)
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unSelectRadio.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectIndex5 = pos;
                                              print(selectIndex5);
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectIndex5 != -1){
                                questionIndex = questionIndex + 1;
                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ) :

            questionIndex == 25 ?


            TextFieldNumberWidget(
              controller: question15Controller,
              onNextTap: () {
                if (question15Controller.text == "") {
                  final snackBar = SnackBar(
                    content: Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      // Adjust left and right margins
                      child: Text(
                        'Answer cannot be empty',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 3),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }

                else {
                  questionIndex = questionIndex + 1;
                  setState(() {

                  });
                }
              },

              onPreviousTap: () {
                questionIndex = questionIndex - 1;
                setState(() {

                });
              },

              questionMessage: questionList[questionIndex]['que_message'],
              questionName: questionList[questionIndex]['question'],

            ) :
            questionIndex == 26 ?

            Container(
              //height: 110,
              margin: EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 460,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex6 == pos
                                            ? Image.asset(
                                            'assets/selectRadio.png',
                                            width: 24, height: 24)
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unSelectRadio.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectIndex6 = pos;
                                              print(selectIndex6);
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectIndex6 != -1){
                                questionIndex = questionIndex + 1;
                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ) :
            questionIndex == 27 ?

            TextFieldNumberWidget(
              controller: question16Controller,
              onNextTap: () {
                if (question16Controller.text == "") {
                  final snackBar = SnackBar(
                    content: Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      // Adjust left and right margins
                      child: Text(
                        'Answer cannot be empty',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 3),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }

                else {
                  questionIndex = questionIndex + 1;
                  setState(() {

                  });
                }
              },

              onPreviousTap: () {
                questionIndex = questionIndex - 1;
                setState(() {

                });
              },

              questionMessage: questionList[questionIndex]['que_message'],
              questionName: questionList[questionIndex]['question'],

            ) :
            questionIndex == 28 ?

            Container(
              //height: 110,
              margin: EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 460,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex7 == pos
                                            ? Image.asset(
                                            'assets/selectRadio.png',
                                            width: 24, height: 24)
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unSelectRadio.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectIndex7 = pos;
                                              print(selectIndex7);
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),

                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectIndex7 != -1){
                                questionIndex = questionIndex + 1;
                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ) :

            questionIndex == 29 ?
            Container(
              //height: 110,
              margin: EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 460,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex8 == pos
                                            ? Image.asset(
                                            'assets/selectRadio.png',
                                            width: 24, height: 24)
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unSelectRadio.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectIndex8 = pos;
                                              print(selectIndex8);
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),

                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectIndex8 != -1){
                                questionIndex = questionIndex + 1;
                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ) :
            questionIndex == 30 ?

            Container(
              //height: 110,
              margin: EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex9 == pos
                                            ? Image.asset(
                                            'assets/selectRadio.png',
                                            width: 24, height: 24)
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unSelectRadio.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectIndex9 = pos;
                                              print(selectIndex9);
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                          selectIndex9 == 4 ?
                          Column(
                            children: [
                              SizedBox(height: 16.0),
                              Container(
                                margin: EdgeInsets.only(right: 12),
                                child: TextFormField(
                                    controller: question29Controller,
                                    keyboardType: TextInputType.text,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')), // Allow only alphabetic characters
                                    ],
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      labelText: 'Type Text',
                                      labelStyle: const TextStyle(
                                        fontSize: 15.0,
                                        color: AppTheme.grayColor,
                                      ),
                                    )),
                              ),
                              SizedBox(height: 16.0),
                            ],
                          ) : Container(),
                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectIndex9 != -1){
                                if (selectIndex9 == 4){
                                  if (question29Controller.text != ""){
                                    questionIndex = questionIndex + 1;
                                  }else{
                                    final snackBar = SnackBar(
                                      content: Container(
                                        margin: EdgeInsets.only(left: 20, right: 20),
                                        // Adjust left and right margins
                                        child: Text(
                                          'Please enter text.',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      backgroundColor: Colors.red,
                                      duration: Duration(seconds: 3),
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                  }
                                }else{
                                  questionIndex = questionIndex + 1;
                                }

                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ) :// other text

            questionIndex == 31 ?

            Container(
              //height: 110,
              margin: EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 460,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex10 == pos
                                            ? Image.asset(
                                            'assets/selectRadio.png',
                                            width: 24, height: 24)
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unSelectRadio.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectIndex10 = pos;
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                         
                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectIndex10 != -1){
                                questionIndex = questionIndex + 1;
                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ) ://---

            questionIndex == 32 ?
            Container(
              //height: 110,
              margin: EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 460,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex11 == pos
                                            ? Image.asset(
                                            'assets/selectRadio.png',
                                            width: 24, height: 24)
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unSelectRadio.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectIndex11 = pos;
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),

                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectIndex11 != -1){
                                questionIndex = questionIndex + 1;
                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ) :

            questionIndex == 33 ?
            Container(
              //height: 110,
              margin: EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 460,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex12 == pos
                                            ? Image.asset(
                                            'assets/selectRadio.png',
                                            width: 24, height: 24)
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unSelectRadio.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectIndex12 = pos;
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),

                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectIndex12 != -1){
                                questionIndex = questionIndex + 1;
                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ) :

            questionIndex == 34 ?
            Container(
              //height: 110,
              margin: EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 460,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex13 == pos
                                            ? Image.asset(
                                            'assets/selectRadio.png',
                                            width: 24, height: 24)
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unSelectRadio.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectIndex13 = pos;
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),

                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectIndex13 != -1){
                                questionIndex = questionIndex + 1;
                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ) :
            questionIndex == 35 ?
            Container(
              //height: 110,
              margin: EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 460,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex14 == pos
                                            ? Image.asset(
                                            'assets/selectRadio.png',
                                            width: 24, height: 24)
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unSelectRadio.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectIndex14 = pos;
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),

                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectIndex14 != -1){
                                questionIndex = questionIndex + 1;
                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ) :
            questionIndex == 36 ?
            Container(
              //height: 110,
              margin: EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 460,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex15 == pos
                                            ? Image.asset(
                                            'assets/selectRadio.png',
                                            width: 24, height: 24)
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unSelectRadio.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectIndex15 = pos;
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),

                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectIndex15 != -1){
                                questionIndex = questionIndex + 1;
                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ) :
            questionIndex == 37 ?
            Container(
              //height: 110,
              margin: EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 150,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 0.0,
                                      top: 8.0,
                                      bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex16 == pos
                                            ? Image.asset(
                                            'assets/selectRadio.png',
                                            width: 24, height: 24)
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unSelectRadio.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectIndex16 = pos;
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                          selectIndex16 == 3 ?
                          Column(
                            children: [
                              SizedBox(height: 16.0),
                              Container(
                                margin: EdgeInsets.only(right: 12),
                                child: TextFormField(
                                  //validator: checkPasswordValidator,
                                    controller: question30Controller,
                                    keyboardType: TextInputType.text,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')), // Allow only alphabetic characters
                                    ],
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      labelText: 'Type Text',
                                      labelStyle: const TextStyle(
                                        fontSize: 15.0,
                                        color: AppTheme.grayColor,
                                      ),
                                    )),
                              ),
                              SizedBox(height: 16.0),
                            ],
                          ) : Container(),
                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectIndex16 != -1){
                                if (selectIndex16 == 3){
                                  if (question30Controller.text != ""){
                                    questionIndex = questionIndex + 1;
                                  }else{
                                    final snackBar = SnackBar(
                                      content: Container(
                                        margin: EdgeInsets.only(left: 20, right: 20),
                                        // Adjust left and right margins
                                        child: Text(
                                          'Please enter text.',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      backgroundColor: Colors.red,
                                      duration: Duration(seconds: 3),
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                  }
                                }else{
                                  questionIndex = questionIndex + 1;
                                }

                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ) :


            questionIndex == 38 ?

            Container(
              //height: 110,
              margin: EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 460,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex17 == pos
                                            ? Image.asset(
                                            'assets/selectRadio.png',
                                            width: 24, height: 24)
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unSelectRadio.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectIndex17 = pos;
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),

                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectIndex17 != -1){
                                questionIndex = questionIndex + 1;
                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ) :

            questionIndex == 39 ?
            Container(
              //height: 110,
              margin: EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 460,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex18 == pos
                                            ? Image.asset(
                                            'assets/selectRadio.png',
                                            width: 24, height: 24)
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unSelectRadio.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectIndex18 = pos;
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),

                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectIndex18 != -1){
                                questionIndex = questionIndex + 1;
                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ) :
            questionIndex == 40 ?
            Container(
              //height: 110,
              margin: EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 80,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex19 == pos
                                            ? Image.asset(
                                            'assets/selectRadio.png',
                                            width: 24, height: 24)
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unSelectRadio.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectIndex19 = pos;
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                          selectIndex19 == 0?
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20.0),
                              Container(
                                height: 40,
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: () {
                                          _selectDatepic(context);
                                        },
                                        child: Container(
                                          height: 40,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(left: 0),
                                                child: Text(
                                                    _startDate3 == null
                                                        ? 'Select Date'
                                                        : _startDate3.toString().substring(0, 10),
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black,
                                                    )),
                                              ),
                                              Icon(Icons.calendar_month_outlined,
                                                  color: Colors.black),
                                            ],
                                          ),
                                        ),
                                      ),

                                    ),
                                    const SizedBox(width: 10),
                                  ],
                                ),
                              ),// TextField Container
                              SizedBox(height: 16.0),
                            ],
                          ):Container(),
                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectIndex19 != -1){
                                if (selectIndex19 == 0){
                                  if (_startDate3 != null){
                                    questionIndex = questionIndex + 1;
                                  }else{
                                    final snackBar = SnackBar(
                                      content: Container(
                                        margin: EdgeInsets.only(left: 20, right: 20),
                                        // Adjust left and right margins
                                        child: Text(
                                          'Please select date.',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      backgroundColor: Colors.red,
                                      duration: Duration(seconds: 3),
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                  }
                                }else{
                                  questionIndex = questionIndex + 1;
                                }

                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ) :// T-1 EMI DATE


            questionIndex == 41 ?
            TextFieldNumberWidget(
              controller: question17Controller,
              onNextTap: () {
                if (question17Controller.text == "") {
                  final snackBar = SnackBar(
                    content: Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      // Adjust left and right margins
                      child: Text(
                        'Answer cannot be empty',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 3),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }

                else {
                  questionIndex = questionIndex + 1;
                  setState(() {

                  });
                }
              },

              onPreviousTap: () {
                questionIndex = questionIndex - 1;
                setState(() {

                });
              },

              questionMessage: questionList[questionIndex]['que_message'],
              questionName: questionList[questionIndex]['question'],

            ) :

            questionIndex == 42 ?

            Container(
              //height: 110,
              margin: EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 80,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex20 == pos
                                            ? Image.asset(
                                            'assets/selectRadio.png',
                                            width: 24, height: 24)
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unSelectRadio.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectIndex20 = pos;
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                          selectIndex20 == 0?
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20.0),
                              Container(
                                height: 40,
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: () {
                                          _selectDate4pic(context);
                                        },
                                        child: Container(
                                          height: 40,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(left: 0),
                                                child: Text(
                                                    _startDate4 == null
                                                        ? 'Select Date'
                                                        : _startDate4.toString().substring(0, 10),
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black,
                                                    )),
                                              ),
                                              Icon(Icons.calendar_month_outlined,
                                                  color: Colors.black),
                                            ],
                                          ),
                                        ),
                                      ),

                                    ),
                                    const SizedBox(width: 10),
                                  ],
                                ),
                              ),// TextField Container
                              SizedBox(height: 16.0),
                            ],
                          ):Container(),
                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectIndex20 != -1){
                                if (selectIndex20 == 0){
                                  if (_startDate4 != null){
                                    questionIndex = questionIndex + 1;
                                  }else{
                                    final snackBar = SnackBar(
                                      content: Container(
                                        margin: EdgeInsets.only(left: 20, right: 20),
                                        // Adjust left and right margins
                                        child: Text(
                                          'Please select date.',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      backgroundColor: Colors.red,
                                      duration: Duration(seconds: 3),
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                  }
                                }else{
                                  questionIndex = questionIndex + 1;
                                }

                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ) :
            questionIndex == 43 ?
            TextFieldNumberWidget(
              controller: question18Controller,
              onNextTap: () {
                if (question18Controller.text == "") {
                  final snackBar = SnackBar(
                    content: Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      // Adjust left and right margins
                      child: Text(
                        'Answer cannot be empty',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 3),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }

                else {
                  questionIndex = questionIndex + 1;
                  setState(() {

                  });
                }
              },

              onPreviousTap: () {
                questionIndex = questionIndex - 1;
                setState(() {

                });
              },

              questionMessage: questionList[questionIndex]['que_message'],
              questionName: questionList[questionIndex]['question'],

            ) :
            questionIndex == 44 ?
            Container(
              //height: 110,
              margin: EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 80,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex21 == pos
                                            ? Image.asset(
                                            'assets/selectRadio.png',
                                            width: 24, height: 24)
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unSelectRadio.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectIndex21 = pos;
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                          selectIndex21 == 0?
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20.0),
                              Container(
                                height: 40,
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: () {
                                          _selectDate5pic(context);
                                        },
                                        child: Container(
                                          height: 40,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(left: 0),
                                                child: Text(
                                                    _startDate5 == null
                                                        ? 'Select Date'
                                                        : _startDate5.toString().substring(0, 10),
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black,
                                                    )),
                                              ),
                                              Icon(Icons.calendar_month_outlined,
                                                  color: Colors.black),
                                            ],
                                          ),
                                        ),
                                      ),

                                    ),
                                    const SizedBox(width: 10),
                                  ],
                                ),
                              ),// TextField Container
                              SizedBox(height: 16.0),
                            ],
                          ):Container(),
                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectIndex21 != -1){
                                if (selectIndex21 == 0){
                                  if (_startDate5 != null){
                                    questionIndex = questionIndex + 1;
                                  }else{
                                    final snackBar = SnackBar(
                                      content: Container(
                                        margin: EdgeInsets.only(left: 20, right: 20),
                                        // Adjust left and right margins
                                        child: Text(
                                          'Please select date.',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      backgroundColor: Colors.red,
                                      duration: Duration(seconds: 3),
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                  }
                                }else{
                                  questionIndex = questionIndex + 1;
                                }

                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ) :


            questionIndex == 45 ?
            TextFieldNumberWidget(
              controller: question19Controller,
              onNextTap: () {
                if (question19Controller.text == "") {
                  final snackBar = SnackBar(
                    content: Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      // Adjust left and right margins
                      child: Text(
                        'Answer cannot be empty',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 3),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }

                else {
                  questionIndex = questionIndex + 1;
                  setState(() {

                  });
                }
              },

              onPreviousTap: () {
                questionIndex = questionIndex - 1;
                setState(() {

                });
              },

              questionMessage: questionList[questionIndex]['que_message'],
              questionName: questionList[questionIndex]['question'],

            )  ://T-3 EMI

            questionIndex == 46 ?
            Container(
              //height: 110,
              margin: EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 460,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex22 == pos
                                            ? Image.asset(
                                            'assets/selectRadio.png',
                                            width: 24, height: 24)
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unSelectRadio.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectIndex22 = pos;
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),

                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectIndex22 != -1){
                                questionIndex = questionIndex + 1;
                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ) :


            questionIndex == 47 ?
            Container(
              //height: 110,
              margin: EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 460,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex23 == pos
                                            ? Image.asset(
                                            'assets/selectRadio.png',
                                            width: 24, height: 24)
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unSelectRadio.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectIndex23 = pos;
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),

                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectIndex23 != -1){
                                questionIndex = questionIndex + 1;
                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ) :

            questionIndex == 48 ?
            TextFieldStringWidget(
              controller: question20Controller,
              onNextTap: () {
                if (question20Controller.text == "") {
                  final snackBar = SnackBar(
                    content: Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      // Adjust left and right margins
                      child: Text(
                        'Please enter a valid name',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 3),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }

                else {
                  questionIndex = questionIndex + 1;
                  setState(() {

                  });
                }
              },

              onPreviousTap: () {
                questionIndex = questionIndex - 1;
                setState(() {

                });
              },

              questionMessage: questionList[questionIndex]['que_message'],
              questionName: questionList[questionIndex]['question'],

            ) :
            questionIndex == 49 ?
            Container(
              //height: 110,
              margin: EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 460,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex24 == pos
                                            ? Image.asset(
                                            'assets/selectRadio.png',
                                            width: 24, height: 24)
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unSelectRadio.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectIndex24 = pos;
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),

                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectIndex24 != -1){
                                questionIndex = questionIndex + 1;
                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ) :
            questionIndex == 50 ?
            Container(
              //height: 110,
              margin: EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 460,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex25 == pos
                                            ? Image.asset(
                                            'assets/selectRadio.png',
                                            width: 24, height: 24)
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unSelectRadio.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectIndex25 = pos;
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),

                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectIndex25 != -1){
                                questionIndex = questionIndex + 1;
                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ) :
            questionIndex == 51 ?
            Container(
              //height: 110,
              margin: EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 460,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex26 == pos
                                            ? Image.asset(
                                            'assets/selectRadio.png',
                                            width: 24, height: 24)
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unSelectRadio.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectIndex26 = pos;
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),

                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectIndex26 != -1){
                                questionIndex = questionIndex + 1;
                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ) :


            questionIndex == 52 ?
            Container(
              //height: 110,
              margin: EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 460,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex27 == pos
                                            ? Image.asset(
                                            'assets/selectRadio.png',
                                            width: 24, height: 24)
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unSelectRadio.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectIndex27 = pos;
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),

                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectIndex27 != -1){
                                questionIndex = questionIndex + 1;
                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ) :// done


            questionIndex == 53 ?

            Container(
              margin: EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      height: 300,

                      child: ListView.builder(
                          padding: EdgeInsets.only(bottom: 16.0),
                          itemCount: questionList[questionIndex]['options']
                              .length,
                          shrinkWrap: true,
                          //physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int pos) {
                            return Padding(
                                padding: const EdgeInsets.only(
                                  left: 0.0, top: 8.0, bottom: 8.0,),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        selectedIndices6.contains(pos)
                                            ? InkWell(
                                            onTap: (){
                                              if (selectedIndices6.contains(
                                                  pos)) {
                                                selectedIndices6.remove(pos);
                                              }
                                              setState(() {

                                              });
                                            },
                                            child:Image.asset('assets/check.png',
                                                width: 24, height: 24))
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unCheck.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectedIndices6.add(pos);
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                    selectedIndices6.contains(pos) ?
                                    Container(
                                      margin: EdgeInsets.only(right: 12),
                                      child: TextFormField(
                                        //validator: checkPasswordValidator,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter.digitsOnly, // Allow only numbers
                                          ],
                                          controller: question31Controller,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.zero,
                                            labelText: 'Mob.Number',
                                            labelStyle: const TextStyle(
                                              fontSize: 15.0,
                                              color: AppTheme.grayColor,
                                            ),
                                          )),
                                    ) : Container(),
                                  ],
                                )
                            );
                          }),
                    ), // TextField Container
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectedIndices6.isNotEmpty && question31Controller.text != ""){
                                questionIndex = questionIndex + 1;
                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option and enter number.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ) :
            questionIndex == 54 ?
            TextFieldNumberWidget(
              controller: question21Controller,
              onNextTap: () {
                if (question21Controller.text == "") {
                  final snackBar = SnackBar(
                    content: Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      // Adjust left and right margins
                      child: Text(
                        'Answer cannot be empty',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 3),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }

                else {
                  questionIndex = questionIndex + 1;
                  setState(() {

                  });
                }
              },

              onPreviousTap: () {
                questionIndex = questionIndex - 1;
                setState(() {

                });
              },

              questionMessage: questionList[questionIndex]['que_message'],
              questionName: questionList[questionIndex]['question'],

            ) :

            questionIndex == 55 ?

            Container(
              //height: 110,
              margin: EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 460,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex28 == pos
                                            ? Image.asset(
                                            'assets/selectRadio.png',
                                            width: 24, height: 24)
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unSelectRadio.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectIndex28 = pos;
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),

                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectIndex28 != -1){
                                questionIndex = questionIndex + 1;
                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ) :
            questionIndex == 56 ?
            Container(
              //height: 110,
              margin: EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 460,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex29 == pos
                                            ? Image.asset(
                                            'assets/selectRadio.png',
                                            width: 24, height: 24)
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unSelectRadio.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectIndex29 = pos;
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),

                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectIndex29 != -1){
                                questionIndex = questionIndex + 1;
                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ) :

            questionIndex == 57 ?
            Container(
              //height: 110,
              margin: EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 460,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex30 == pos
                                            ? Image.asset(
                                            'assets/selectRadio.png',
                                            width: 24, height: 24)
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unSelectRadio.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectIndex30 = pos;
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),

                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectIndex30 != -1){
                                questionIndex = questionIndex + 1;
                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ) :// done
            questionIndex == 58 ?
            Container(
              //height: 110,
              margin: EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 460,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex31 == pos
                                            ? Image.asset(
                                            'assets/selectRadio.png',
                                            width: 24, height: 24)
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unSelectRadio.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectIndex31 = pos;
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),

                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectIndex31 != -1){
                                questionIndex = questionIndex + 1;
                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ) ://31

            questionIndex == 59 ?
            Container(
              //height: 110,
              margin: EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 460,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex32 == pos
                                            ? Image.asset(
                                            'assets/selectRadio.png',
                                            width: 24, height: 24)
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unSelectRadio.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectIndex32 = pos;
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),

                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectIndex32 != -1){
                                questionIndex = questionIndex + 1;
                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ) :
            questionIndex == 60 ?
            Container(
              //height: 110,
              margin: EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 460,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex33 == pos
                                            ? Image.asset(
                                            'assets/selectRadio.png',
                                            width: 24, height: 24)
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unSelectRadio.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectIndex33 = pos;
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),

                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectIndex33 != -1){
                                questionIndex = questionIndex + 1;
                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ) :


            questionIndex == 61 ?
            Container(
              //height: 110,
              margin: EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 460,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex34 == pos
                                            ? Image.asset(
                                            'assets/selectRadio.png',
                                            width: 24, height: 24)
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unSelectRadio.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectIndex34 = pos;
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),

                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectIndex34 != -1){
                                questionIndex = questionIndex + 1;
                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ) :
            questionIndex == 62 ?
            Container(
              //height: 110,
              margin: EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 460,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex35 == pos
                                            ? Image.asset(
                                            'assets/selectRadio.png',
                                            width: 24, height: 24)
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unSelectRadio.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectIndex35 = pos;
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),

                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectIndex35 != -1){
                                questionIndex = questionIndex + 1;
                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ) :

            questionIndex == 63 ?
            Container(
              //height: 110,
              margin: EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 460,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex36 == pos
                                            ? Image.asset(
                                            'assets/selectRadio.png',
                                            width: 24, height: 24)
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unSelectRadio.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectIndex36 = pos;
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),

                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectIndex36 != -1){
                                questionIndex = questionIndex + 1;
                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ) :
            questionIndex == 64 ?

            Container(
              //height: 110,
              margin: EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 460,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex37 == pos
                                            ? Image.asset(
                                            'assets/selectRadio.png',
                                            width: 24, height: 24)
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unSelectRadio.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectIndex37 = pos;
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),

                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectIndex37 != -1){
                                questionIndex = questionIndex + 1;
                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ) :
            questionIndex == 65 ?
            Container(
              //height: 110,
              margin: EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 460,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex38 == pos
                                            ? Image.asset(
                                            'assets/selectRadio.png',
                                            width: 24, height: 24)
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unSelectRadio.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectIndex38 = pos;
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),

                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectIndex38 != -1){
                                questionIndex = questionIndex + 1;
                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ) :


            questionIndex == 66 ?

            Container(
              //height: 110,
              margin: EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 460,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex39 == pos
                                            ? Image.asset(
                                            'assets/selectRadio.png',
                                            width: 24, height: 24)
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unSelectRadio.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectIndex39 = pos;
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),

                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectIndex39 != -1){
                                questionIndex = questionIndex + 1;
                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ) :
            questionIndex == 67 ?
            Container(
              //height: 110,
              margin: EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 460,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex40 == pos
                                            ? Image.asset(
                                            'assets/selectRadio.png',
                                            width: 24, height: 24)
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unSelectRadio.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectIndex40 = pos;
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),

                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectIndex40 != -1){
                                questionIndex = questionIndex + 1;
                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ) :
            questionIndex == 68 ?
            Container(
              //height: 110,
              margin: EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 460,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex41 == pos
                                            ? Image.asset(
                                            'assets/selectRadio.png',
                                            width: 24, height: 24)
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unSelectRadio.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectIndex41 = pos;
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),

                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectIndex41 != -1){
                                questionIndex = questionIndex + 1;
                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ) :
            questionIndex == 69 ?
            Container(
              //height: 110,
              margin: EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 460,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex42 == pos
                                            ? Image.asset(
                                            'assets/selectRadio.png',
                                            width: 24, height: 24)
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unSelectRadio.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectIndex42 = pos;
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),

                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectIndex42 != -1){
                                questionIndex = questionIndex + 1;
                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ) :

            questionIndex == 70 ?
            Container(
              //height: 110,
              margin: EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 460,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex43 == pos
                                            ? Image.asset(
                                            'assets/selectRadio.png',
                                            width: 24, height: 24)
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unSelectRadio.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectIndex43 = pos;
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),

                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectIndex43 != -1){
                                questionIndex = questionIndex + 1;
                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ) :


            questionIndex == 71 ?
            Container(
              //height: 110,
              margin: EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 460,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex44 == pos
                                            ? Image.asset(
                                            'assets/selectRadio.png',
                                            width: 24, height: 24)
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unSelectRadio.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectIndex44 = pos;
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),

                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectIndex44 != -1){
                                questionIndex = questionIndex + 1;
                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ) :


            questionIndex == 72 ?
            Container(
              //height: 110,
              margin: EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 460,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex45 == pos
                                            ? Image.asset(
                                            'assets/selectRadio.png',
                                            width: 24, height: 24)
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unSelectRadio.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectIndex45 = pos;
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),

                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectIndex45 != -1){
                                questionIndex = questionIndex + 1;
                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ) :

            questionIndex == 73 ?


            Container(
              margin: EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      height: 300,

                      child: ListView.builder(
                          padding: EdgeInsets.only(bottom: 16.0),
                          itemCount: questionList[questionIndex]['options']
                              .length,
                          shrinkWrap: true,
                          //physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int pos) {
                            return Padding(
                                padding: const EdgeInsets.only(
                                  left: 0.0, top: 8.0, bottom: 8.0,),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        selectedIndices7.contains(pos)
                                            ? InkWell(
                                            onTap: (){
                                              if (selectedIndices7.contains(
                                                  pos)) {
                                                selectedIndices7.remove(pos);
                                              }
                                              setState(() {

                                              });
                                            },
                                            child:Image.asset('assets/check.png',
                                                width: 24, height: 24))
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unCheck.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectedIndices7.add(pos);
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                    // selectedIndices7.contains(pos) ?
                                    // Container(
                                    //   margin: EdgeInsets.only(right: 12),
                                    //   child: TextFormField(
                                    //     //validator: checkPasswordValidator,
                                    //       controller: number,
                                    //       decoration: InputDecoration(
                                    //         contentPadding: EdgeInsets.zero,
                                    //         labelText: 'Monthly Income',
                                    //         labelStyle: const TextStyle(
                                    //           fontSize: 15.0,
                                    //           color: AppTheme.grayColor,
                                    //         ),
                                    //       )),
                                    // ) : Container(),
                                  ],
                                )
                            );
                          }),
                    ), // TextField Container
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectedIndices7.isNotEmpty){
                                questionIndex = questionIndex + 1;
                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ) ://done

            questionIndex == 74 ?
            Container(
              //height: 110,
              margin: EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 460,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex46 == pos
                                            ? Image.asset(
                                            'assets/selectRadio.png',
                                            width: 24, height: 24)
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unSelectRadio.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectIndex46 = pos;
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),

                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectIndex46 != -1){
                                questionIndex = questionIndex + 1;
                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ) :

            questionIndex == 75 ?
            Container(
              //height: 110,
              margin: EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 460,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex47 == pos
                                            ? Image.asset(
                                            'assets/selectRadio.png',
                                            width: 24, height: 24)
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unSelectRadio.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectIndex47 = pos;
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),

                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectIndex47 != -1){
                                questionIndex = questionIndex + 1;
                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ) :


            questionIndex == 76 ?

            Container(
              //height: 110,
              margin: EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 460,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex48 == pos
                                            ? Image.asset(
                                            'assets/selectRadio.png',
                                            width: 24, height: 24)
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unSelectRadio.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectIndex48 = pos;
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),

                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectIndex48 != -1){
                                questionIndex = questionIndex + 1;
                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ) :


            questionIndex == 77 ?


            Container(
              //height: 110,
              margin: EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 460,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex49 == pos
                                            ? Image.asset(
                                            'assets/selectRadio.png',
                                            width: 24, height: 24)
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unSelectRadio.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectIndex49 = pos;
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),

                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectIndex49 != -1){
                                questionIndex = questionIndex + 1;
                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ) ://done


            questionIndex == 78 ?

            TextFieldStringWidget(
              controller: question22Controller,
              onNextTap: () {
                if (question22Controller.text == "") {
                  final snackBar = SnackBar(
                    content: Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      // Adjust left and right margins
                      child: Text(
                        'Field is required',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 3),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }

                else {
                  questionIndex = questionIndex + 1;
                  setState(() {

                  });
                }
              },

              onPreviousTap: () {
                questionIndex = questionIndex - 1;
                setState(() {

                });
              },

              questionMessage: questionList[questionIndex]['que_message'],
              questionName: questionList[questionIndex]['question'],

            ) :
            questionIndex == 79 ?

            Container(
              //height: 110,
              margin: EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 80,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex50 == pos
                                            ? Image.asset(
                                            'assets/selectRadio.png',
                                            width: 24, height: 24)
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unSelectRadio.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectIndex50 = pos;
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                          selectIndex50 == 0 ?
                          Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(child: InkWell(
                                    onTap: () async {



                                      final List<XFile> images = await picker.pickMultiImage();
                                      imageList=images;
                                      setState(() {

                                      });

                                      _uploadFiles();









                                    },
                                    child: Container(
                                        margin:
                                        const EdgeInsets.only(left: 0,right: 8,top: 8),
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: AppTheme.buttonOrangeColor,
                                            borderRadius: BorderRadius.circular(5)),
                                        height: 45,
                                        child: const Center(
                                          child: Text('Browse',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white)),
                                        )),
                                  )),
                                  const SizedBox(width: 10),
                                ],
                              ),

                              SizedBox(height: 10),

                              imageList.length==0?Container(): Container(
                                height: 60,
                                child: ListView.builder(
                                    itemCount: imageList.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (BuildContext context,int pos)

                                    {
                                      return Row(
                                        children: [

                                          Container(
                                            width: 55,
                                            height: 55,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                image: DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: FileImage(
                                                        File(imageList[pos].path)
                                                    )
                                                )

                                            ),
                                          ),


                                          SizedBox(width: 10),

                                        ],
                                      );
                                    }


                                ),
                              )

                            ],
                          ): Container(),
                          // selectIndex50 == 1 ?
                          // Column(
                          //   children: [
                          //     SizedBox(height: 20.0),
                          //     Container(
                          //       height: 40,
                          //       width: double.infinity,
                          //       child: Row(
                          //         children: [
                          //           Expanded(
                          //             flex: 1,
                          //             child: InkWell(
                          //               onTap: () {
                          //                 //_selectStartDate(context);
                          //               },
                          //               child: Container(
                          //                 height: 40,
                          //                 child: Row(
                          //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //                   children: [
                          //                     Padding(
                          //                       padding: EdgeInsets.only(left: 0),
                          //                       child: Text(
                          //                           lucData == "13"
                          //                               ? 'Select LUC'
                          //                               : lucData.toString(),
                          //                           style: TextStyle(
                          //                             fontSize: 14,
                          //                             color: Colors.black,
                          //                           )),
                          //                     ),
                          //                     Icon(Icons.arrow_drop_down,
                          //                         color: Colors.black),
                          //                   ],
                          //                 ),
                          //               ),
                          //             ),
                          //
                          //           ),
                          //           const SizedBox(width: 10),
                          //         ],
                          //       ),
                          //     ),
                          //     SizedBox(height: 20.0),
                          //     Container(
                          //       height: 40,
                          //       width: double.infinity,
                          //       child: Row(
                          //         children: [
                          //           Expanded(
                          //             flex: 1,
                          //             child: InkWell(
                          //               onTap: () {
                          //                 // _selectStartDate(context);
                          //               },
                          //               child: Container(
                          //                 height: 40,
                          //                 child: Row(
                          //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //                   children: [
                          //                     Padding(
                          //                       padding: EdgeInsets.only(left: 0),
                          //                       child: Text(
                          //                           borrowerData == "14"
                          //                               ? 'Select Borrower'
                          //                               : borrowerData.toString(),
                          //                           style: TextStyle(
                          //                             fontSize: 14,
                          //                             color: Colors.black,
                          //                           )),
                          //                     ),
                          //                     Icon(Icons.arrow_drop_down,
                          //                         color: Colors.black),
                          //                   ],
                          //                 ),
                          //               ),
                          //             ),
                          //
                          //           ),
                          //           const SizedBox(width: 10),
                          //         ],
                          //       ),
                          //     )
                          //   ],
                          // ): Container(),
                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectIndex50 != -1){
                                questionIndex = questionIndex + 1;
                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            )  ://Image upload api calling pending
            questionIndex == 80 ?
            Container(
              //height: 110,
              margin: EdgeInsets.only(
                left: 15, right: 15, top: 15, bottom: 15,),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(questionList[questionIndex]['que_message'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 460,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex51 == pos
                                            ? Image.asset(
                                            'assets/selectRadio.png',
                                            width: 24, height: 24)
                                            : InkWell(
                                          child: Image.asset(
                                              'assets/unSelectRadio.png',
                                              width: 24,
                                              height: 24),
                                          onTap: () {
                                            setState(() {
                                              selectIndex51 = pos;
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                              questionList[questionIndex]['options'][pos]['option'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),

                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 1;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.blueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Previous',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),),
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectIndex51 != -1){
                                questionIndex = questionIndex + 1;
                              }else{
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8, right: 16, top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ) :
            questionIndex == 81 ?

            TextFieldStringWidget(
              controller: question23Controller,
              onNextTap: () {
                if (question23Controller.text == "") {
                  final snackBar = SnackBar(
                    content: Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      // Adjust left and right margins
                      child: Text(
                        'Field is required',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 3),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }

                else {
                  questionIndex = questionIndex + 1;
                  setState(() {

                  });
                }
              },

              onPreviousTap: () {
                questionIndex = questionIndex - 1;
                setState(() {

                });
              },

              questionMessage: questionList[questionIndex]['que_message'],
              questionName: questionList[questionIndex]['question'],

            ) :
            TextFieldStringWidget(
              controller: question24Controller,
              onNextTap: () {
                if (question24Controller.text == "") {
                  final snackBar = SnackBar(
                    content: Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      // Adjust left and right margins
                      child: Text(
                        'Field is required',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 3),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }

                else {
                  questionIndex = questionIndex + 1;
                  setState(() {

                  });
                }
              },

              onPreviousTap: () {
                questionIndex = questionIndex - 1;
                setState(() {

                });
              },

              questionMessage: questionList[questionIndex]['que_message'],
              questionName: questionList[questionIndex]['question'],

            )


        ),
      ),
    );
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    questionList = widget.surveyDataList[0]['questions'];
    Future.delayed(Duration(seconds: 0), () {
      print(widget.surveyDataList);
    });


    print(questionList.length.toString());
  }

  String? textValidation(String? value) {
    if (value!.isEmpty) {
      return 'Required field';
    }
    return null;
  }



  submitAnswers() async {

    List<dynamic> answers=[];
    FocusScope.of(context).unfocus();
    APIDialog.showAlertDialog(context, 'Please wait...');


   answers.add({'_id':questionList[questionIndex]['_id'],'answer':question1Controller.text});
   answers.add({'_id':questionList[questionIndex]['_id'],'answer':question2Controller.text});
   // Do for all answers according to type of widget






    ApiBaseHelper helper = ApiBaseHelper();
    var response =
    await helper.postAPI('Avanti/SubmitAppSurvey', answers, context);
     Navigator.pop(context);
    var responseJSON = json.decode(response.body);
    //print(responseJSON);

    if (responseJSON['code'] == 200) {
      Toast.show("success !!",
          duration: Toast.lengthLong,
          gravity: Toast.bottom,
          backgroundColor: Colors.green);

      Navigator.pop(context);
    } else {
      Toast.show(responseJSON['message'],
          duration: Toast.lengthLong,
          gravity: Toast.bottom,
          backgroundColor: Colors.red);
    }
  }





  _uploadFiles() async {
    APIDialog.showAlertDialog(context, 'Uploading Images...');
    // String fileName = xFile.path.split('/').last;
    FormData? formData= FormData.fromMap({
      "Id": "5512341709435",
      "artifactType": "LUC",
    });

    for (int i = 0; i <imageList.length; i++) {
      var path = imageList[i].path.toString();
      formData.files.addAll([
        MapEntry("file", await MultipartFile.fromFile(path, filename: path))
      ]);
    }

    Dio dio = Dio();
    dio.options.headers['Content-Type'] = 'multipart/form-data';
   // dio.options.headers['Authorization'] = "Bearer " + AppModel.token;
    print(AppConstant.appBaseURL + "Avanti/saveImage");
    var response = await dio.post(
        AppConstant.appBaseURL + "Avanti/saveImage",
        data: formData);
    print(response.data);
    Navigator.pop(context);
    if (response.data['status']) {
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
}
