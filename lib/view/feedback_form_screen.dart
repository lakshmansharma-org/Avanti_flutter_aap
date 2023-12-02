import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';

import '../utils/app_theme.dart';


class FeedbackFormScreen extends StatefulWidget{
  final bool showBack;
  List<dynamic> surveyDataList = [];
  FeedbackFormScreen(this.showBack,this.surveyDataList);
  @override
  FeedbackFormState createState()=> FeedbackFormState();
}

class FeedbackFormState extends State<FeedbackFormScreen> {
  @override
  var usernameController = TextEditingController();
  var number=TextEditingController();
  var text=TextEditingController();
  List<dynamic> questionList = [];
  List<dynamic> option = [];
  Set<int> selectedIndices = {};
  var selectDate = '12';
  var lucData = '13';
  var borrowerData = '14';
  int selectIndex=-1;
  int questionIndex=0;
  late bool isSelected;
  DateTime? _startDate =  null;

  void goToNext() {
    setState(() {
      number.text = '';
      text.text = '';
      _startDate = null;
      questionIndex = (questionIndex + 1);
      option = questionList[questionIndex]['options'];
    });
  }
  void goToBack() {
    setState(() {
      questionIndex = (questionIndex - 1);
    });
  }
  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? pickedStartDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (pickedStartDate != null && pickedStartDate != _startDate) {
      setState(() {
        _startDate = pickedStartDate;
      });
    }
  }
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
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
          body:(questionList[questionIndex]['type'] == "number")?Container(
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
                      validator: textValidation,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(13), // Allow only numbers
                        ],
                        controller: number,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          labelText: 'Type Number',
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
                          if (questionIndex != 0){
                             goToBack();
                           }
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
                          if (questionList[questionIndex]['_id'] == "642c4296a9eab56bcf8809d5"){
                            if (number.text.length == 13){
                              goToNext();
                            }else{
                              final snackBar = SnackBar(
                                content: Container(
                                  margin: EdgeInsets.only(left: 20,right: 20), // Adjust left and right margins
                                  child: Text(
                                    'Enter 13 digit loan number',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                backgroundColor: Colors.red,
                                duration: Duration(seconds: 3),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            }
                          }else{
                            if (number.text.isNotEmpty){
                              goToNext();
                            } else {
                              final snackBar = SnackBar(
                                content: Container(
                                  margin: EdgeInsets.only(left: 20,right: 20), // Adjust left and right margins
                                  child: Text(
                                    'Filled is required.',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                backgroundColor: Colors.red,
                                duration: Duration(seconds: 3),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            }
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
          ):// text
          (questionList[questionIndex]['type'] == "text")?Container(
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
                      validator: textValidation,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')), // Allow only alphabetic characters
                        ],
                        controller: text,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          labelText: 'Type Text',
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
                          goToBack();
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
                          if (text.text.isNotEmpty) {
                           goToNext();
                          } else {
                            final snackBar = SnackBar(
                              content: Container(
                                margin: EdgeInsets.only(left: 20,right: 20), // Adjust left and right margins
                                child: Text(
                                  'Filled is required.',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              backgroundColor: Colors.red,
                              duration: Duration(seconds: 3),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
          ):// number
          (questionList[questionIndex]['type'] == "date")?Container(
            //height: 110,
            margin: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15,),
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
                    height: 40,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              _selectStartDate(context);
                            },
                            child: Container(
                              height: 40,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 0),
                                    child: Text(
                                        _startDate == null
                                            ? 'Select Date'
                                            : _startDate.toString().substring(0, 10),
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
                  SizedBox(height: 20.0),
                  Row(
                    children: [
                      Expanded(child: InkWell(
                        onTap: () {
                          goToBack();
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
                          if (_startDate == null){
                            final snackBar = SnackBar(
                              content: Container(
                                margin: EdgeInsets.only(left: 20,right: 20), // Adjust left and right margins
                                child: Text(
                                  'Filled is required.',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              backgroundColor: Colors.red,
                              duration: Duration(seconds: 3),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }else{
                            goToNext();
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
          (questionList[questionIndex]['type'] == 'radio' && questionList[questionIndex]['selection'] == 'date')?Container(
            //height: 110,
            margin: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15,),
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
                    child: Column(
                      children: [
                        ListView.builder(
                            itemCount: option.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            //scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext context, int pos) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 0.0,top: 8.0,bottom: 8.0,),
                                child: Row(
                                  children: [
                                    selectIndex == pos
                                        ? Image.asset('assets/selectRadio.png',
                                        width: 24, height: 24)
                                        : InkWell(
                                      child: Image.asset(
                                          'assets/unSelectRadio.png',
                                          width: 24,
                                          height: 24),
                                      onTap: () {
                                        setState(() {
                                          selectIndex = pos;
                                          // print(selectIndex);
                                        });
                                      },
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Text(option[pos]['option'],
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black)),
                                    ),
                                  ],
                                ),
                              );
                            }),
                        selectIndex == 0?
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
                                        _selectStartDate(context);
                                      },
                                      child: Container(
                                        height: 40,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(left: 0),
                                              child: Text(
                                                  _startDate == null
                                                      ? 'Select Date'
                                                      : _startDate.toString().substring(0, 10),
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
                            SizedBox(height: 20.0),
                            Container(
                              margin: EdgeInsets.only(right: 12),
                              child: TextFormField(
                                //validator: checkPasswordValidator,
                                  controller: number,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.zero,
                                    labelText: 'Type Number',
                                    labelStyle: const TextStyle(
                                      fontSize: 15.0,
                                      color: AppTheme.grayColor,
                                    ),
                                  )),
                            ),
                            SizedBox(height: 16.0),
                          ],
                        ):Container(),
                      ],
                    ),
                  ),// TextField Container
                  SizedBox(height: 20.0),
                  Row(
                    children: [
                      Expanded(child: InkWell(
                        onTap: () {
                          goToBack();
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
                          goToNext();
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
          ):// date picker
          (questionList[questionIndex]['type'] == "radio")?Container(
            //height: 110,
            margin: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15,),
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
                    child: Column(
                      children: [
                        Container(
                          height: 460,
                          child: ListView.builder(
                              itemCount: option.length,
                              shrinkWrap: true,
                              //physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemBuilder: (BuildContext context, int pos) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 0.0,top: 8.0,bottom: 8.0,),
                                  child: Row(
                                    children: [
                                      selectIndex == pos
                                          ? Image.asset('assets/selectRadio.png',
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
                                        child: Text(option[pos]['option'],
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
                        selectIndex == 5 ?
                        Column(
                          children: [
                            SizedBox(height: 16.0),
                            Container(
                              margin: EdgeInsets.only(right: 12),
                              child: TextFormField(
                                //validator: checkPasswordValidator,
                                  controller: text,
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
                        ): Container(),
                      ],
                    ),
                  ),// TextField Container
                  SizedBox(height: 20.0),
                  Row(
                    children: [
                      Expanded(child: InkWell(
                        onTap: () {
                          goToBack();
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
                          goToNext();
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
          (questionList[questionIndex]['type'] == 'checkbox' && questionList[questionIndex]['selection'] == 'mobile')?Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15,),
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
                    height: 300,
                    child:ListView.builder(
                        padding: EdgeInsets.only(bottom: 16.0),
                        itemCount: option.length,
                        shrinkWrap: true,
                        //physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int pos) {

                          return Padding(
                              padding: const EdgeInsets.only(left: 0.0,top: 8.0,bottom: 8.0,),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      selectedIndices.contains(pos)
                                          ? Image.asset('assets/check.png',
                                          width: 24, height: 24)
                                          : InkWell(
                                        child: Image.asset(
                                            'assets/unCheck.png',
                                            width: 24,
                                            height: 24),
                                        onTap: () {
                                          setState(() {
                                            if (selectedIndices.contains(pos)) {
                                              selectedIndices.remove(pos);
                                            } else {
                                              selectedIndices.add(pos);
                                            }
                                          });
                                        },
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Text(option[pos]['option'],
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black)),
                                      ),
                                    ],
                                  ),
                                  selectedIndices.contains(pos)?
                                  Container(
                                    margin: EdgeInsets.only(right: 12),
                                    child: TextFormField(
                                      //validator: checkPasswordValidator,
                                        controller: number,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.zero,
                                          labelText: 'Mob. Number',
                                          labelStyle: const TextStyle(
                                            fontSize: 15.0,
                                            color: AppTheme.grayColor,
                                          ),
                                        )),
                                  ):Container(),
                                ],
                              )
                          );
                        }),
                  ),// TextField Container
                  Row(
                    children: [
                      Expanded(child: InkWell(
                        onTap: () {
                          goToBack();
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
                          goToNext();
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
          ):// radio button with last index text
          (questionList[questionIndex]['type'] == "checkbox")?Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15,),
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
                    height: 480,
                    child:ListView.builder(

                        padding: EdgeInsets.only(bottom: 16.0),
                        itemCount: option.length,
                        shrinkWrap: true,
                        //physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int pos) {

                          return Padding(
                              padding: const EdgeInsets.only(left: 0.0,top: 8.0,bottom: 8.0,),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      selectedIndices.contains(pos)
                                          ? Image.asset('assets/check.png',
                                          width: 24, height: 24)
                                          : InkWell(
                                        child: Image.asset(
                                            'assets/unCheck.png',
                                            width: 24,
                                            height: 24),
                                        onTap: () {
                                          setState(() {
                                            if (selectedIndices.contains(pos)) {
                                              selectedIndices.remove(pos);
                                            } else {
                                              selectedIndices.add(pos);
                                            }
                                          });
                                        },
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Text(option[pos]['option'],
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black)),
                                      ),
                                    ],
                                  ),
                                  selectedIndices.contains(pos)?
                                  Container(
                                    margin: EdgeInsets.only(right: 12),
                                    child: TextFormField(
                                      //validator: checkPasswordValidator,
                                        controller: number,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.zero,
                                          labelText: 'Monthly Income',
                                          labelStyle: const TextStyle(
                                            fontSize: 15.0,
                                            color: AppTheme.grayColor,
                                          ),
                                        )),
                                  ):Container(),
                                ],
                              )
                          );
                        }),
                  ),// TextField Container
                  Row(
                    children: [
                      Expanded(child: InkWell(
                        onTap: () {
                          goToBack();
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
                          goToNext();
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
          ):// check box with text field// date picker and text field
          (questionList[questionIndex]['_id'] == "6507eb137bb7ce2eed895ce7")?Container(
            //height: 110,
            margin: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15,),
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
                    child: Column(
                      children: [
                        ListView.builder(
                            itemCount: 2,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            //scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext context, int pos) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 0.0,top: 8.0,bottom: 8.0,),
                                child: Row(
                                  children: [
                                    selectIndex == pos
                                        ? Image.asset('assets/selectRadio.png',
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
                                      child: Text('Yes',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black)),
                                    ),
                                  ],
                                ),
                              );
                            }),
                        selectIndex == 0 ?
                        Row(
                          children: [
                            Expanded(child: InkWell(
                              onTap: () {

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
                        ): Container(),
                        selectIndex == 1 ?
                            Column(
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
                                            //_selectStartDate(context);
                                          },
                                          child: Container(
                                            height: 40,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(left: 0),
                                                  child: Text(
                                                      lucData == "13"
                                                          ? 'Select LUC'
                                                          : lucData.toString(),
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black,
                                                      )),
                                                ),
                                                Icon(Icons.arrow_drop_down,
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
                                           // _selectStartDate(context);
                                          },
                                          child: Container(
                                            height: 40,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(left: 0),
                                                  child: Text(
                                                      borrowerData == "14"
                                                          ? 'Select Borrower'
                                                          : borrowerData.toString(),
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black,
                                                      )),
                                                ),
                                                Icon(Icons.arrow_drop_down,
                                                    color: Colors.black),
                                              ],
                                            ),
                                          ),
                                        ),

                                      ),
                                      const SizedBox(width: 10),
                                    ],
                                  ),
                                )
                              ],
                            ): Container(),
                      ],
                    ),
                  ),// TextField Container
                  SizedBox(height: 20.0),
                  Row(
                    children: [
                      Expanded(child: InkWell(
                        onTap: () {
                          goToBack();
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
                          goToNext();
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
          ):// two drop down
          //Mob number
          Container()
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

  }

  String? textValidation(String? value) {
    if (value!.isEmpty) {
      return 'Required field';
    }
    return null;
  }
}
