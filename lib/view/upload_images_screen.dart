import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:ui';
import 'dart:ui';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
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
  String partnerNameController;
  String branchController;
  String loanNumberController;
  UploadImagesScreen(this.partnerNameController, this.branchController, this.loanNumberController);

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


  String policyUrl = '';
  bool isLoading = false;
  Widget build(BuildContext context) {
    ToastContext().init(context);
    loanNumberController.text = widget.loanNumberController;
    partnerNameController.text = widget.partnerNameController;
    branchController.text = widget.branchController;
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

                TextFieldProfileWidget(
                    'Partner name',
                    'Enter partner name',
                    partnerNameController,
                    null),
                SizedBox(height: 25),
                TextFieldProfileWidget(
                    'Branch Name',
                    'Enter branch name',
                    branchController,
                    null),
                SizedBox(height: 25),
                TextFieldProfileWidget(
                    'Loan Number',
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

    if(partnerNameController.text=="")
    {
      Toast.show("Please select a valid Partner Name !!",
          duration: Toast.lengthLong,
          gravity: Toast.bottom,
          backgroundColor: Colors.red);
    }
    else if (branchController.text==""){

      Toast.show("Please select a valid Branch Name !!",
          duration: Toast.lengthLong,
          gravity: Toast.bottom,
          backgroundColor: Colors.red);

    }
    else if (loanNumberController.text == "") {
      Toast.show("Please select a valid loan number !!",
          duration: Toast.lengthLong,
          gravity: Toast.bottom,
          backgroundColor: Colors.red);
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

    String branchName= branchController.text;
    String partnerName=partnerNameController.text;

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

      Navigator.pop(context,"true");
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

    String branchName=branchController.text;
    String partnerName=partnerNameController.text;


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
        Navigator.pop(context, "true");
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
                        imageQuality: 90,
                        maxWidth: 1280,
                        source: ImageSource.camera);

                    if (pickedFile != null) {
                      setState(() {

                        print(pickedFile.length().toString());
                        print("File length");

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
                    final List<XFile> images = await picker.pickMultiImage(imageQuality: 90,maxWidth: 1280);
                    if (images.isNotEmpty) {
                      imageList = imageList + images;

                      for (XFile image in imageList) {
                        File file = File(image.path);

                        if (await file.exists()) {
                          // Get the file size in bytes and convert to KB
                          int fileSizeInBytes = file.lengthSync();
                          double fileSizeInKB = fileSizeInBytes / 1024;

                          print("File size of ${image.path}: ${fileSizeInKB.toStringAsFixed(2)} KB");
                        } else {
                          print("File does not exist: ${image.path}");
                        }
                      }

                      setState(() {}); // Update the UI if necessary
                    }
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
                      imageQuality: 90,
                        maxWidth: 1280,
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
                    final List<XFile> images = await picker.pickMultiImage(imageQuality: 90,maxWidth: 1280);


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

}