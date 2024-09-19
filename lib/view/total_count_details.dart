import 'dart:math';

import 'package:intl/intl.dart';
import 'package:qsurvey_flutter/utils/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:qsurvey_flutter/view/upload_images_screen.dart';



class TotalCountDetails extends StatefulWidget {
  TotalCountDetailsState createState() => TotalCountDetailsState();
  List<dynamic> totalBasicDetails = [];
  TotalCountDetails(this.totalBasicDetails);
}

class TotalCountDetailsState extends State<TotalCountDetails>{

  String result = "";
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppTheme.blueColor,
        leading: IconButton(
          icon: Image.asset(
            'assets/back_white.png',
            width: 20,
            height: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Total Count Details',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,

      ),
      body: Container(

        child:
        widget.totalBasicDetails.length==0?
        Center(
          child: Text("No record found!"),
        ):ListView.builder(
            itemCount: widget.totalBasicDetails.length,
            shrinkWrap: true,
            //physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context,int pos)
            {
              String dateStr = widget.totalBasicDetails[pos]["date"];

              DateTime dateTime = DateTime.parse(dateStr);

              String formattedDate = DateFormat('dd-MM-yyyy').format(dateTime);

              return Column(
                children: [
                  SizedBox(height: 15),
                  Card(
                    margin: EdgeInsets.only(left: 12,right: 12),
                    color: Color(0xFfF9F9F9),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        //color: Color(0xFfF9F9F9),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text('Loan Number:- ',style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF000000),
                                )),
                                SizedBox(height: 6),
                                Text(widget.totalBasicDetails[pos]["Please enter loan number"].toString(),
                                    style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey,
                                ),
                                  softWrap: true,
                                ),


                              ],
                            ),

                            SizedBox(height: 20),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text('Partner Name:- ',style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF000000),
                                )),
                                SizedBox(height: 6),
                                Expanded(
                                  child: Text(
                                    widget.totalBasicDetails[pos]["Enter Partner Name"].toString(),
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey,
                                    ),
                                    softWrap: true,  // Ensures the text can wrap
                                    overflow: TextOverflow.visible,  // Makes sure the text is not truncated
                                  ),
                                ),

                              ],
                            ),
                            SizedBox(height: 20),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Text('Date:- ',style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF000000),
                                    )),
                                    SizedBox(height: 6),
                                    Text(formattedDate.toString(),style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey,
                                    )),


                                  ],
                                ),

                              ],
                            ),
                            SizedBox(height: 20),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text('Location:- ',style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF000000),
                                )),
                                SizedBox(height: 6),
                                Expanded(child: Text(widget.totalBasicDetails[pos]["Location Name"].toString(),style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey,
                                ),
                                  softWrap: true,  // Ensures the text can wrap
                                  overflow: TextOverflow.visible,

                                ),),

                                widget.totalBasicDetails[pos]["isArtifactUploaded"] == false
                                    ? Align(
                                  alignment: Alignment.centerRight,
                                  child:GestureDetector(
                                    onTap: () async {
                                      result = await Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => UploadImagesScreen(widget.totalBasicDetails[pos]["Enter Partner Name"].toString(),widget.totalBasicDetails[pos]["Location Name"].toString(),widget.totalBasicDetails[pos]["Please enter loan number"].toString())),
                                      );
                                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>UploadImagesScreen(widget.totalBasicDetails[pos]["Enter Partner Name"].toString(),widget.totalBasicDetails[pos]["Location Name"].toString(),widget.totalBasicDetails[pos]["Please enter loan number"].toString())));
                                    },
                                    child: Container(
                                      width: 45,
                                      decoration: BoxDecoration(
                                          color: AppTheme.blueColor,
                                          borderRadius: BorderRadius.circular(22.5)),
                                      height: 45,
                                      child: Image.asset(
                                        'assets/image_up.png',
                                        width: 15,
                                        height: 15,
                                      ),),
                                  ),
                                ):Align(),


                              ],
                            ),


                          ],
                        ),
                      ),

                    ),
                  ),

                ],
              );
            }


        ),

      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
}
