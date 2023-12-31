import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qsurvey_flutter/widgets/textfield_string_widget.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

import '../network/Utils.dart';
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
  List<TextEditingController> _controllerTab4=[];
  List<XFile> imageList=[];
  List<XFile> pickedImage=[];
  List<XFile> imageList1=[];
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
  var question32Controller = TextEditingController();
  var question33Controller = TextEditingController();
  var question34Controller = TextEditingController();
  var question35Controller = TextEditingController();
  var question36Controller = TextEditingController();
  var question37Controller = TextEditingController();
  var question38Controller = TextEditingController();
  var question39Controller = TextEditingController();
  var question40Controller = TextEditingController();
  var question41Controller = TextEditingController();
  var question42Controller = TextEditingController();
  var question43Controller = TextEditingController();
  var question44Controller = TextEditingController();
  var question45Controller = TextEditingController();
  var question46Controller = TextEditingController();
  var question47Controller = TextEditingController();
  var question48Controller = TextEditingController();
  var number = TextEditingController();
  var text = TextEditingController();
  List<dynamic> questionList = [];
  List<dynamic> option = [];
  //List<String> selectedIndices = [];
  Set<String> selectedIndices = {};
  Set<String> selectedIndices2 = {};
  List<int> selectedIndicesInt2 = [];
  Set<String> selectedIndices3 = {};
  Set<String> selectedIndices4 = {};
  List<int> selectedIndicesInt4 = [];
  Set<String> selectedIndices5 = {};
  List<String> selectedIndicesInt5 = [];
  Set<String> selectedIndices6 = {};
  List<int> selectedIndicesInt6 = [];
  Set<String> selectedIndices7 = {};
  List<int> selectedIndicesInt7 = [];

  var selectDate = '12';
  var lucData = '13';
  var borrowerData = '14';
  String selectIndex = "-1";
  String selectIndex1 = "-1";
  String selectIndex2 = "-1";
  String selectIndex4 = "-1";
  String selectIndex5 = "-1";
  String selectIndex6 = "-1";
  String selectIndex7 = "-1";
  String selectIndex8 = "-1";
  String selectIndex9 = "-1";
  String selectIndex10 = "-1";
  String selectIndex11 = "-1";
  String selectIndex12 = "-1";
  String selectIndex13 = "-1";
  String selectIndex14 = "-1";
  String selectIndex15 = "-1";
  String selectIndex16 = "-1";
  String selectIndex17 = "-1";
  String selectIndex18 = "-1";
  String selectIndex19 = "-1";
  String selectIndex20 = "-1";
  String selectIndex21 = "-1";
  String selectIndex22 = "-1";
  String selectIndex23 = "-1";
  String selectIndex24 = "-1";
  String selectIndex25 = "-1";
  String selectIndex26 = "-1";
  String selectIndex27 = "-1";
  String selectIndex28 = "-1";
  String selectIndex29 = "-1";
  String selectIndex30 = "-1";
  String selectIndex31 = "-1";
  String selectIndex32 = "-1";
  String selectIndex33 = "-1";
  String selectIndex34 = "-1";
  String selectIndex35 = "-1";
  String selectIndex36 = "-1";
  String selectIndex37 = "-1";
  String selectIndex38 = "-1";
  String selectIndex39 = "-1";
  String selectIndex40 = "-1";
  String selectIndex41 = "-1";
  String selectIndex42 = "-1";
  String selectIndex43 = "-1";
  String selectIndex44 = "-1";
  String selectIndex45 = "-1";
  String selectIndex46 = "-1";
  String selectIndex47 = "-1";
  String selectIndex48 = "-1";
  String selectIndex49 = "-1";
  String selectIndex50 = "-1";
  String selectIndex51 = "-1";
  final ImagePicker picker = ImagePicker();
  int questionIndex = 0;
  late bool isSelected;
  DateTime? _startDate = null;
  DateTime? _startDate2 = null;
  DateTime? _startDate3 = null;
  DateTime? _startDate4 = null;
  DateTime? _startDate5 = null;

  String otherText15 = " ";
  String flagStatus = "12";
  String flagStatus2 = "13";
  int selectIndexCap = -1;
  int selectIndexCap2 = -1;
  Color _currentColor = Colors.white;
  String lastItem = '';
  List<Map<String, dynamic>> notCapturedList = [
    {'id':1, 'name':'Misutilization - LUC Not Captured'},
    {'id':2, 'name':'LUC Not Captured'},
  ];
  List<Map<String, dynamic>>  notCaptured2List = [
    {'name':'Borrower - Denied to show'},
    {'name':'LUC Not available within the area of coverage'},
    {'name':'LUC Product already sold'},
    {'name':'Business closed'},
    {'name':'Moveable Business - Transport, Hawkers, etc.'},
    {'name':'Shuttering Business'},
    {'name':'Weather Condition'},
    {'name':'Live Stock - Grazing'},
  ];
  List<Map<String, dynamic>>  notCaptured3List = [
    {'name':'Borrower - Denied to show'},
    {'name':'LUC Proof Not available i.e. Marriage, Education'},
    {'name':'Money Not Used'},
    {'name':'LUC Not available within the area of coverage - 2km'},
  ];
  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? pickedStartDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime
          .now()
          .year - 5),
      lastDate: DateTime
          .now(),
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
      lastDate: DateTime
          .now(),
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
      lastDate: DateTime
          .now(),
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
      lastDate: DateTime
          .now(),
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
      lastDate: DateTime
          .now(),
    );

    if (pickedStartDate != null && pickedStartDate != _startDate5) {
      setState(() {
        _startDate5 = pickedStartDate;
      });
    }
  }


  Widget build(BuildContext context) {
    ToastContext().init(context);
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
            body:  questionList.length==0?Container():


            questionIndex == 0 ?

            Container(
              //height: 110,
              margin: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15,top: 15, bottom: 30),
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
                      margin: EdgeInsets.only(right: 12),
                      child: TextFormField(
                        //validator: textValidation,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                            //LengthLimitingTextInputFormatter(14), // Allow only numbers
                          ],
                          controller: question1Controller,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            labelText: 'Enter here',
                            labelStyle: const TextStyle(
                              fontSize: 15.0,
                              color: AppTheme.grayColor,
                            ),
                          )),
                    ),// TextField Container
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {

                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0,right: 16,top: 8),
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
                            if (question1Controller.text == "") {

                              final snackBar = SnackBar(
                                content: Container(
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  // Adjust left and right margins
                                  child: Text(
                                    'Please enter loan number',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                backgroundColor: Colors.red,
                                duration: Duration(seconds: 3),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            }else if(question1Controller.text.length < 12 || question1Controller.text.length > 14){
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
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8,right: 16,top: 8),
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
                    Text("Please Select Borrower Occupation/Income.",
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child:Column(
                        children: [
                          Container(
                            height: 180,

                            child: ListView.builder(
                                padding: EdgeInsets.only(bottom: 16.0),
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  _controllerTab1.add(TextEditingController());
                                  if(pos==questionList[questionIndex]['options']
                                      .length-1){

                                    _controllerTab1[pos].text="-";

                                  }
                                  final item = questionList[questionIndex]['options'][pos]['option'];


                                  return Padding(
                                      padding: const EdgeInsets.only(
                                        left: 0.0, top: 8.0, bottom: 8.0,),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              selectedIndices2.contains(item)
                                                  ? InkWell(
                                                  onTap: (){
                                                    if (selectedIndices2.contains(
                                                        item)) {
                                                      selectedIndices2.remove(item);
                                                      selectedIndicesInt2.remove(pos);
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

                                                    selectedIndices2.add(item);

                                                    selectedIndicesInt2.add(pos);


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

                                          selectedIndices2.contains(item) && questionList[questionIndex]['options'][pos]['option'] != "No"?
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
                          ),
                          selectedIndices2.contains("Any other Income") ? Column(
                            children: [
                              SizedBox(height: 0.0),
                              Container(
                                margin: EdgeInsets.only(right: 12),
                                child: TextFormField(
                                  //validator: checkPasswordValidator,
                                    controller: question47Controller,
                                    keyboardType: TextInputType.text,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')), // Allow only alphabetic characters
                                    ],
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      labelText: 'Enter text',
                                      labelStyle: const TextStyle(
                                        fontSize: 15.0,
                                        color: AppTheme.grayColor,
                                      ),
                                    )),
                              ),
                              SizedBox(height: 0.0),
                            ],
                          ) :Container(),// T
                        ],
                      ),
                    ),
                    // TextField Container
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
                              bool isValid = true;
                              for (int i = 0; i < selectedIndicesInt2.length; i++) {
                                int index = selectedIndicesInt2[i];
                                print(_controllerTab1[index].text);
                                if (_controllerTab1[index].text.isEmpty) {
                                  isValid = false;
                                  break;

                                }else{

                                }
                              }
                              if (isValid == true && selectedIndicesInt2.isNotEmpty) {
                                if (selectedIndices2.contains("Any other Income")){
                                  if (question47Controller.text == ""){
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
                                  }else{
                                    questionIndex = questionIndex + 1;
                                    isValid = false;
                                  }
                                }else{
                                  questionIndex = questionIndex + 1;
                                  isValid = false;
                                }


                              } else {

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
                    Text("Please Select Spouse Occuption/Income",
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.blackColor,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child:Column(
                        children: [
                          Container(
                            height: 180,

                            child: ListView.builder(
                                padding: EdgeInsets.only(bottom: 16.0),
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  _controllerTab2.add(TextEditingController());
                                  if(pos==questionList[questionIndex]['options']
                                      .length-1){

                                    _controllerTab2[pos].text="-";

                                  }
                                  final item = questionList[questionIndex]['options'][pos]['option'];
                                  return Padding(
                                      padding: const EdgeInsets.only(
                                        left: 0.0, top: 8.0, bottom: 8.0,),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              selectedIndices4.contains(item)
                                                  ? InkWell(
                                                  onTap: (){
                                                    if (selectedIndices4.contains(
                                                        item)) {
                                                      selectedIndices4.remove(item);
                                                      selectedIndicesInt4.remove(pos);
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
                                                    selectedIndices4.add(item);
                                                    selectedIndicesInt4.add(pos);
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
                                          selectedIndices4.contains(item) && questionList[questionIndex]['options'][pos]['option'] != "No"?
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
                          ),
                          selectedIndices4.contains("Any Other Income") ? Column(
                            children: [
                              SizedBox(height: 0.0),
                              Container(
                                margin: EdgeInsets.only(right: 12),
                                child: TextFormField(
                                  //validator: checkPasswordValidator,
                                    controller: question48Controller,
                                    keyboardType: TextInputType.text,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')), // Allow only alphabetic characters
                                    ],
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      labelText: 'Enter text',
                                      labelStyle: const TextStyle(
                                        fontSize: 15.0,
                                        color: AppTheme.grayColor,
                                      ),
                                    )),
                              ),
                              SizedBox(height: 0.0),
                            ],
                          ) :Container(),// T
                        ],
                      ),
                    ),
                    // TextField Container
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
                            // setState(() {
                            //   if (selectedIndices4.isNotEmpty && _controllerTab2.isNotEmpty){
                            //     questionIndex = questionIndex + 1;
                            //   }else{
                            //     final snackBar = SnackBar(
                            //       content: Container(
                            //         margin: EdgeInsets.only(left: 20, right: 20),
                            //         // Adjust left and right margins
                            //         child: Text(
                            //           'Please select the option and enter amount.',
                            //           textAlign: TextAlign.center,
                            //         ),
                            //       ),
                            //       backgroundColor: Colors.red,
                            //       duration: Duration(seconds: 3),
                            //     );
                            //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            //   }
                            // });
                            setState(() {
                              bool isValid = true;
                              for (int i = 0; i < selectedIndicesInt4.length; i++) {
                                int index = selectedIndicesInt4[i];
                                if (_controllerTab2[index].text.isEmpty) {
                                  isValid = false;
                                  break;

                                }
                              }
                              if (isValid == true && selectedIndicesInt4.isNotEmpty) {
                                if (selectedIndices4.contains("Any Other Income")){
                                  if (question48Controller.text == ""){
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
                                  }else{
                                    questionIndex = questionIndex + 1;
                                    isValid = false;
                                  }
                                }else{
                                  questionIndex = questionIndex + 1;
                                  isValid = false;
                                }


                              } else {
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
            questionIndex == 8 ?
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

            questionIndex == 9 ?
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

            questionIndex == 10 ?

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
            questionIndex == 11 ?
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


            questionIndex == 12 ?

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


            questionIndex == 13 ?

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
                                  final index = questionList[questionIndex]['options'][pos]['option'];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex == index
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
                                              selectIndex = index;
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
                          selectIndex == "-1" ?
                          Container() : selectIndex != "No"? Column(
                            children: [
                              SizedBox(height: 16.0),
                              Container(
                                margin: EdgeInsets.only(right: 12),
                                child: TextFormField(
                                  //validator: checkPasswordValidator,
                                    controller: question27Controller,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly, // Allow only numbers
                                    ],
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      labelText: 'Land count',
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
                              if (selectIndex != "-1"){
                                if (selectIndex != "No"){
                                  if (question27Controller.text != ""){
                                    questionIndex = questionIndex + 1;
                                  }else{
                                    final snackBar = SnackBar(
                                      content: Container(
                                        margin: EdgeInsets.only(left: 20, right: 20),
                                        // Adjust left and right margins
                                        child: Text(
                                          'Enter count.',
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
            ) :// 13 index  land



            questionIndex == 14 ?
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
                                  final index = questionList[questionIndex]['options'][pos]['option'];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex1 == index
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
                                              selectIndex1 = index;
                                              print(selectIndex1);
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
                          selectIndex1 == "-1" ?
                          Container() : selectIndex1 != "No"? Column(
                            children: [
                              SizedBox(height: 16.0),
                              Container(
                                margin: EdgeInsets.only(right: 12),
                                child: TextFormField(
                                  //validator: checkPasswordValidator,
                                    controller: question31Controller,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly, // Allow only numbers
                                    ],
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      labelText: 'Land count',
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
                              if (selectIndex1 != "-1"){
                                if (selectIndex1 != "No"){
                                  if (question31Controller.text != ""){
                                    questionIndex = questionIndex + 1;
                                  }else{
                                    final snackBar = SnackBar(
                                      content: Container(
                                        margin: EdgeInsets.only(left: 20, right: 20),
                                        // Adjust left and right margins
                                        child: Text(
                                          'Enter count.',
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


            questionIndex == 15 ?


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

                      child: Column(
                        children: [
                          Container(
                            height: 160,

                            child: ListView.builder(
                                padding: EdgeInsets.only(bottom: 0.0),
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  final index = questionList[questionIndex]['options'][pos]['option'];

                                  //otherText15 = questionList[questionIndex]['options'][pos].toString();
                                  return Padding(
                                      padding: const EdgeInsets.only(
                                        left: 0.0, top: 8.0, bottom: 8.0,),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              selectedIndices5.contains(index)
                                                  ? InkWell(
                                                  onTap: (){
                                                    if (selectedIndices5.contains(
                                                        index)) {
                                                      selectedIndices5.remove(index);

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
                                                    selectedIndices5.add(index);

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

                                        ],
                                      )
                                  );
                                }),
                          ),
                          selectedIndices5.contains("Other") ? Column(
                            children: [
                              SizedBox(height: 8.0),
                              Container(
                                margin: EdgeInsets.only(right: 12),
                                child: TextFormField(
                                  //validator: checkPasswordValidator,
                                    controller: question32Controller,
                                    keyboardType: TextInputType.text,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')), // Allow only alphabetic characters
                                    ],
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      labelText: 'Enter text',
                                      labelStyle: const TextStyle(
                                        fontSize: 15.0,
                                        color: AppTheme.grayColor,
                                      ),
                                    )),
                              ),
                              SizedBox(height: 8.0),
                            ],
                          ) :Container(),
                        ],
                      ),

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
                                if (selectedIndices5.contains("Other")){
                                  if (question32Controller.text == ""){
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
                                  }else{
                                    questionIndex = questionIndex + 1;
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
            ) :// new done

            questionIndex == 16 ?


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


            questionIndex == 17 ?

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

            questionIndex == 18 ?

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
                    SizedBox(height: 5.0),
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
                                  final index = questionList[questionIndex]['options'][pos]['option'];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex2 == index
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
                                              selectIndex2 = index;
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
                          selectIndex2 == "Other" ? Column(
                            children: [
                              SizedBox(height: 8.0),
                              Container(
                                margin: EdgeInsets.only(right: 12),
                                child: TextFormField(
                                  //validator: checkPasswordValidator,
                                    controller: question33Controller,
                                    // keyboardType: TextInputType.number,
                                    // inputFormatters: <TextInputFormatter>[
                                    //   FilteringTextInputFormatter.digitsOnly, // Allow only numbers
                                    // ],
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      labelText: 'Enter month',
                                      labelStyle: const TextStyle(
                                        fontSize: 15.0,
                                        color: AppTheme.grayColor,
                                      ),
                                    )),
                              ),
                              SizedBox(height: 8.0),
                            ],
                          ) : Container(),
                        ],
                      ),
                    ), // TextField Container
                    SizedBox(height: 10.0),
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
                              if (selectIndex2 != "-1"){
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

            questionIndex == 19 ?

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
                                  final index = questionList[questionIndex]['options'][pos]['option'];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex4 == index
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
                                              selectIndex4 = index;
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
                          selectIndex4 == "Other" ?
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
                    SizedBox(height: 10.0),
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
                              const EdgeInsets.only(left: 0, right: 16, top: 0),
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
                              if (selectIndex4 != "-1"){
                                if (selectIndex4 == "Other"){
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
                              const EdgeInsets.only(left: 8, right: 16, top: 0),
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
                                  final index = questionList[questionIndex]['options'][pos]['option'];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex5 == index
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
                                              selectIndex5 = index;
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
                              if (selectIndex5 != "-1"){
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

            questionIndex == 21 ?


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
                            height: 460,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  final index = questionList[questionIndex]['options'][pos]['option'];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex6 == index
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
                                              selectIndex6 = index;
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
                              if (selectIndex6 != "-1"){
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

            Column(
              children: [
                Container(
                  //height: 110,
                  margin: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
                  decoration: BoxDecoration(
                      color:
                      AppTheme.buttonColor.withOpacity(0.15),
                      borderRadius: const BorderRadius.all(Radius.circular(10))),
                  child: Container(
                    margin: EdgeInsets.only(left: 15,top: 15, bottom: 30),
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
                          margin: EdgeInsets.only(right: 12),
                          child: TextFormField(
                            //validator: textValidation,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                                //LengthLimitingTextInputFormatter(14), // Allow only numbers
                              ],
                              controller: question16Controller,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                labelText: 'Enter here',
                                labelStyle: const TextStyle(
                                  fontSize: 15.0,
                                  color: AppTheme.grayColor,
                                ),
                              )),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 12),
                          child: TextFormField(
                            //validator: textValidation,
                              keyboardType: TextInputType.text,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')), // Allow only alphabetic characters
                              ],
                              controller: question45Controller,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                labelText: 'Enter reason',
                                labelStyle: const TextStyle(
                                  fontSize: 15.0,
                                  color: AppTheme.grayColor,
                                ),
                              )),
                        ),// TextField Container
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
                                  const EdgeInsets.only(left: 0,right: 16,top: 8),
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

                                if (question45Controller.text.isEmpty || question16Controller.text.isEmpty) {

                                  final snackBar = SnackBar(
                                    content: Container(
                                      margin: EdgeInsets.only(
                                          left: 20, right: 20),
                                      // Adjust left and right margins
                                      child: Text(
                                        'Please enter amount and reason',
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    backgroundColor: Colors.red,
                                    duration: Duration(seconds: 3),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      snackBar);
                                }
                                else {
                                  questionIndex = questionIndex + 1;
                                  setState(() {

                                  });
                                }
                              },
                              child: Container(
                                  margin:
                                  const EdgeInsets.only(left: 8,right: 16,top: 8),
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
                ),
              ],
            ):

            //add amount reason
            questionIndex == 24 ?

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
                                  final index = questionList[questionIndex]['options'][pos]['option'];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex7 == index
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
                                              selectIndex7 = index;
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
                              if (selectIndex7 != "-1"){
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
                            height: 400,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  final index = questionList[questionIndex]['options'][pos]['option'];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex8 == index
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
                                              selectIndex8 = index;
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
                              if (selectIndex8 != "-1"){
                                if (selectIndex8 == "Yes"){
                                  questionIndex = questionIndex + 2;
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
            ) :// if select no then show next question if yes +2 index
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
                margin: EdgeInsets.only(left: 15, top: 0, bottom: 0),
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
                                  final index = questionList[questionIndex]['options'][pos]['option'];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex9 == index
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
                                              selectIndex9 = index;
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
                          selectIndex9 == "Other" ?
                          Column(
                            children: [
                              SizedBox(height: 8.0),
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
                    SizedBox(height: 10.0),
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
                              const EdgeInsets.only(left: 0, right: 16, top: 0),
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
                              if (selectIndex9 != "-1"){
                                if (selectIndex9 == "Other"){
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
                              const EdgeInsets.only(left: 8, right: 16, top: 0),
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

            questionIndex == 27 ?

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
                                  final index = questionList[questionIndex]['options'][pos]['option'];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex10 == index
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
                                              selectIndex10 = index;
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
                              if (selectIndex10 != "-1"){
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
            ) ://---Yes

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
                                  final index = questionList[questionIndex]['options'][pos]['option'];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex11 == index
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
                                              selectIndex11 = index;
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
                              if (selectIndex11 != "-1"){
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
                                  final index = questionList[questionIndex]['options'][pos]['option'];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex12 == index
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
                                              selectIndex12 = index;
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
                              if (selectIndex12 != "-1"){
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
                            height: 460,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  final index = questionList[questionIndex]['options'][pos]['option'];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex13 == index
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
                                              selectIndex13 = index;
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
                              if (selectIndex13 != "-1"){
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
                                  final index = questionList[questionIndex]['options'][pos]['option'];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex14 == index
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
                                              selectIndex14 = index;
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
                              if (selectIndex14 != "-1"){
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
                                  final index = questionList[questionIndex]['options'][pos]['option'];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex15 == index
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
                                              selectIndex15 = index;
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
                              if (selectIndex15 != "-1"){
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
                            height: 150,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  final index = questionList[questionIndex]['options'][pos]['option'];
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 0.0,
                                      top: 8.0,
                                      bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex16 == index
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
                                              selectIndex16 = index;
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
                          selectIndex16 == "Other" ?
                          Column(
                            children: [
                              SizedBox(height: 8.0),
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
                              SizedBox(height: 8.0),
                            ],
                          ) : Container(),
                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 10.0),
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
                              if (selectIndex16 != "-1"){
                                if (selectIndex16 == "Other"){
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
                                  final index = questionList[questionIndex]['options'][pos]['option'];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex17 == index
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
                                              selectIndex17 = index;
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
                              if (selectIndex17 != "-1"){
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
                                  final index = questionList[questionIndex]['options'][pos]['option'];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex18 == index
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
                                              selectIndex18 = index;
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
                              if (selectIndex18 != "-1"){
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
                            height: 80,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  final index = questionList[questionIndex]['options'][pos]['option'];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex19 == index
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
                                              selectIndex19 = index;
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
                          selectIndex19 == "Yes"?
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 8.0),
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
                              ),
                              Column(
                                children: [
                                  SizedBox(height: 8.0),
                                  Container(
                                    margin: EdgeInsets.only(right: 12),
                                    child: TextFormField(
                                      //validator: checkPasswordValidator,
                                        controller: question17Controller,
                                        keyboardType: TextInputType.number,
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter.digitsOnly, // Allow only numbers
                                        ],
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.zero,
                                          labelText: 'Collection amount',
                                          labelStyle: const TextStyle(
                                            fontSize: 15.0,
                                            color: AppTheme.grayColor,
                                          ),
                                        )),
                                  ),
                                  SizedBox(height: 8.0),
                                ],
                              ), // TextField Container
                              SizedBox(height: 8.0),
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
                              if (selectIndex19 != "-1"){
                                if (selectIndex19 == "Yes"){
                                  if (_startDate3 != null && question17Controller.text.isNotEmpty){
                                    questionIndex = questionIndex + 1;
                                  }else{
                                    final snackBar = SnackBar(
                                      content: Container(
                                        margin: EdgeInsets.only(left: 20, right: 20),
                                        // Adjust left and right margins
                                        child: Text(
                                          'Please select date and amount.',
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
            ) :// T-1 EMI DATE// if yes text field add as number


            // questionIndex == 41 ?
            // TextFieldNumberWidget(
            //   controller: question17Controller,
            //   onNextTap: () {
            //     if (question17Controller.text == "") {
            //       final snackBar = SnackBar(
            //         content: Container(
            //           margin: EdgeInsets.only(left: 20, right: 20),
            //           // Adjust left and right margins
            //           child: Text(
            //             'Answer cannot be empty',
            //             textAlign: TextAlign.center,
            //           ),
            //         ),
            //         backgroundColor: Colors.red,
            //         duration: Duration(seconds: 3),
            //       );
            //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
            //     }
            //
            //     else {
            //       questionIndex = questionIndex + 1;
            //       setState(() {
            //
            //       });
            //     }
            //   },
            //
            //   onPreviousTap: () {
            //     questionIndex = questionIndex - 1;
            //     setState(() {
            //
            //     });
            //   },
            //
            //   questionMessage: questionList[questionIndex]['que_message'],
            //   questionName: questionList[questionIndex]['question'],
            //
            // ) :

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
                            height: 80,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  final index = questionList[questionIndex]['options'][pos]['option'];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex20 == index
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
                                              selectIndex20 = index;
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
                          selectIndex20 == "Yes"?
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 8.0),
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
                              ),
                              Column(
                                children: [
                                  SizedBox(height: 8.0),
                                  Container(
                                    margin: EdgeInsets.only(right: 12),
                                    child: TextFormField(
                                      //validator: checkPasswordValidator,
                                        controller: question18Controller,
                                        keyboardType: TextInputType.number,
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter.digitsOnly, // Allow only numbers
                                        ],
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.zero,
                                          labelText: 'Collection amount',
                                          labelStyle: const TextStyle(
                                            fontSize: 15.0,
                                            color: AppTheme.grayColor,
                                          ),
                                        )),
                                  ),
                                  SizedBox(height: 8.0),
                                ],
                              ),// TextField Container
                              SizedBox(height: 8.0),
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
                              if (selectIndex20 != "-1"){
                                if (selectIndex20 == "Yes"){
                                  if (_startDate4 != null && question18Controller.text.isNotEmpty){
                                    questionIndex = questionIndex + 1;
                                  }else{
                                    final snackBar = SnackBar(
                                      content: Container(
                                        margin: EdgeInsets.only(left: 20, right: 20),
                                        // Adjust left and right margins
                                        child: Text(
                                          'Please select date and amount.',
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
            // questionIndex == 38 ?
            // TextFieldNumberWidget(
            //   controller: question18Controller,
            //   onNextTap: () {
            //     if (question18Controller.text == "") {
            //       final snackBar = SnackBar(
            //         content: Container(
            //           margin: EdgeInsets.only(left: 20, right: 20),
            //           // Adjust left and right margins
            //           child: Text(
            //             'Answer cannot be empty',
            //             textAlign: TextAlign.center,
            //           ),
            //         ),
            //         backgroundColor: Colors.red,
            //         duration: Duration(seconds: 3),
            //       );
            //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
            //     }
            //
            //     else {
            //       questionIndex = questionIndex + 1;
            //       setState(() {
            //
            //       });
            //     }
            //   },
            //
            //   onPreviousTap: () {
            //     questionIndex = questionIndex - 1;
            //     setState(() {
            //
            //     });
            //   },
            //
            //   questionMessage: questionList[questionIndex]['que_message'],
            //   questionName: questionList[questionIndex]['question'],
            //
            // ) :
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
                            height: 80,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  final index = questionList[questionIndex]['options'][pos]['option'];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex21 == index
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
                                              selectIndex21 = index;
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
                          selectIndex21 == "Yes"?
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 8.0),
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
                              ),
                              Column(
                                children: [
                                  SizedBox(height: 8.0),
                                  Container(
                                    margin: EdgeInsets.only(right: 12),
                                    child: TextFormField(
                                      //validator: checkPasswordValidator,
                                        controller: question19Controller,
                                        keyboardType: TextInputType.number,
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter.digitsOnly, // Allow only numbers
                                        ],
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.zero,
                                          labelText: 'Collection amount',
                                          labelStyle: const TextStyle(
                                            fontSize: 15.0,
                                            color: AppTheme.grayColor,
                                          ),
                                        )),
                                  ),
                                  SizedBox(height: 8.0),
                                ],
                              ),// TextField Container
                              SizedBox(height: 8.0),
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
                              if (selectIndex21 != "-1"){
                                if (selectIndex21 == "Yes"){
                                  if (_startDate5 != null && question19Controller.text.isNotEmpty){
                                    questionIndex = questionIndex + 1;
                                  }else{
                                    final snackBar = SnackBar(
                                      content: Container(
                                        margin: EdgeInsets.only(left: 20, right: 20),
                                        // Adjust left and right margins
                                        child: Text(
                                          'Please select date and amount.',
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


            // questionIndex == 40 ?
            // TextFieldNumberWidget(
            //   controller: question19Controller,
            //   onNextTap: () {
            //     if (question19Controller.text == "") {
            //       final snackBar = SnackBar(
            //         content: Container(
            //           margin: EdgeInsets.only(left: 20, right: 20),
            //           // Adjust left and right margins
            //           child: Text(
            //             'Answer cannot be empty',
            //             textAlign: TextAlign.center,
            //           ),
            //         ),
            //         backgroundColor: Colors.red,
            //         duration: Duration(seconds: 3),
            //       );
            //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
            //     }
            //
            //     else {
            //       questionIndex = questionIndex + 1;
            //       setState(() {
            //
            //       });
            //     }
            //   },
            //
            //   onPreviousTap: () {
            //     questionIndex = questionIndex - 1;
            //     setState(() {
            //
            //     });
            //   },
            //
            //   questionMessage: questionList[questionIndex]['que_message'],
            //   questionName: questionList[questionIndex]['question'],
            //
            // )  ://T-3 EMI

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
                                  final index = questionList[questionIndex]['options'][pos]['option'];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex22 == index
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
                                              selectIndex22 = index;
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
                              if (selectIndex22 != "-1"){
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
                            height: 460,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  final index = questionList[questionIndex]['options'][pos]['option'];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex23 == index
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
                                              selectIndex23 = index;
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
                              if (selectIndex23 != "-1"){
                                if (selectIndex23 == "Yes"){
                                  questionIndex = questionIndex + 1;
                                }else{
                                  questionIndex = questionIndex + 2;
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
            ) :// if select yes index +1 if select no index +2

            questionIndex == 41 ?
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
                            height: 460,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  final index = questionList[questionIndex]['options'][pos]['option'];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex24 == index
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
                                              selectIndex24 = index;
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
                              if (selectIndex24 != "-1"){
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
            questionIndex == 43 ?
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
                                  final index = questionList[questionIndex]['options'][pos]['option'];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex25 == index
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
                                              selectIndex25 = index;
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
                              if (selectIndex25 != "-1"){
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
                            height: 460,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  final index = questionList[questionIndex]['options'][pos]['option'];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex26 == index
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
                                              selectIndex26 = index;
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
                              if (selectIndex26 != "-1"){
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


            questionIndex == 45 ?
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
                                  final index = questionList[questionIndex]['options'][pos]['option'];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex27 == index
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
                                              selectIndex27 = index;
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
                              if (selectIndex27 != "-1"){
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


            questionIndex == 46 ?

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
                      height: 250,

                      child: ListView.builder(
                          padding: EdgeInsets.only(bottom: 16.0),
                          itemCount: questionList[questionIndex]['options']
                              .length,
                          shrinkWrap: true,
                          //physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int pos) {
                            _controllerTab3.add(TextEditingController());
                            final index = questionList[questionIndex]['options'][pos]['option'];
                            return Padding(
                                padding: const EdgeInsets.only(
                                  left: 0.0, top: 8.0, bottom: 8.0,),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        selectedIndices6.contains(index)
                                            ? InkWell(
                                            onTap: (){
                                              if (selectedIndices6.contains(
                                                  index)) {
                                                selectedIndices6.remove(index);
                                                selectedIndicesInt6.remove(pos);
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
                                              selectedIndices6.add(index);
                                              selectedIndicesInt6.add(pos);
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
                                    selectedIndices6.contains(index)?
                                    Container(
                                      margin: EdgeInsets.only(right: 12),
                                      child: TextFormField(
                                        //validator: checkPasswordValidator,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter.digitsOnly,
                                            LengthLimitingTextInputFormatter(10)// Allow only numbers
                                          ],
                                          controller: _controllerTab3[pos],
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
                              bool isValid = true;
                              for (int i = 0; i < selectedIndicesInt6.length; i++) {
                                int index = selectedIndicesInt6[i];
                                if (_controllerTab3[index].text.length < 10) {
                                  isValid = false;
                                  break;

                                }
                              }
                              if (isValid == true && selectedIndicesInt6.isNotEmpty) {
                                questionIndex = questionIndex + 1;
                                isValid = false;


                              } else {
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option and enter valid number',
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
            ) ://done but option no textfield hide pending
            questionIndex == 47 ?
            Container(
              //height: 110,
              margin: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15,top: 15, bottom: 30),
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
                      margin: EdgeInsets.only(right: 12),
                      child: TextFormField(
                        //validator: textValidation,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(10), // Allow only numbers
                          ],
                          controller: question21Controller,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            labelText: 'Enter here',
                            labelStyle: const TextStyle(
                              fontSize: 15.0,
                              color: AppTheme.grayColor,
                            ),
                          )),
                    ),// TextField Container
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
                              const EdgeInsets.only(left: 0,right: 16,top: 8),
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
                            if (question21Controller.text == "") {

                              final snackBar = SnackBar(
                                content: Container(
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  // Adjust left and right margins
                                  child: Text(
                                    'Please enter whatsapp number',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                backgroundColor: Colors.red,
                                duration: Duration(seconds: 3),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            }else if(question21Controller.text.length < 10){
                              final snackBar = SnackBar(
                                content: Container(
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  // Adjust left and right margins
                                  child: Text(
                                    'Please enter valid number',
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
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8,right: 16,top: 8),
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
            ):

            questionIndex == 48 ?

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
                                  final index = questionList[questionIndex]['options'][pos]['option'];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex28 == index
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
                                              selectIndex28 = index;
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
                              if (selectIndex28 != "-1"){
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
                                  final index = questionList[questionIndex]['options'][pos]['option'];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex29 == index
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
                                              selectIndex29 = index;
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
                              if (selectIndex29 != "-1"){
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
                                  final index = questionList[questionIndex]['options'][pos]['option'];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex30 == index
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
                                              selectIndex30 = index;
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
                              if (selectIndex30 != "-1"){
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
            ) :// done// new api
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
                                  final index = questionList[questionIndex]['options'][pos]['option'];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex31 == index
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
                                              selectIndex31 = index;
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
                              if (selectIndex31 != "-1"){
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
                            height: 150,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  final index = questionList[questionIndex]['options'][pos]['option'];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex32 == index
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
                                              selectIndex32 = index;
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
                          selectIndex32 == "Other" ?
                          Column(
                            children: [
                              SizedBox(height: 8.0),
                              Container(
                                margin: EdgeInsets.only(right: 12),
                                child: TextFormField(
                                  //validator: checkPasswordValidator,
                                    controller: question34Controller,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly, // Allow only numbers
                                    ],
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      labelText: 'Enter here',
                                      labelStyle: const TextStyle(
                                        fontSize: 15.0,
                                        color: AppTheme.grayColor,
                                      ),
                                    )),
                              ),
                              SizedBox(height: 8.0),
                            ],
                          ) : Container(),
                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 10.0),
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
                              if (selectIndex32 != "-1"){
                                if (selectIndex32 == "Other"){
                                  if (question34Controller.text.isNotEmpty){
                                    questionIndex = questionIndex + 1;
                                  }else{
                                    final snackBar = SnackBar(
                                      content: Container(
                                        margin: EdgeInsets.only(left: 20, right: 20),
                                        // Adjust left and right margins
                                        child: Text(
                                          'Enter count.',
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
            questionIndex == 53 ?
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
                                  final index = questionList[questionIndex]['options'][pos]['option'];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex33 == index
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
                                              selectIndex33 = index;
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
                          selectIndex33 == "Other" ?
                          Column(
                            children: [
                              SizedBox(height: 8.0),
                              Container(
                                margin: EdgeInsets.only(right: 12),
                                child: TextFormField(
                                  //validator: checkPasswordValidator,
                                    controller: question35Controller,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly, // Allow only numbers
                                    ],
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      labelText: 'Enter here',
                                      labelStyle: const TextStyle(
                                        fontSize: 15.0,
                                        color: AppTheme.grayColor,
                                      ),
                                    )),
                              ),
                              SizedBox(height: 8.0),
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
                              if (selectIndex33 != "-1"){
                                if (selectIndex33 == "Other"){
                                  if (question35Controller.text.isNotEmpty){
                                    questionIndex = questionIndex + 1;
                                  }else{
                                    final snackBar = SnackBar(
                                      content: Container(
                                        margin: EdgeInsets.only(left: 20, right: 20),
                                        // Adjust left and right margins
                                        child: Text(
                                          'Enter count.',
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

            questionIndex == 54 ?
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
                                  final index = questionList[questionIndex]['options'][pos]['option'];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex34 == index
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
                                              selectIndex34 = index;
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
                          selectIndex34 == "Other" ?
                          Column(
                            children: [
                              SizedBox(height: 8.0),
                              Container(
                                margin: EdgeInsets.only(right: 12),
                                child: TextFormField(
                                  //validator: checkPasswordValidator,
                                    controller: question36Controller,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly, // Allow only numbers
                                    ],
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      labelText: 'Enter here',
                                      labelStyle: const TextStyle(
                                        fontSize: 15.0,
                                        color: AppTheme.grayColor,
                                      ),
                                    )),
                              ),
                              SizedBox(height: 8.0),
                            ],
                          ) : Container(),
                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 10.0),
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
                              if (selectIndex34 != "-1"){
                                if (selectIndex34 == "Other"){
                                  if (question36Controller.text.isNotEmpty){
                                    questionIndex = questionIndex + 1;
                                  }else{
                                    final snackBar = SnackBar(
                                      content: Container(
                                        margin: EdgeInsets.only(left: 20, right: 20),
                                        // Adjust left and right margins
                                        child: Text(
                                          'Enter count.',
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
                            height: 150,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  final index = questionList[questionIndex]['options'][pos]['option'];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex35 == index
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
                                              selectIndex35 = index;
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
                          selectIndex35 == "Other" ?
                          Column(
                            children: [
                              SizedBox(height: 8.0),
                              Container(
                                margin: EdgeInsets.only(right: 12),
                                child: TextFormField(
                                  //validator: checkPasswordValidator,
                                    controller: question37Controller,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly, // Allow only numbers
                                    ],
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      labelText: 'Enter here',
                                      labelStyle: const TextStyle(
                                        fontSize: 15.0,
                                        color: AppTheme.grayColor,
                                      ),
                                    )),
                              ),
                              SizedBox(height: 8.0),
                            ],
                          ) : Container(),
                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 10.0),
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
                              if (selectIndex35 != "-1"){
                                if (selectIndex35 == "Other"){
                                  if (question37Controller.text.isNotEmpty){
                                    questionIndex = questionIndex + 1;
                                  }else{
                                    final snackBar = SnackBar(
                                      content: Container(
                                        margin: EdgeInsets.only(left: 20, right: 20),
                                        // Adjust left and right margins
                                        child: Text(
                                          'Enter count.',
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
                            height: 150,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  final index = questionList[questionIndex]['options'][pos]['option'];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex36 == index
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
                                              selectIndex36 = index;
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
                          selectIndex36 == "Other" ?
                          Column(
                            children: [
                              SizedBox(height: 8.0),
                              Container(
                                margin: EdgeInsets.only(right: 12),
                                child: TextFormField(
                                  //validator: checkPasswordValidator,
                                    controller: question38Controller,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly, // Allow only numbers
                                    ],
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      labelText: 'Enter here',
                                      labelStyle: const TextStyle(
                                        fontSize: 15.0,
                                        color: AppTheme.grayColor,
                                      ),
                                    )),
                              ),
                              SizedBox(height: 8.0),
                            ],
                          ) : Container(),
                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 10.0),
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
                              if (selectIndex36 != "-1"){
                                if (selectIndex36 == "Other"){
                                  if (question38Controller.text.isNotEmpty){
                                    questionIndex = questionIndex + 1;
                                  }else{
                                    final snackBar = SnackBar(
                                      content: Container(
                                        margin: EdgeInsets.only(left: 20, right: 20),
                                        // Adjust left and right margins
                                        child: Text(
                                          'Enter count.',
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
                            height: 150,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  final index = questionList[questionIndex]['options'][pos]['option'];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex37 == index
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
                                              selectIndex37 = index;
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
                          selectIndex37 == "Other" ?
                          Column(
                            children: [
                              SizedBox(height: 8.0),
                              Container(
                                margin: EdgeInsets.only(right: 12),
                                child: TextFormField(
                                  //validator: checkPasswordValidator,
                                    controller: question39Controller,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly, // Allow only numbers
                                    ],
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      labelText: 'Enter here',
                                      labelStyle: const TextStyle(
                                        fontSize: 15.0,
                                        color: AppTheme.grayColor,
                                      ),
                                    )),
                              ),
                              SizedBox(height: 8.0),
                            ],
                          ) : Container(),
                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 10.0),
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
                              if (selectIndex37 != "-1"){
                                if (selectIndex37 == "Other"){
                                  if (question39Controller.text.isNotEmpty){
                                    questionIndex = questionIndex + 1;
                                  }else{
                                    final snackBar = SnackBar(
                                      content: Container(
                                        margin: EdgeInsets.only(left: 20, right: 20),
                                        // Adjust left and right margins
                                        child: Text(
                                          'Enter count.',
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
                            height: 150,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  final index = questionList[questionIndex]['options'][pos]['option'];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex38 == index
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
                                              selectIndex38 = index;
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
                          selectIndex38 == "Other" ?
                          Column(
                            children: [
                              SizedBox(height: 8.0),
                              Container(
                                margin: EdgeInsets.only(right: 12),
                                child: TextFormField(
                                  //validator: checkPasswordValidator,
                                    controller: question40Controller,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly, // Allow only numbers
                                    ],
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      labelText: 'Enter here',
                                      labelStyle: const TextStyle(
                                        fontSize: 15.0,
                                        color: AppTheme.grayColor,
                                      ),
                                    )),
                              ),
                              SizedBox(height: 8.0),
                            ],
                          ) : Container(),
                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 10.0),
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
                              if (selectIndex38 != "-1"){
                                if (selectIndex38 == "Other"){
                                  if (question40Controller.text.isNotEmpty){
                                    questionIndex = questionIndex + 1;
                                  }else{
                                    final snackBar = SnackBar(
                                      content: Container(
                                        margin: EdgeInsets.only(left: 20, right: 20),
                                        // Adjust left and right margins
                                        child: Text(
                                          'Enter count.',
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
                            height: 150,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  final index = questionList[questionIndex]['options'][pos]['option'];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex39 == index
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
                                              selectIndex39 = index;
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
                          selectIndex39 == "Other" ?
                          Column(
                            children: [
                              SizedBox(height: 8.0),
                              Container(
                                margin: EdgeInsets.only(right: 12),
                                child: TextFormField(
                                  //validator: checkPasswordValidator,
                                    controller: question41Controller,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly, // Allow only numbers
                                    ],
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      labelText: 'Enter here',
                                      labelStyle: const TextStyle(
                                        fontSize: 15.0,
                                        color: AppTheme.grayColor,
                                      ),
                                    )),
                              ),
                              SizedBox(height: 8.0),
                            ],
                          ) : Container(),
                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 10.0),
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
                              if (selectIndex39 != "-1"){
                                if (selectIndex39 == "Other"){
                                  if (question41Controller.text.isNotEmpty){
                                    questionIndex = questionIndex + 1;
                                  }else{
                                    final snackBar = SnackBar(
                                      content: Container(
                                        margin: EdgeInsets.only(left: 20, right: 20),
                                        // Adjust left and right margins
                                        child: Text(
                                          'Enter count.',
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
            //uetuertuer
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
                                  final index = questionList[questionIndex]['options'][pos]['option'];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex40 == index
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
                                              selectIndex40 = index;
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
                              if (selectIndex40 != "-1"){
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
                                  final index = questionList[questionIndex]['options'][pos]['option'];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex41 == index
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
                                              selectIndex41 = index;
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
                              if (selectIndex41 != "-1"){
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
                                  final index = questionList[questionIndex]['options'][pos]['option'];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex42 == index
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
                                              selectIndex42 = index;
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
                              if (selectIndex42 != "-1"){
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
                                  final index = questionList[questionIndex]['options'][pos]['option'];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex43 == index
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
                                              selectIndex43 = index;
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
                              if (selectIndex43 != "-1"){
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
                            height: 150,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  final index = questionList[questionIndex]['options'][pos]['option'];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex44 == index
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
                                              selectIndex44 = index;
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
                          selectIndex44 == "Other" ?
                          Column(
                            children: [
                              SizedBox(height: 8.0),
                              Container(
                                margin: EdgeInsets.only(right: 12),
                                child: TextFormField(
                                  //validator: checkPasswordValidator,
                                    controller: question42Controller,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly, // Allow only numbers
                                    ],
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      labelText: 'Enter here',
                                      labelStyle: const TextStyle(
                                        fontSize: 15.0,
                                        color: AppTheme.grayColor,
                                      ),
                                    )),
                              ),
                              SizedBox(height: 8.0),
                            ],
                          ) : Container(),
                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 10.0),
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
                              if (selectIndex44 != "-1"){
                                if (selectIndex44 == "Other"){
                                  if (question42Controller.text.isNotEmpty){
                                    questionIndex = questionIndex + 1;
                                  }else{
                                    final snackBar = SnackBar(
                                      content: Container(
                                        margin: EdgeInsets.only(left: 20, right: 20),
                                        // Adjust left and right margins
                                        child: Text(
                                          'Enter count.',
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
                            height: 150,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  final index = questionList[questionIndex]['options'][pos]['option'];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex45 == index
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
                                              selectIndex45 = index;
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
                          selectIndex45 == "Other" ?
                          Column(
                            children: [
                              SizedBox(height: 8.0),
                              Container(
                                margin: EdgeInsets.only(right: 12),
                                child: TextFormField(
                                  //validator: checkPasswordValidator,
                                    controller: question43Controller,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly, // Allow only numbers
                                    ],
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      labelText: 'Enter here',
                                      labelStyle: const TextStyle(
                                        fontSize: 15.0,
                                        color: AppTheme.grayColor,
                                      ),
                                    )),
                              ),
                              SizedBox(height: 8.0),
                            ],
                          ) : Container(),
                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 10.0),
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
                              if (selectIndex45 != "-1"){
                                if (selectIndex45 == "Other"){
                                  if (question43Controller.text.isNotEmpty){
                                    questionIndex = questionIndex + 1;
                                  }else{
                                    final snackBar = SnackBar(
                                      content: Container(
                                        margin: EdgeInsets.only(left: 20, right: 20),
                                        // Adjust left and right margins
                                        child: Text(
                                          'Enter count.',
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

            questionIndex == 66 ?


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
                      child:Column(
                        children: [
                          Container(
                            height: 160,

                            child: ListView.builder(
                                padding: EdgeInsets.only(bottom: 16.0),
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  _controllerTab4.add(TextEditingController());
                                  if(pos==questionList[questionIndex]['options']
                                      .length-1){

                                    _controllerTab4[pos].text="-";

                                  }
                                  final index = questionList[questionIndex]['options'][pos]['option'];
                                  return Padding(
                                      padding: const EdgeInsets.only(
                                        left: 0.0, top: 8.0, bottom: 8.0,),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              selectedIndices7.contains(index)
                                                  ? InkWell(
                                                  onTap: (){
                                                    if (selectedIndices7.contains(
                                                        index)) {
                                                      selectedIndices7.remove(index);
                                                      selectedIndicesInt7.remove(pos);
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
                                                    selectedIndices7.add(index);
                                                    selectedIndicesInt7.add(pos);
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
                                          selectedIndices7.contains(index) && questionList[questionIndex]['options'][pos]['option'] != "No"?
                                          Container(
                                            margin: EdgeInsets.only(right: 12),
                                            child: TextFormField(
                                              //validator: checkPasswordValidator,
                                                keyboardType: TextInputType.number,
                                                inputFormatters: <TextInputFormatter>[
                                                  FilteringTextInputFormatter.digitsOnly, // Allow only numbers
                                                ],
                                                controller: _controllerTab4[pos],
                                                decoration: InputDecoration(
                                                  contentPadding: EdgeInsets.zero,
                                                  labelText: 'Count',
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
                          ),
                          selectedIndices7.contains("Other") ?
                          Column(
                            children: [
                              SizedBox(height: 0.0),
                              Container(
                                margin: EdgeInsets.only(right: 12),
                                child: TextFormField(
                                  //validator: checkPasswordValidator,
                                    controller: question46Controller,
                                    keyboardType: TextInputType.text,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')), // Allow only alphabetic characters
                                    ],
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      labelText: 'Enter text',
                                      labelStyle: const TextStyle(
                                        fontSize: 15.0,
                                        color: AppTheme.grayColor,
                                      ),
                                    )),
                              ),
                              SizedBox(height: 0.0),
                            ],
                          ) :Container(),// T
                        ],
                      ),
                    ),

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
                              bool isValid = true;
                              for (int i = 0; i < selectedIndicesInt7.length; i++) {
                                int index = selectedIndicesInt7[i];
                                print(_controllerTab4[index].text);
                                if (_controllerTab4[index].text.isEmpty) {
                                  isValid = false;
                                  break;

                                }
                              }
                              if (isValid == true && selectedIndicesInt7.isNotEmpty) {
                                if (selectedIndices7.contains("Other")){
                                  if (question46Controller.text == ""){
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
                                  }else{
                                    questionIndex = questionIndex + 1;
                                    isValid = false;
                                  }
                                }else{
                                  questionIndex = questionIndex + 1;
                                  isValid = false;
                                }

                              } else {
                                final snackBar = SnackBar(
                                  content: Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    // Adjust left and right margins
                                    child: Text(
                                      'Please select the option and enter count.',
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
            ) :// add count text field

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
                                  final index = questionList[questionIndex]['options'][pos]['option'];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex46 == index
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
                                              selectIndex46 = index;
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
                              if (selectIndex46 != "-1"){
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
                                  final index = questionList[questionIndex]['options'][pos]['option'];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex47 == index
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
                                              selectIndex47 = index;
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
                              if (selectIndex47 != "-1"){
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
                                  final index = questionList[questionIndex]['options'][pos]['option'];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex48 == index
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
                                              selectIndex48 = index;
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
                              if (selectIndex48 != "-1"){
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
                            height: 150,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  final index = questionList[questionIndex]['options'][pos]['option'];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex49 == index
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
                                              selectIndex49 = index;
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
                          selectIndex49 == "Other" ?
                          Column(
                            children: [
                              SizedBox(height: 8.0),
                              Container(
                                margin: EdgeInsets.only(right: 12),
                                child: TextFormField(
                                  //validator: checkPasswordValidator,
                                    controller: question44Controller,
                                    keyboardType: TextInputType.text,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')), // Allow only alphabetic characters
                                    ],
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      labelText: 'Enter here',
                                      labelStyle: const TextStyle(
                                        fontSize: 15.0,
                                        color: AppTheme.grayColor,
                                      ),
                                    )),
                              ),
                              SizedBox(height: 8.0),
                            ],
                          ) : Container(),
                        ],
                      ),
                    ),
                    // TextField Container
                    SizedBox(height: 10.0),
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
                              if (selectIndex49 != "-1"){
                                if (selectIndex49 == "Other"){
                                  if (question44Controller.text.isNotEmpty){
                                    questionIndex = questionIndex + 1;
                                  }else{
                                    final snackBar = SnackBar(
                                      content: Container(
                                        margin: EdgeInsets.only(left: 20, right: 20),
                                        // Adjust left and right margins
                                        child: Text(
                                          'Enter count.',
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
            ) ://done


            questionIndex == 71 ?

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
                            height: 80,
                            child: ListView.builder(
                                itemCount: questionList[questionIndex]['options']
                                    .length,
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int pos) {
                                  final index = questionList[questionIndex]['options'][pos]['option'];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex50 == index
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
                                              selectIndex50 = index;
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
                          selectIndex50 == "Yes" ?
                          Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(child: InkWell(
                                    onTap: () async {

                                      setState(() {

                                      });
                                      _openImagePicker(context);

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
                          selectIndex50 == "No" ?
                          Column(
                            children: [
                              Container(
                                height: 50,
                                width: double.infinity,
                                //color: const Color(0xFfFFFFFF),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 0),
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: () {
                                          //showModalBottomSheet(() {
                                          sendFlagStatus(context);
                                          // });
                                        },
                                        child: Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(4),
                                              color: const Color(0xFfF6F6F6),
                                              border: Border.all(
                                                  width: 0.6, color: const Color(0XFFB9B9B9))),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(left: 8),
                                                child: Text(
                                                    flagStatus == '12'
                                                        ? 'Select option'
                                                        : flagStatus,
                                                    style: TextStyle(
                                                      fontSize: 11,
                                                      color: Colors.black,
                                                    )),
                                              ),
                                              Icon(Icons.keyboard_arrow_down_outlined,
                                                  color: Colors.black),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                  ],
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Container(
                                height: 50,
                                width: double.infinity,
                                //color: const Color(0xFfFFFFFF),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 0),
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: () {
                                          sendFlagStatus1(context);
                                        },
                                        child: Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(4),
                                              color: const Color(0xFfF6F6F6),
                                              border: Border.all(
                                                  width: 0.6, color: const Color(0XFFB9B9B9))),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(left: 8),
                                                child: Text(
                                                    flagStatus2 == '13'
                                                        ? 'Select option'
                                                        : flagStatus2,
                                                    style: TextStyle(
                                                      fontSize: 11,
                                                      color: Colors.black,
                                                    )),
                                              ),
                                              Icon(Icons.keyboard_arrow_down_outlined,
                                                  color: Colors.black),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                  ],
                                ),
                              ),
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
                              if (selectIndex50 != "-1"){
                                if (selectIndex50 != "Yes"){
                                  if(flagStatus == "12" || flagStatus2 == "13"){
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
                                  }else{
                                    questionIndex = questionIndex + 1;
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
            )  ://Image upload api calling pending // if no then show drop down
            questionIndex == 73 ?
            // Container(
            //   //height: 110,
            //   margin: EdgeInsets.only(
            //     left: 15, right: 15, top: 15, bottom: 15,),
            //   decoration: BoxDecoration(
            //       color:
            //       AppTheme.buttonColor.withOpacity(0.15),
            //       borderRadius: const BorderRadius.all(Radius.circular(10))),
            //   child: Container(
            //     margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             Text(
            //               questionList[questionIndex]['question'],
            //               style: TextStyle(
            //                   fontSize: 16,
            //                   color: AppTheme.blackColor,
            //                   fontWeight: FontWeight.bold
            //               ),
            //             ),
            //           ],
            //         ),
            //         SizedBox(height: 20.0),
            //         Text(questionList[questionIndex]['que_message'],
            //           style: TextStyle(
            //               fontSize: 14,
            //               color: AppTheme.blackColor,
            //               fontWeight: FontWeight.normal
            //           ),
            //         ),
            //         SizedBox(height: 10.0),
            //         Container(
            //           child: Column(
            //             children: [
            //               Container(
            //                 height: 460,
            //                 child: ListView.builder(
            //                     itemCount: questionList[questionIndex]['options']
            //                         .length,
            //                     shrinkWrap: true,
            //                     //physics: NeverScrollableScrollPhysics(),
            //                     scrollDirection: Axis.vertical,
            //                     itemBuilder: (BuildContext context, int pos) {
            //                       final index = questionList[questionIndex]['options'][pos]['option'];
            //                       return Padding(
            //                         padding: const EdgeInsets.only(
            //                           left: 0.0, top: 8.0, bottom: 8.0,),
            //                         child: Row(
            //                           children: [
            //                             selectIndex51 == index
            //                                 ? Image.asset(
            //                                 'assets/selectRadio.png',
            //                                 width: 24, height: 24)
            //                                 : InkWell(
            //                               child: Image.asset(
            //                                   'assets/unSelectRadio.png',
            //                                   width: 24,
            //                                   height: 24),
            //                               onTap: () {
            //                                 setState(() {
            //                                   selectIndex51 = index;
            //                                 });
            //                               },
            //                             ),
            //                             const SizedBox(width: 10),
            //                             Expanded(
            //                               child: Text(
            //                                   questionList[questionIndex]['options'][pos]['option'],
            //                                   style: TextStyle(
            //                                       fontSize: 14,
            //                                       fontWeight: FontWeight.normal,
            //                                       color: Colors.black)),
            //                             ),
            //                           ],
            //                         ),
            //                       );
            //                     }),
            //               ),
            //
            //             ],
            //           ),
            //         ),
            //         // TextField Container
            //         SizedBox(height: 20.0),
            //         Row(
            //           children: [
            //             Expanded(child: InkWell(
            //               onTap: () {
            //                 questionIndex = questionIndex - 1;
            //                 setState(() {
            //
            //                 });
            //               },
            //               child: Container(
            //                   margin:
            //                   const EdgeInsets.only(left: 0, right: 16, top: 8),
            //                   width: double.infinity,
            //                   decoration: BoxDecoration(
            //                       color: AppTheme.blueColor,
            //                       borderRadius: BorderRadius.circular(5)),
            //                   height: 45,
            //                   child: const Center(
            //                     child: Text('Previous',
            //                         style: TextStyle(
            //                             fontSize: 13,
            //                             fontWeight: FontWeight.w600,
            //                             color: Colors.white)),
            //                   )),
            //             ),),
            //             Expanded(child: InkWell(
            //               onTap: () {
            //                 setState(() {
            //                   if (selectIndex51 != "-1"){
            //                     questionIndex = questionIndex + 1;
            //                   }else{
            //                     final snackBar = SnackBar(
            //                       content: Container(
            //                         margin: EdgeInsets.only(left: 20, right: 20),
            //                         // Adjust left and right margins
            //                         child: Text(
            //                           'Please select the option.',
            //                           textAlign: TextAlign.center,
            //                         ),
            //                       ),
            //                       backgroundColor: Colors.red,
            //                       duration: Duration(seconds: 3),
            //                     );
            //                     ScaffoldMessenger.of(context).showSnackBar(snackBar);
            //                   }
            //
            //                 });
            //               },
            //               child: Container(
            //                   margin:
            //                   const EdgeInsets.only(left: 8, right: 16, top: 8),
            //                   width: double.infinity,
            //                   decoration: BoxDecoration(
            //                       color: AppTheme.buttonOrangeColor,
            //                       borderRadius: BorderRadius.circular(5)),
            //                   height: 45,
            //                   child: const Center(
            //                     child: Text('Next',
            //                         style: TextStyle(
            //                             fontSize: 13,
            //                             fontWeight: FontWeight.w600,
            //                             color: Colors.white)),
            //                   )),
            //             )),
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // ) ://Image upload api calling pending // if yes +2 index
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
                                  final index = questionList[questionIndex]['options'][pos]['option'];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0.0, top: 8.0, bottom: 8.0,),
                                    child: Row(
                                      children: [
                                        selectIndex51 == index
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
                                              selectIndex51 = index;
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
                          selectIndex51 == "Yes" ?
                          Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(child: InkWell(
                                    onTap: () async {

                                      setState(() {

                                      });
                                      _openImagePicker1(context);

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

                              imageList1.length==0?Container(): Container(
                                height: 60,
                                child: ListView.builder(
                                    itemCount: imageList1.length,
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
                                                        File(imageList1[pos].path)
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
                              if (selectIndex51 != "-1"){
                                if (selectIndex51 == "No"){
                                  questionIndex = questionIndex + 2;
                                }else{
                                  questionIndex = questionIndex + 2;
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
            )  :
            questionIndex == 74 ?

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
            Container(
              //height: 110,
              margin: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
              decoration: BoxDecoration(
                  color:
                  AppTheme.buttonColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                margin: EdgeInsets.only(left: 15,top: 15, bottom: 30),
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
                      margin: EdgeInsets.only(right: 12),
                      child: TextFormField(
                        //validator: textValidation,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')), // Allow only alphabetic characters
                          ],
                          controller: question24Controller,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            labelText: 'Enter here',
                            labelStyle: const TextStyle(
                              fontSize: 15.0,
                              color: AppTheme.grayColor,
                            ),
                          )),
                    ),// TextField Container
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            questionIndex = questionIndex - 2;
                            setState(() {

                            });
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 0,right: 16,top: 8),
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
                              submitAnswers();
                              // setState(() {
                              //
                              // });
                            }
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 8,right: 16,top: 8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              child: const Center(
                                child: Text('Submit',
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
            )
          // TextFieldStringWidget(
          //   controller: question24Controller,
          //   onNextTap: () {
          //     if (question24Controller.text == "") {
          //       final snackBar = SnackBar(
          //         content: Container(
          //           margin: EdgeInsets.only(left: 20, right: 20),
          //           // Adjust left and right margins
          //           child: Text(
          //             'Field is required',
          //             textAlign: TextAlign.center,
          //           ),
          //         ),
          //         backgroundColor: Colors.red,
          //         duration: Duration(seconds: 3),
          //       );
          //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
          //     }
          //
          //     else {
          //       submitAnswers();
          //       // setState(() {
          //       //
          //       // });
          //     }
          //   },
          //
          //   onPreviousTap: () {
          //     questionIndex = questionIndex - 1;
          //     setState(() {
          //
          //     });
          //   },
          //
          //   questionMessage: questionList[questionIndex]['que_message'],
          //   questionName: questionList[questionIndex]['question'],
          //
          // )



        ),
      ),
    );
  }

  void initState() {
    // TODO: implement initState
    super.initState();

    checkInternet();




  }





  checkInternet()async{
    bool? loginStatusValue=await MyUtils.getSharedPreferencesBool("loginStatus");
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      print("Data Fetched Locally");
      fetchLocalData();
    }
    else if(loginStatusValue == true){
      fetchLocalData();
    }

    else
      {
        questionList = widget.surveyDataList[0]['questions'];
        print("Question List "+ questionList.length.toString());

        Future.delayed(const Duration(seconds: 0), () {
          print(widget.surveyDataList);
        });

        setState(() {

        });
      }

  }

  fetchLocalData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var data=preferences.getString("question_list");
    List<dynamic> list2 = jsonDecode(data!);
    questionList=list2;
    setState(() {

    });
  }





  generateList(questionList) {
    Map list={};
    questionList.forEach((element) {
      list[element.id] = element.toMap();
    });
    return json.encode(list);
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
    final connectivityResult = await (Connectivity().checkConnectivity());
    String slectIndics2 = {selectedIndices2,_controllerTab1.map((controller) => controller.text),question47Controller.text}.toString();
    String slectIndics4 = {selectedIndices4,_controllerTab2.map((controller) => controller.text),question48Controller.text}.toString();
    String slectIndics7 = {selectedIndices7,_controllerTab4.map((controller) => controller.text),question46Controller.text}.toString();
    String slectIndics5 = {selectedIndices5,question32Controller.text}.toString();
    String selectIndexs = {selectIndex,question27Controller.text}.toString();
    String selectIndexs1 = {selectIndex1,question31Controller.text}.toString();
    String selectIndexs2 = {selectIndex2,question33Controller.text}.toString();
    String selectIndexs4 = {selectIndex4,question28Controller.text}.toString();
    String selectIndexs9 = {selectIndex9,question29Controller.text}.toString();
    String selectIndexs32 = {selectIndex32,question34Controller.text}.toString();
    String selectIndexs33 = {selectIndex33,question35Controller.text}.toString();
    String selectIndexs34 = {selectIndex34,question36Controller.text}.toString();
    String selectIndexs35 = {selectIndex35,question37Controller.text}.toString();
    String selectIndexs36 = {selectIndex36,question38Controller.text}.toString();
    String selectIndexs37 = {selectIndex37,question39Controller.text}.toString();
    String selectIndexs38 = {selectIndex38,question40Controller.text}.toString();
    String selectIndexs39 = {selectIndex39,question41Controller.text}.toString();
    String selectIndexs44 = {selectIndex44,question42Controller.text}.toString();
    String selectIndexs45 = {selectIndex45,question43Controller.text}.toString();
    String selectIndexs49 = {selectIndex49,question44Controller.text}.toString();
    String selectIndexs16 = {selectIndex16,question30Controller.text}.toString();
    String selectIndexs23 = {question16Controller.text,question45Controller.text}.toString();
    String selectIndexs19 = {selectIndex19,_startDate3.toString(),question17Controller.text}.toString();
    String selectIndexs20 = {selectIndex20,_startDate4.toString(),question18Controller.text}.toString();
    String selectIndexs21 = {selectIndex21,_startDate5.toString(),question19Controller.text}.toString();
    String slectIndics6  = {selectedIndices6,_controllerTab3.map((controller) => controller.text)}.toString();
    String selectIndexs50 = '';
    if (selectIndex50 == "Yes"){
      selectIndexs50 = {selectIndex50,imageList}.toString();
    }else if (selectIndex50 == "No"){
      selectIndexs50 = {selectIndex50,flagStatus,flagStatus2}.toString();
    }
    String selectIndexs51 = {selectIndex51,imageList1}.toString();

    String? empId=await MyUtils.getSharedPreferences("empId");
    String? name=await MyUtils.getSharedPreferences("name");

    var requestModel = {
      "name": name,
      "id": empId,
      "answer" : answers
    };

    answers.add({'_id':questionList[0]['_id'],'answer':question1Controller.text});
    answers.add({'_id':questionList[1]['_id'],'answer':question2Controller.text});
    answers.add({'_id':questionList[2]['_id'],'answer':question3Controller.text});
    answers.add({'_id':questionList[3]['_id'],'answer':question4Controller.text});
    answers.add({'_id':questionList[4]['_id'],'answer':_startDate.toString()});
    answers.add({'_id':questionList[5]['_id'],'answer':question5Controller.text});
    //answers.add({'_id':questionList[6]['_id'],'answer':selectedIndices.toString()});
    answers.add({'_id':questionList[6]['_id'],'answer': slectIndics2});
    //answers.add({'_id':questionList[8]['_id'],'answer':selectedIndices3.toString()});
    answers.add({'_id':questionList[7]['_id'],'answer': slectIndics4});
    answers.add({'_id':questionList[8]['_id'],'answer':question6Controller.text});
    answers.add({'_id':questionList[9]['_id'],'answer':question7Controller.text});
    answers.add({'_id':questionList[10]['_id'],'answer':question8Controller.text});
    answers.add({'_id':questionList[11]['_id'],'answer':question9Controller.text});
    answers.add({'_id':questionList[12]['_id'],'answer':question10Controller.text});
    answers.add({'_id':questionList[13]['_id'],'answer':selectIndexs});
    answers.add({'_id':questionList[14]['_id'],'answer':selectIndexs1});
    answers.add({'_id':questionList[15]['_id'],'answer':slectIndics5});
    // answers.add({'_id':questionList[16]['_id'],'answer':question11Controller.text});
    // answers.add({'_id':questionList[17]['_id'],'answer':question12Controller.text});
    // answers.add({'_id':questionList[18]['_id'],'answer':question13Controller.text});
    // answers.add({'_id':questionList[19]['_id'],'answer':selectedIndices5.toString()});
    answers.add({'_id':questionList[16]['_id'],'answer':question14Controller.text});
    answers.add({'_id':questionList[17]['_id'],'answer':_startDate2.toString()});
    answers.add({'_id':questionList[18]['_id'],'answer':selectIndexs2});
    answers.add({'_id':questionList[19]['_id'],'answer':selectIndexs4});
    answers.add({'_id':questionList[20]['_id'],'answer':selectIndex5});
    answers.add({'_id':questionList[21]['_id'],'answer':question15Controller.text});
    answers.add({'_id':questionList[22]['_id'],'answer':selectIndex6});
    answers.add({'_id':questionList[23]['_id'],'answer':selectIndexs23});
    answers.add({'_id':questionList[24]['_id'],'answer':selectIndex7});
    answers.add({'_id':questionList[25]['_id'],'answer':selectIndex8});
    answers.add({'_id':questionList[26]['_id'],'answer':selectIndexs9});
    answers.add({'_id':questionList[27]['_id'],'answer':selectIndex10});
    answers.add({'_id':questionList[28]['_id'],'answer':selectIndex11});
    answers.add({'_id':questionList[29]['_id'],'answer':selectIndex12});
    answers.add({'_id':questionList[30]['_id'],'answer':selectIndex13});
    answers.add({'_id':questionList[31]['_id'],'answer':selectIndex14});
    answers.add({'_id':questionList[32]['_id'],'answer':selectIndex15});
    answers.add({'_id':questionList[33]['_id'],'answer':selectIndexs16});
    answers.add({'_id':questionList[34]['_id'],'answer':selectIndex17});
    answers.add({'_id':questionList[35]['_id'],'answer':selectIndex18});
    answers.add({'_id':questionList[36]['_id'],'answer':selectIndexs19});
    //answers.add({'_id':questionList[41]['_id'],'answer':question17Controller.text});
    answers.add({'_id':questionList[37]['_id'],'answer':selectIndexs20});
    //answers.add({'_id':questionList[43]['_id'],'answer':question18Controller.text});
    answers.add({'_id':questionList[38]['_id'],'answer':selectIndexs21});
    //answers.add({'_id':questionList[45]['_id'],'answer':question19Controller.text});
    answers.add({'_id':questionList[39]['_id'],'answer':selectIndex22});
    answers.add({'_id':questionList[40]['_id'],'answer':selectIndex23});
    answers.add({'_id':questionList[41]['_id'],'answer':question20Controller.text});
    answers.add({'_id':questionList[42]['_id'],'answer':selectIndex24});
    answers.add({'_id':questionList[43]['_id'],'answer':selectIndex25});
    answers.add({'_id':questionList[44]['_id'],'answer':selectIndex26});
    answers.add({'_id':questionList[45]['_id'],'answer':selectIndex27});
    answers.add({'_id':questionList[46]['_id'],'answer':slectIndics6});
    answers.add({'_id':questionList[47]['_id'],'answer':question21Controller.text});
    answers.add({'_id':questionList[48]['_id'],'answer':selectIndex28});
    answers.add({'_id':questionList[49]['_id'],'answer':selectIndex29});
    answers.add({'_id':questionList[50]['_id'],'answer':selectIndex30});
    answers.add({'_id':questionList[51]['_id'],'answer':selectIndex31});
    answers.add({'_id':questionList[52]['_id'],'answer':selectIndexs32});
    answers.add({'_id':questionList[53]['_id'],'answer':selectIndexs33});
    answers.add({'_id':questionList[54]['_id'],'answer':selectIndexs34});
    answers.add({'_id':questionList[55]['_id'],'answer':selectIndexs35});
    answers.add({'_id':questionList[56]['_id'],'answer':selectIndexs36});
    answers.add({'_id':questionList[57]['_id'],'answer':selectIndexs37});
    answers.add({'_id':questionList[58]['_id'],'answer':selectIndexs38});
    answers.add({'_id':questionList[59]['_id'],'answer':selectIndexs39});
    answers.add({'_id':questionList[60]['_id'],'answer':selectIndex40});
    answers.add({'_id':questionList[61]['_id'],'answer':selectIndex41});
    answers.add({'_id':questionList[62]['_id'],'answer':selectIndex42});
    answers.add({'_id':questionList[63]['_id'],'answer':selectIndex43});
    answers.add({'_id':questionList[64]['_id'],'answer':selectIndexs44});
    answers.add({'_id':questionList[65]['_id'],'answer':selectIndexs45});
    answers.add({'_id':questionList[66]['_id'],'answer':slectIndics7});
    answers.add({'_id':questionList[67]['_id'],'answer':selectIndex46});
    answers.add({'_id':questionList[68]['_id'],'answer':selectIndex47});
    answers.add({'_id':questionList[69]['_id'],'answer':selectIndex48});
    answers.add({'_id':questionList[70]['_id'],'answer':selectIndexs49});
    answers.add({'_id':questionList[71]['_id'],'answer':question22Controller.text});
    answers.add({'_id':questionList[72]['_id'],'answer':selectIndexs50});
    answers.add({'_id':questionList[73]['_id'],'answer':selectIndexs51});
    answers.add({'_id':questionList[74]['_id'],'answer':question23Controller.text});
    answers.add({'_id':questionList[75]['_id'],'answer':question24Controller.text});
    // answers.add({'_id':questionList[76]['_id'],'answer':question24Controller.text});
    // Do for all answers according to type of widget

    // print(answers);

    if(connectivityResult == ConnectivityResult.none)
      {
        Navigator.pop(context);
        storeAnswerDataLocally(answers);
      }
    else
      {
        ApiBaseHelper helper = ApiBaseHelper();
        var response =
        await helper.postAPINew('Avanti/SubmitAppSurvey', requestModel, context);
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





  }


  storeAnswerDataLocally(List<dynamic> answerList) async {
    APIDialog.showAlertDialog(context, 'Please wait...');
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String json = jsonEncode(answerList);
    await preferences.setString('answer_list',json);
    Navigator.pop(context);

    Toast.show("success !!",
        duration: Toast.lengthLong,
        gravity: Toast.bottom,
        backgroundColor: Colors.green);
    Navigator.pop(context);

  }


  _uploadFiles() async {
    FocusScope.of(context).unfocus();
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
    print("https://api.doyoursurvey.com:3009/Avanti/saveImage");
    var response = await dio.post(
        "https://api.doyoursurvey.com:3009/Avanti/saveImage",
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
  _uploadFiles1() async {
    FocusScope.of(context).unfocus();
    APIDialog.showAlertDialog(context, 'Uploading Images...');
    // String fileName = xFile.path.split('/').last;
    FormData? formData= FormData.fromMap({
      "Id": "5512341709435",
      "artifactType": "LUC",
    });

    for (int i = 0; i <imageList1.length; i++) {
      var path = imageList1[i].path.toString();
      formData.files.addAll([
        MapEntry("file", await MultipartFile.fromFile(path, filename: path))
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
  void _openImagePicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Image Source'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  onTap: () async {
                    Navigator.pop(context);
                    XFile? pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);
                    if (pickedImage != null) {
                      setState(() {
                        imageList.add(pickedImage); // Add picked image to the list
                      });
                    }

                    _uploadFiles();
                    // Close the dialog
                  },
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('Open Camera'),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    Navigator.pop(context);
                    pickedImage = await picker.pickMultiImage();
                    imageList=imageList+pickedImage;
                    setState(() {

                    });
                    _uploadFiles();
                    // Close the dialog
                  },
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('Open Gallery'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  void _openImagePicker1(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Image Source'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  onTap: () async {
                    Navigator.pop(context);
                    final XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
                    if (pickedFile != null) {
                      setState(() {
                        imageList1!.add(pickedFile); // Add picked image to the list
                      });
                    }

                    _uploadFiles1();
                    // Close the dialog
                  },
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('Open Camera'),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    Navigator.pop(context);
                    final List<XFile> images = await picker.pickMultiImage();
                    imageList1= imageList1+images;
                    setState(() {

                    });
                    _uploadFiles();
                    // Close the dialog
                  },
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('Open Gallery'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  void sendFlagStatus(BuildContext context) {
    showModalBottomSheet(
      context: context,
      //isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.0),
        ),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context,bottomSheetState)
        {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              color: Colors.white,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            //margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,    // Set the desired width
                      height: 2,     // Set the desired height
                      color: Colors.grey,
                    )
                  ],
                ),
                SizedBox(height: 16),
                const Row(
                  children: [
                    Expanded(
                      child: Text(
                        'LUC Pic Reason.',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: AppTheme.blueColor
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Container(
                  width: double.infinity,  // Set the desired width
                  height: 1,     // Set the desired height
                  color: Colors.grey,
                ),
                ListView.builder(
                    padding: EdgeInsets.only(top: 4),
                    itemCount: notCapturedList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int pos) {
                      return GestureDetector(
                        onTap: (){
                          flagStatus = notCapturedList[pos]["name"];

                          selectIndexCap = pos;
                          _currentColor = Colors.grey;


                          print(selectIndexCap);
                          bottomSheetState(() {

                          });
                          setState(() {


                          });
                          Navigator.pop(context);
                        },
                        child: Container(
                          color: selectIndexCap == pos ? _currentColor : Colors.white,
                          child: Column(
                            children: [
                              SizedBox(height: 16.0), // Add vertical spacing
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 12.0), // Set left padding
                                    child: Text(notCapturedList[pos]["name"].toString(),
                                      style: TextStyle(
                                        fontSize: 13.0,
                                        color: AppTheme.blackColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 12.0),
                            ],
                          ),
                        ),
                      );
                    }),
                SizedBox(height: 30),
              ],
            ),
          );
        }

        );
      },
    );
  }
  void sendFlagStatus1(BuildContext context) {
    showModalBottomSheet(
      context: context,
      //isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.0),
        ),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context,bottomSheetState)
        {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              color: Colors.white,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            //margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,    // Set the desired width
                      height: 2,     // Set the desired height
                      color: Colors.grey,
                    )
                  ],
                ),
                SizedBox(height: 16),
                const Row(
                  children: [
                    Expanded(
                      child: Text(
                        'LUC Pic Reason.',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: AppTheme.blueColor
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Container(
                  width: double.infinity,  // Set the desired width
                  height: 1,     // Set the desired height
                  color: Colors.grey,
                ),
                ListView.builder(
                    padding: EdgeInsets.only(top: 4),
                    itemCount: selectIndexCap == 1? notCaptured2List.length:notCaptured3List.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int pos) {
                      return GestureDetector(
                        onTap: (){
                          flagStatus2 = selectIndexCap == 1? notCaptured2List[pos]["name"] :notCaptured3List[pos]["name"];

                          selectIndexCap2 = pos;
                          _currentColor = Colors.grey;


                          print(selectIndexCap2);
                          bottomSheetState(() {

                          });
                          setState(() {


                          });
                          Navigator.pop(context);
                        },
                        child: Container(
                          color: selectIndexCap2 == pos ? _currentColor : Colors.white,
                          child: Column(
                            children: [
                              SizedBox(height: 8.0), // Add vertical spacing
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 12.0), // Set left padding
                                    child: Text(selectIndexCap == 1? notCaptured2List[pos]["name"].toString():notCaptured3List[pos]["name"].toString(),
                                      style: TextStyle(
                                        fontSize: 13.0,
                                        color: AppTheme.blackColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8.0),
                            ],
                          ),
                        ),
                      );
                    }),
                SizedBox(height: 20),
              ],
            ),
          );
        }

        );
      },
    );
  }
}
