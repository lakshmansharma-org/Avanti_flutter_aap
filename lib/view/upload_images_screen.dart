import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

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
import '../widgets/textfield_string_widget.dart';


class UploadImagesScreen extends StatefulWidget{
  @override
  DashboardState createState()=> DashboardState();
}

class DashboardState extends State<UploadImagesScreen> {
  @override
  var loanNumberController = TextEditingController();
  var branchController = TextEditingController();
  var partnerNameController = TextEditingController();
  bool isInternetConnected = true;
  List<XFile> imageList = [];
  List<XFile> lucImageList = [];
  int todayCount = 0;
  int totalCount = 0;
  final ImagePicker picker = ImagePicker();

  int selectedBranchNameIndex = 9999;
  int selectedPartnerNameIndex = 9999;
  StateSetter? branchSheet;
  StateSetter? partnerNameSheet;
  List<String> searchBranchList=[];
  List<String> searchPartnerNameList=[];
  List<String> branchList = [
    "Abhayapuri",
    "Agartala",
    "Aizawl",
    "Alanahalli",
    "Alewa",
    "Anand",
    "Arwal",
    "Ashthama",
    "Baburhat",
    "Badarpur",
    "Bagalkot",
    "Bah",
    "Bahadrabad",
    "Baihar",
    "Banda",
    "Bangarpete",
    "Banmankhi",
    "Barharwa",
    "Barobisha",
    "Bathnaha",
    "Begun",
    "Bennipatti",
    "Bettiah ",
    "Bharwara",
    "Bijapur",
    "Bilasipara",
    "Chakiya",
    "Chandia",
    "Chandrakona",
    "Chikkaballapura",
    "Choti Sadri",
    "Depalpur",
    "Dhamdaha",
    "Dhansura",
    "Dharmanagar",
    "Dhosa",
    "Doiwala",
    "Dumra",
    "Ellenabad",
    "Fakiragram",
    "Farah",
    "Fatehabad",
    "Gadhpura",
    "Gazipur",
    "Gonda",
    "Gossaigaon",
    "Guda Gorji",
    "Gundlupete",
    "H D Kote",
    "Hanuru",
    "Harda",
    "Hatta",
    "Hinjilicut",
    "Hiyatnagar",
    "Hojai",
    "Holenarasipura",
    "Hunsur",
    "Jagaluru",
    "Jalalgarh",
    "Jalaun",
    "Jamakhandi",
    "Jhabua",
    "Jhansi",
    "K R Nagar",
    "K R Pet",
    "Kakdwip",
    "Kalaburagi",
    "Kalyanpur",
    "Kandi",
    "Kandla",
    "Kangeyam",
    "Kannauj",
    "Kareli",
    "Karimganj",
    "Karnailganj",
    "Khalwa",
    "Khedbrahma",
    "Kiraoli",
    "Kolasib",
    "Kovilpatti",
    "Kumarghat",
    "Laksar ",
    "Langting",
    "Lingasur",
    "Lohapur",
    "Lucknow",
    "Lunglei",
    "Madhugiri",
    "Maharajganj",
    "Mahnar",
    "Majhauli",
    "Manamadurai",
    "Manikpur",
    "Mansa",
    "Mauganj",
    "Mauranipur",
    "Mayna",
    "Minapur",
    "Modinagar",
    "Muzaffarpur",
    "Nagal",
    "Nagerkoil",
    "Nanpara",
    "Natham",
    "Nichlaul",
    "Nuapada",
    "Padampur",
    "Padmapur",
    "Pakribarawan",
    "Palashi",
    "Paliganj",
    "Pandhana",
    "Panumaria",
    "Pasighat",
    "Pehowa",
    "Pharenda",
    "Plassey",
    "Polasara",
    "Pollachi",
    "Ponnamaravathy",
    "Pudukkottai",
    "Pundri",
    "Pupari",
    "Raipur",
    "Rajgurunagar",
    "Ramanathapuram",
    "Rania",
    "Rayagada",
    "Rehra",
    "Riga",
    "Rishikesh",
    "Rosera",
    "Runni Saidpur",
    "Sahibganj",
    "Salar",
    "Salem",
    "Santhemaralli",
    "Santirbazar",
    "Saraiya",
    "Sarsawa",
    "Sathanur",
    "Sedam",
    "Shahapur",
    "Shahzadpur",
    "Sidhmukh",
    "Sirmaur",
    "Sohela",
    "Srirangapattna",
    "Thandla",
    "Thiruvadanai",
    "Thisayanvilai",
    "Thuvarankurichi",
    "Tumkur",
    "Tusura",
    "Udaipur",
    "Udhwa",
    "Umreth",
    "Unnao",
    "Vijay Nagar",
    "Vijay Nagar",
    "Virpur",
    "Yelwala",
  ];


