
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_theme.dart';

class DateWidget extends StatelessWidget
{
  final String questionName;
  final String questionMessage;
  Function onNextTap;
  Function onPreviousTap;
  Function onCalenderTap;
   DateTime? startDate;
  DateWidget({required this.questionName,required this.questionMessage,required this.onNextTap,required this.onPreviousTap,required this.onCalenderTap,required this.startDate});
  @override
  Widget build(BuildContext context) {
    return Container(
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
                  questionName,
                  style: TextStyle(
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
              height: 40,
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                       onCalenderTap();
                      },
                      child: Container(
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 0),
                              child: Text(
                                  startDate == null
                                      ? 'Select Date'
                                      : startDate.toString().substring(0, 10),
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
