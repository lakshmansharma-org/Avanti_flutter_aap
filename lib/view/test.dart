import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_theme.dart';


class FeedbackFormScreen extends StatefulWidget{
  final bool showBack;
  FeedbackFormScreen(this.showBack);
  @override
  FeedbackFormState createState()=> FeedbackFormState();
}

class FeedbackFormState extends State<FeedbackFormScreen> {
  @override
  var usernameController = TextEditingController();
  var loanNumber=TextEditingController();
  var selectDate = '12';
  int selectIndex=-1;

  DateTime? _startDate =  null;


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
            body:ListView.builder(
                itemCount: 1,
                itemBuilder: (BuildContext context,int pos)
                {
                  return  Container(
                    //height: 110,
                    margin: EdgeInsets.only(left: 15, right: 15, top: 12, bottom: 0,),
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
                                'Loan Information',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppTheme.blackColor,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.0),
                          Text('Please enter loan number',
                            style: TextStyle(
                                fontSize: 14,
                                color: AppTheme.blackColor,
                                fontWeight: FontWeight.normal
                            ),
                          ),
                          SizedBox(height: 10.0),
                          pos == 0?
                          Container(
                            margin: EdgeInsets.only(right: 12),
                            child: TextFormField(
                              //validator: checkPasswordValidator,
                                controller: loanNumber,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  labelText: 'Type Here',
                                  labelStyle: const TextStyle(
                                    fontSize: 15.0,
                                    color: AppTheme.grayColor,
                                  ),
                                )),
                          ):// TextField Container
                          pos == 1?
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
                          ):// Select Date Container
                          pos == 2?
                          Container(
                            child: Column(
                              children: [
                                ListView.builder(
                                    itemCount: 6,
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
                                              child: Text('Name test',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.normal,
                                                      color: Colors.grey)),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                                selectIndex == 5 ?
                                Column(
                                  children: [
                                    SizedBox(height: 16.0),
                                    Container(
                                      margin: EdgeInsets.only(right: 12),
                                      child: TextFormField(
                                        //validator: checkPasswordValidator,
                                          controller: loanNumber,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.zero,
                                            labelText: 'Type Here',
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
                          ): // radio button conatiner
                          Container(),
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
                                  pos++;
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
                  );
                }

            )
        ),
      ),
    );
  }

}