  List<String> partnerNemesList=[

    "Arriba",
    "Avanti Lucknow Hub",
    "Avanti Sandbox",
    "Citta Plus Consultancy Private Limited",
    "Cultivafin",
    "DCBS",
    "Disha Micro Credit",
    "GUFSPL",
    "Hindusthan Microfinance Pvt Ltd",
    "Jagaran",
    "Janakalyan",
    "MSM Microfinance",
    "NFPL",
    "Roots Reforms Initiative",
    "Sahyog Development Services",
    "Samparna",
    "Sub-K",
    "SURE Pvt Ltd",
    "Swabhimaan"

  ];


  String policyUrl = '';
  bool isLoading = false;
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Container(
      color: AppTheme.blueColor,
      child: SafeArea(
        child: Scaffold(
          appBar:  AppBar(
            iconTheme: IconThemeData(
              color: Colors.white
            ),
            backgroundColor: AppTheme.blueColor,
            title: Text(
              'Upload Images',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white
              ),
            ),

            centerTitle: true,
          ),
          backgroundColor: Colors.white,
          extendBody: true,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: 25),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 13),
                  child: Text("Partner Name*",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF00407E)
                      )),
                ),
                SizedBox(height: 5),



                Container(
                  margin: EdgeInsets.symmetric(horizontal: 13),
                  height: 36,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [


                          searchPartnerNameList.length != 0 && partnerNameController.text.isNotEmpty?

                          Text(
                              selectedPartnerNameIndex == 9999
                                  ? "Select Partner Name"
                                  : searchPartnerNameList[selectedPartnerNameIndex],
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: selectedPartnerNameIndex == 9999?Colors.grey:Colors.black,
                              )):

                          Text(
                              selectedPartnerNameIndex == 9999
                                  ? "Select Partner Name"
                                  : partnerNemesList[selectedPartnerNameIndex],
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: selectedPartnerNameIndex == 9999?Colors.grey:Colors.black,
                              )),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              selectPartnerNameBottomSheet(context);
                            },
                            child: Text("Select",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF00407E)
                                )),
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 2),
                        child: Divider(
                          color: Color(0xFF8C8C8C),
                        ),
                      ),
                    ],
                  ),
                ),



                SizedBox(height: 17),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 13),
                  child: Text("Branch Name*",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF00407E)
                      )),
                ),
                SizedBox(height: 5),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 13),
                  height: 36,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          searchBranchList.length != 0 && branchController.text.isNotEmpty?

                          Text(
                              selectedBranchNameIndex == 9999
                                  ? "Select Branch Name"
                                  : searchBranchList[selectedBranchNameIndex],
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: selectedBranchNameIndex == 9999?Colors.grey:Colors.black,
                              )):
                          Text(
                              selectedBranchNameIndex == 9999
                                  ? "Select Branch Name"
                                  : branchList[selectedBranchNameIndex],
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: selectedBranchNameIndex == 9999?Colors.grey:Colors.black,
                              )),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              selectScenarioBottomSheet(context);
                            },
                            child: Text("Select",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF00407E)
                                )),
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 2),
                        child: Divider(
                          color: Color(0xFF8C8C8C),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 17),

                TextFieldProfileWidget(
                    'Loan Number*',
                    'Enter Loan Number',
                    loanNumberController,
                    null),

                SizedBox(height: 15),

                Row(
                  children: [

                    SizedBox(width: 15),
                    Text("Upload LUC Images",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF00407E)
                        )),

                    Spacer(),

                    GestureDetector(
                        onTap: () async {
                          _openOtherPicker(context);
                          // final List<XFile> images = await picker.pickMultiImage();
                          // imageList = imageList + images;
                          setState(() {

                          });
                        },

                    child: Icon(Icons.add_circle,color: Colors.blue,size: 30)),

                    SizedBox(width: 15)
                  ],
                ),

                SizedBox(height: 15),

                Container(
                  height: 70,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: ListView.builder(
                      itemCount: imageList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context,
                          int pos) {
                        return Row(
                          children: [

                            Stack(
                              children: [
                                Container(
                                  width: 75,
                                  height: 75,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius
                                          .circular(5),
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: FileImage(
                                              File(imageList[pos]
                                                  .path)
                                          )
                                      )

                                  ),
                                ),

                                Container(
                                  width: 75,
                                  height: 75,
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: GestureDetector(
                                      onTap: () {
                                        imageList.removeAt(pos);
                                        setState(() {

                                        });
                                      },
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                  padding: EdgeInsets.only(
                                      bottom: 10),

                                )

                              ],
                            ),


                            SizedBox(width: 10),

                          ],
                        );
                      }


                  ),
                ),

                SizedBox(height: 20),

                Row(
                  children: [
                    SizedBox(width: 15),
                    Text("Upload Other Images",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF00407E)
                        )),

                    Spacer(),

                    GestureDetector(
                        onTap: () async {
                          _openLucPicker(context);
                          // final List<XFile> images = await picker.pickMultiImage();
                          // lucImageList = lucImageList + images;
                          setState(() {

                          });
                        },

                        child: Icon(Icons.add_circle,color: Colors.blue,size: 30)),

                    SizedBox(width: 15)


                  ],
                ),

                SizedBox(height: 15),

                Container(
                  height: 70,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: ListView.builder(
                      itemCount: lucImageList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context,
                          int pos) {
                        return Row(
                          children: [

                            Stack(
                              children: [
                                Container(
                                  width: 75,
                                  height: 75,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius
                                          .circular(5),
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: FileImage(
                                              File(lucImageList[pos]
                                                  .path)
                                          )
                                      )

                                  ),
                                ),


                                Container(
                                  width: 75,
                                  height: 75,
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: GestureDetector(
                                      onTap: () {
                                        lucImageList.removeAt(pos);
                                        setState(() {

                                        });
                                      },
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                  padding: EdgeInsets.only(
                                      bottom: 10),

                                )

                              ],
                            ),
                            SizedBox(width: 10),

                          ],
                        );
                      }
                  ),
                ),

                SizedBox(height: 32),
                GestureDetector(
                  onTap: () {

                    validateValues();
                  },
                  child: Container(
                      margin:
                      const EdgeInsets.symmetric(horizontal: 16),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppTheme.buttonOrangeColor,
                          borderRadius: BorderRadius.circular(6)),
                      height: 53,
                      child: const Center(
                        child: Text('Upload',
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

  }
  validateValues(){

    if(selectedPartnerNameIndex==9999)
    {
      Toast.show("Please select a valid Partner Name !!",
          duration: Toast.lengthLong,
          gravity: Toast.bottom,
          backgroundColor: Colors.red);
    }
    else if (selectedBranchNameIndex==9999){

      Toast.show("Please select a valid Branch Name !!",
          duration: Toast.lengthLong,
          gravity: Toast.bottom,
          backgroundColor: Colors.red);

    }

    else if (loanNumberController.text == "") {
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
      ScaffoldMessenger.of(context).showSnackBar(
          snackBar);
    } else if (loanNumberController.text.length < 12 ||
        loanNumberController.text.length > 14) {
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
      ScaffoldMessenger.of(context).showSnackBar(
          snackBar);
    }

    else if (imageList.length==0 && lucImageList.length==0){
      Toast.show("Please select a one image LUC or Other !!",
          duration: Toast.lengthLong,
          gravity: Toast.bottom,
          backgroundColor: Colors.red);
    }
    else
      {
        if (imageList.length!=0 && lucImageList.length!=0){
          _uploadOtherImages();

        }else{
          if(imageList.length!=0){
            _uploadLUCImages();
          }else{
            _uploadOtherImages();
          }
        }

      }


  }

  _uploadLUCImages() async {
    FocusScope.of(context).unfocus();
    APIDialog.showAlertDialog(context, 'Uploading Images...');
    // String fileName = xFile.path.split('/').last;
    FormData? formData = FormData.fromMap({
      "Id": loanNumberController.text.toString(),
      "artifactType": "LUC",
    });

    String branchName="";
    String partnerName="";
    if(searchBranchList.length != 0 ||branchController.text.isNotEmpty)
      {
        branchName=searchBranchList[selectedBranchNameIndex].toString();
        partnerName=searchPartnerNameList[selectedPartnerNameIndex].toString();
      }
    else
      {

        branchName=branchList[selectedBranchNameIndex].toString();
        partnerName=partnerNemesList[selectedPartnerNameIndex].toString();
      }



    for (int i = 0; i < imageList.length; i++) {
      String fileName = partnerName + "-" + branchName + "-" +
          loanNumberController.text.toString() + "-" + "LUC" + "-" + i.toString() + "." +
          imageList[i].path
              .split('.')
              .last;
      print("File Name is " + fileName);
      var path = imageList[i].path.toString();
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

      Navigator.pop(context);
    } else {
      Toast.show(response.data['message'].toString(),
          duration: Toast.lengthLong,
          gravity: Toast.bottom,
          backgroundColor: Colors.red);
    }
  }


  _uploadOtherImages() async {
    FocusScope.of(context).unfocus();
    APIDialog.showAlertDialog(context, 'Uploading Images...');
    // String fileName = xFile.path.split('/').last;
    FormData? formData = FormData.fromMap({
      "Id": loanNumberController.text.toString(),
      "artifactType": "Other",
    });


    String branchName="";
    String partnerName="";
    if(searchPartnerNameList.length != 0 ||partnerNameController.text.isNotEmpty)
    {
      branchName=searchBranchList[selectedBranchNameIndex].toString();
      partnerName=searchPartnerNameList[selectedPartnerNameIndex].toString();
    }
    else
    {

      branchName=branchList[selectedBranchNameIndex].toString();
      partnerName=partnerNemesList[selectedPartnerNameIndex].toString();
    }

    for (int i = 0; i < lucImageList.length; i++) {
      String fileName = partnerName + "-" + branchName+ "-" +
          loanNumberController.text.toString() + "-" + "Other" + "-" + i.toString() + "." +
          lucImageList[i].path
              .split('.')
              .last;
      print("File Name is " + fileName);
      var path = lucImageList[i].path.toString();
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

      if (imageList.length !=0 && lucImageList !=0){
        _uploadLUCImages();
      }else{
        Navigator.pop(context);
      }



    } else {
      Toast.show(response.data['message'].toString(),
          duration: Toast.lengthLong,
          gravity: Toast.bottom,
          backgroundColor: Colors.red);
    }
  }



  void _openOtherPicker(BuildContext context) {
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
                    final XFile? pickedFile = await ImagePicker().pickImage(
                        source: ImageSource.camera);
                    if (pickedFile != null) {
                      setState(() {
                        imageList!.add(
                            pickedFile); // Add picked image to the list
                      });
                    }
                    final connectivityResult4 = await (Connectivity()
                        .checkConnectivity());
                    if (connectivityResult4 != ConnectivityResult.none) {
                      //  _uploadFiles1();
                    }


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
                    imageList = imageList + images;
                    setState(() {

                    });
                    final connectivityResult5 = await (Connectivity()
                        .checkConnectivity());
                    if (connectivityResult5 != ConnectivityResult.none) {
                      //  _uploadFiles1();
                    }
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
  void _openLucPicker(BuildContext context) {
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
                    final XFile? pickedFile = await ImagePicker().pickImage(
                        source: ImageSource.camera);
                    if (pickedFile != null) {
                      setState(() {
                        lucImageList!.add(
                            pickedFile); // Add picked image to the list
                      });
                    }
                    final connectivityResult4 = await (Connectivity()
                        .checkConnectivity());
                    if (connectivityResult4 != ConnectivityResult.none) {
                      //  _uploadFiles1();
                    }


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
                    lucImageList = lucImageList + images;
                    setState(() {

                    });
                    final connectivityResult5 = await (Connectivity()
                        .checkConnectivity());
                    if (connectivityResult5 != ConnectivityResult.none) {
                      //  _uploadFiles1();
                    }
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

  void selectScenarioBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, bottomSheetState) {
          branchSheet=bottomSheetState;
          return Container(
            padding: EdgeInsets.all(10),
            // height: 600,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              // Set the corner radius here
              color: Colors.white, // Example color for the container
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5),
                Center(
                  child: Container(
                    height: 6,
                    width: 62,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.10),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(width: 10),
                    Text("Select Branch Name",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        )),
                    Spacer(),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child:

                      Icon(Icons.close_rounded,color: Colors.black,size: 25),

                      /*Image.asset("assets/cross_ic.png",
                            width: 38, height: 38)*/),
                    SizedBox(width: 4),
                  ],
                ),

                Container(
                  margin: EdgeInsets.only(left: 10,right: 10,top: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: branchController,
                    onChanged: (value) {
                      _runFilter(value);
                    },
                    decoration: const InputDecoration(
                      hintText: "Search",

                    ),
                  ),
                ),

                Container(
                  height: 300,
                  child:

                  searchBranchList.length != 0 ||
                      branchController.text.isNotEmpty?

                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: searchBranchList.length,
                      itemBuilder: (BuildContext context, int pos) {
                        return InkWell(
                          onTap: () {
                            bottomSheetState(() {
                              selectedBranchNameIndex = pos;
                            });
                            setState(() {});
                          },
                          child: Container(
                            height: 57,
                            color: selectedBranchNameIndex == pos
                                ? Color(0xFFFF7C00).withOpacity(0.10)
                                : Colors.white,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 24),
                                    child: Text(searchBranchList[pos],
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }):

                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: branchList.length,
                      itemBuilder: (BuildContext context, int pos) {
                        return InkWell(
                          onTap: () {
                            bottomSheetState(() {
                              selectedBranchNameIndex = pos;
                            });
                            setState(() {});
                          },
                          child: Container(
                            height: 57,
                            color: selectedBranchNameIndex == pos
                                ? Color(0xFFFF7C00).withOpacity(0.10)
                                : Colors.white,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 24),
                                    child: Text(branchList[pos],
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(height: 15),
                Card(
                  elevation: 4,
                  shadowColor: Colors.grey,
                  margin: EdgeInsets.symmetric(horizontal: 13),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container(
                    height: 53,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(
                              Colors.white), // background
                          backgroundColor: MaterialStateProperty.all<Color>(
                              AppTheme.buttonOrangeColor), // fore
                          shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              ))),
                      onPressed: () {
                        if (selectedBranchNameIndex != 9999) {
                          Navigator.pop(context);
                          setState(() {});
                        }
                      },
                      child: const Text(
                        'Save',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
              ],
            ),
          );
        });
      },
    );
  }

  void _runFilter(String enteredKeyword) {
    List<String> results = [];
    if (enteredKeyword.isEmpty) {
      results = branchList;
    } else {

      results = branchList
          .where((audit) => audit
          .toLowerCase()
          .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    // Refresh the UI
    setState(() {
      searchBranchList = results;
    });
    branchSheet!(() {
    });
  }


  void _runFilter2(String enteredKeyword) {
    List<String> results = [];
    if (enteredKeyword.isEmpty) {
      results = partnerNemesList;
    } else {

      results = partnerNemesList
          .where((audit) => audit
          .toLowerCase()
          .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    // Refresh the UI
    setState(() {
      searchPartnerNameList = results;
    });


    partnerNameSheet!(() {

    });
  }
  void selectPartnerNameBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, bottomSheetState) {
          partnerNameSheet=bottomSheetState;
          return Container(
            padding: EdgeInsets.all(10),
            // height: 600,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              // Set the corner radius here
              color: Colors.white, // Example color for the container
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5),
                Center(
                  child: Container(
                    height: 6,
                    width: 62,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.10),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(width: 10),
                    Text("Select Partner Name",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        )),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child:

                      Icon(Icons.close_rounded,color: Colors.black,size: 25),

                      /*Image.asset("assets/cross_ic.png",
                            width: 38, height: 38)*/),
                    SizedBox(width: 4),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 10,right: 10,top: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: partnerNameController,
                    onChanged: (value) {
                      _runFilter2(value);
                    },
                    decoration: const InputDecoration(
                      hintText: "Search",

                    ),
                  ),
                ),
                Container(
                  height: 300,
                  child:

                  searchPartnerNameList.length != 0 ||
                      partnerNameController.text.isNotEmpty?
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: searchPartnerNameList.length,
                      itemBuilder: (BuildContext context, int pos) {
                        return InkWell(
                          onTap: () {
                            bottomSheetState(() {
                              selectedPartnerNameIndex = pos;
                            });
                            setState(() {});
                          },
                          child: Container(
                            height: 57,
                            color: selectedPartnerNameIndex == pos
                                ? Color(0xFFFF7C00).withOpacity(0.10)
                                : Colors.white,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 24),
                                    child: Text(searchPartnerNameList[pos],
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }):

                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: partnerNemesList.length,
                      itemBuilder: (BuildContext context, int pos) {
                        return InkWell(
                          onTap: () {
                            bottomSheetState(() {
                              selectedPartnerNameIndex = pos;
                            });
                            setState(() {});
                          },
                          child: Container(
                            height: 57,
                            color: selectedPartnerNameIndex == pos
                                ? Color(0xFFFF7C00).withOpacity(0.10)
                                : Colors.white,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 24),
                                    child: Text(partnerNemesList[pos],
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(height: 15),
                Card(
                  elevation: 4,
                  shadowColor: Colors.grey,
                  margin: EdgeInsets.symmetric(horizontal: 13),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container(
                    height: 53,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(
                              Colors.white), // background
                          backgroundColor: MaterialStateProperty.all<Color>(
                              AppTheme.buttonOrangeColor), // fore
                          shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              ))),
                      onPressed: () {
                        if (selectedPartnerNameIndex != 9999) {
                          Navigator.pop(context);
                          setState(() {});
                        }
                      },
                      child: const Text(
                        'Save',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
              ],
            ),
          );
        });
      },
    );
  }
}