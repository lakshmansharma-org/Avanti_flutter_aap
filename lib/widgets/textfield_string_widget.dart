


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/app_theme.dart';

class TextFieldStringWidget extends StatelessWidget
{
  final String questionName;
  final String questionMessage;
  var controller;
  Function onNextTap;
  Function onPreviousTap;
  final bool enabled;
  TextFieldStringWidget({required this.questionName,this.controller,required this.questionMessage,required this.onNextTap,required this.onPreviousTap,required this.enabled});
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 110,
      margin: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
      decoration: BoxDecoration(
          color:
          AppTheme.buttonColor.withOpacity(0.15),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Container(
        margin: const EdgeInsets.only(left: 15,top: 15, bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  questionName,
                  style: const TextStyle(
                      fontSize: 16,
                      color: AppTheme.blackColor,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Text(questionMessage,
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
                  keyboardType: TextInputType.text,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')), // Allow only alphabetic characters
                  ],
                  controller: controller,
                  enabled: enabled,
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
                    onPreviousTap();

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

                    onNextTap();
                  /*  if (questionList[questionIndex]['_id'] == "642c4296a9eab56bcf8809d5"){
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
*/
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

}


class TextFieldProfileWidget extends StatelessWidget
{
  final String title,initialValue;
  var controller;
  final String? Function(String?)? validator;
  TextFieldProfileWidget(this.title,this.initialValue,this.controller,this.validator);
  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Padding(
          padding: const EdgeInsets.only(left: 14),
          child: Text(
              title,
              style: TextStyle(
                fontSize: 13,
                height: 0.5,
                color: Color(0xFF00407E),
              )),
        ),

        Container(
          margin: EdgeInsets.symmetric(horizontal: 14),
          child: TextFormField(
            controller: controller,
            validator: validator,
            keyboardType: TextInputType.number,
            decoration:  InputDecoration(
                hintText: initialValue,
                hintStyle: TextStyle(
                    fontSize: 14,
                  color: Colors.grey
                )
            ),
            enabled: false,
          ),
        ),

      ],
    );
  }

}