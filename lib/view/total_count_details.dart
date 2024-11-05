import 'dart:convert';
import 'dart:ffi';
import 'dart:math';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:intl/intl.dart';
import 'package:qsurvey_flutter/utils/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:qsurvey_flutter/view/upload_images_screen.dart';
import 'package:toast/toast.dart';

import '../network/Utils.dart';
import '../network/api_dialog.dart';
import '../network/api_helper.dart';



class TotalCountDetails extends StatefulWidget {
  TotalCountDetailsState createState() => TotalCountDetailsState();
  int totalCount;
  TotalCountDetails(this.totalCount);
}

class TotalCountDetailsState extends State<TotalCountDetails>{
  List<dynamic> totalBasicDetails = [];
  String result = "";
  bool isLoading = false;
  int selectedValue = 10;
  bool isSelectDate = false;
  @override
  DateTime? selectedDate; // Holds the selected date
  List<dynamic> filteredDetails = [];
  String formattedDate = '';
  var dateController = TextEditingController();

  List<dynamic> allItems = [];
  int currentPage = 0;
  int itemsPerPage = 10;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        String formattedDate = DateFormat('yyyy-MM-dd').format(picked);
        dateController.text = formattedDate.toString();
        isSelectDate = true;
        currentPage = 0;
        getTotalCount(dateController.text,selectedValue.toString(),"0");
      });
    }
  }



  int get totalPages => (widget.totalCount / selectedValue).ceil();


  void goToPage(int page) {
    setState((){
      currentPage = page;
      getTotalCount(dateController.text,selectedValue.toString(),currentPage.toString());

    });
  }

  void goToNextPage() {
    if (currentPage < totalPages - 1) {
      setState((){
        currentPage++;
        getTotalCount(dateController.text,selectedValue.toString(),currentPage.toString());
      });
    }
  }


  void goToPreviousPage() {
    if (currentPage > 0) {
      setState((){
        currentPage--;
        getTotalCount(dateController.text, selectedValue.toString(),currentPage.toString());
      });
    }
  }


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
      body: Column(
        children: [


          Container(
            margin: EdgeInsets.only(left: 10,right: 10,top: 10),
            child:TextField(
              readOnly: true,
              controller: dateController,
              decoration: InputDecoration(
                labelText: formattedDate == null
                    ? 'Select a Date'
                    : 'Selected Date: ${formattedDate}',
                suffixIcon: Icon(Icons.calendar_today),

              ),
              onTap: () {
                _selectDate(context); // Open date picker when tapping on the field
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            alignment: Alignment.centerLeft, // Aligns the text to the left
            child: Text(
              "Paginated Entries",
              textAlign: TextAlign.left, // Ensures text alignment
              style: TextStyle(
                fontSize: 16, // Set desired font size
                fontWeight: FontWeight.normal, // Optional: make the text bold
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10,right: 10,bottom: 5),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: DropdownButtonFormField2<int>(
              hint: Text('Select a value'),
              value: selectedValue,
              decoration: InputDecoration(
                border: InputBorder.none,

              ),
              items: [10, 20, 30, 40].map((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
              onChanged: (int? newValue) {
                setState(() {
                  selectedValue = newValue!;
                  isSelectDate = true;
                  currentPage = 0;
                  getTotalCount(dateController.text, selectedValue.toString(), "0");
                });
              },
              buttonStyleData: ButtonStyleData(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 25, // Set desired height
              ),
            ),



          ),

          Expanded(
              child: Container(
                child:
                allItems.length==0?
                Center(
                  child: Text("No record found!"),
                ):ListView.builder(
                    itemCount: allItems.length,
                    shrinkWrap: true,
                    //physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context,int pos)
                    {
                      String dateStr = allItems[pos]["date"];

                      DateTime dateTime = DateTime.parse(dateStr);

                      String formattedDate = DateFormat('dd-MM-yyyy').format(dateTime);

                      var detail = allItems[pos] as Map<String, dynamic>;
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
                                        Text(detail["Please enter loan number"].toString(),
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
                                            detail["Enter Partner Name"].toString(),
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
                                        Expanded(child: Text(detail["Location Name"].toString(),style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.grey,
                                        ),
                                          softWrap: true,  // Ensures the text can wrap
                                          overflow: TextOverflow.visible,

                                        ),),

                                        detail["isArtifactUploaded"] == false
                                            ? Align(
                                          alignment: Alignment.centerRight,
                                          child:GestureDetector(
                                            onTap: () async {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => UploadImagesScreen(allItems[pos]["Enter Partner Name"].toString(),allItems[pos]["Location Name"].toString(),allItems[pos]["Please enter loan number"].toString())),
                                              ).then((result) {
                                                if (result == "true") {
                                                  // Call your API function here
                                                  getTotalCount("", "", ""); // Replace fetchData with the function you use to call the API
                                                }
                                              });
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

              )
          ),

          // Pagination buttons

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: (currentPage > 0) ? goToPreviousPage : null,
              ),
              SizedBox(width: 5),
              Expanded(child: Container(
                height:60,
                child: ListView.builder(
                    itemCount: totalPages,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context,int pos)

                    {
                      return Row(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: (pos == currentPage) ? Colors.blue : Colors.grey,
                            ),
                            onPressed: () => goToPage(pos),
                            child: Text('${pos + 1}'), // Display page numbers as 1, 2, 3...
                          ),
                          SizedBox(width: 5,)
                        ],
                      );
                    }


                ),
              ),),
              SizedBox(width: 5),
              IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: (currentPage < totalPages -1) ? goToNextPage : null,
              ),
            ],
          ),
          SizedBox(height: 25),

        ],
      ),
    );
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTotalCount("","","");
  }

  getTotalCount(String date, String pageSize,String currentPage) async {
    setState(() {
      isLoading=true;
    });
    String? empID = await MyUtils.getSharedPreferences("empId");
    var requestModel = {
      "id": empID,
      "date": date,
      "pageSize": pageSize.toString(),
      "pageNumber": currentPage.toString()
    };
    ApiBaseHelper helper = ApiBaseHelper();
    var response =
    await helper.postAPINew('Avanti/todayAndTotalData', requestModel, context);
    isLoading = false;
    var responseJSON = json.decode(response.body);
    isLoading=false;
    print(responseJSON);
    if (responseJSON['code'] == 200) {
      Toast.show(responseJSON['message'],
          duration: Toast.lengthLong,
          gravity: Toast.bottom,
          backgroundColor: Colors.green);
      allItems = responseJSON['data']['totalDetails'];


    } else {
      Toast.show(responseJSON['message'],
          duration: Toast.lengthLong,
          gravity: Toast.bottom,
          backgroundColor: Colors.red);
    }
    setState(() {});

  }

}
