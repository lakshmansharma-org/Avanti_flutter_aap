import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qsurvey_flutter/utils/app_theme.dart';
import 'package:qsurvey_flutter/view/dashboard_screen.dart';
import 'package:qsurvey_flutter/widgets.dart';
import 'package:toast/toast.dart';
import '../network/Utils.dart';
import '../network/api_dialog.dart';
import '../network/api_helper.dart';
import '../utils/app_modal.dart';
import '../widgets/textfield_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<LoginScreen> {
  bool isObscure = true;
  bool termsChecked = false;
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  String id = '';
  String empId = '';
  List<dynamic> dataList = [];
  List<dynamic> surveyDataList = [];
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Container(
      color: AppTheme.blueColor,
      child: SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: [
                BackgroundWidget(),
                Form(
                    key: _formKey,
                    child:  Column(
                      children: [
                        const SizedBox(height: 220),
                        const Center(
                          child: Text('Hello',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                                color: AppTheme.blackColor,
                              )),
                        ),
                        const SizedBox(height: 10),
                        const Center(
                          child: Text('Please login to your account',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: AppTheme.grayColor,
                              )),
                        ),
                        const SizedBox(height: 35),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16),
                          child: TextFieldLogin(
                            controller: emailController,
                            validator: emailValidator,
                            labeltext: 'Employee ID',
                            fieldIC: Icon(Icons.person,
                              size: 20,),
                            suffixIc: Icon(
                              Icons.person,
                              size: 20,
                            ),
                          ),

                        ),
                        SizedBox(height: 10.0),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16),
                          child: TextFieldPass(
                            controller: passwordController,
                            validator: checkPasswordValidator,
                            labeltext: 'Password',
                            fieldIC: Icon(Icons.person,
                              size: 20,),
                            suffixIc: Icon(
                              Icons.person,
                              size: 20,
                            ),
                          ),
                        ),

                        SizedBox(height: 40.0),
                        GestureDetector(
                          onTap: () {
                            _submitHandler();
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             DashboardScreen(true)));
                          },
                          child: Container(
                              margin:
                              const EdgeInsets.symmetric(horizontal: 16),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppTheme.buttonOrangeColor,
                                  borderRadius: BorderRadius.circular(15)),
                              height: 50,
                              child: const Center(
                                child: Text('Login',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              )),
                        ),
                        SizedBox(height: 20.0),
                      ],
                    ))
              ],
            ),
          )),
    );
  }
  loginApi() async {
    FocusScope.of(context).unfocus();
    APIDialog.showAlertDialog(context, 'Please wait...');
    var requestModel = {
      "qd_id": emailController.text,
      "password": passwordController.text,
    };

    print(requestModel);

    ApiBaseHelper helper = ApiBaseHelper();
    var response =
    await helper.postAPI('Avanti/SubmitSurvey', requestModel, context);
    isLoading = false;
    var responseJSON = json.decode(response.body);
    //print(responseJSON);

    if (responseJSON['code'] == 200) {
      Toast.show("Logged in Successfully !!",
          duration: Toast.lengthLong,
          gravity: Toast.bottom,
          backgroundColor: Colors.green);
      dataList = responseJSON['data'];
      empId = dataList[0]['qd_id'];
      MyUtils.saveSharedPreferencesBool(
          'loginStatus', true);
      MyUtils.saveSharedPreferences(
         'id',dataList[0]['_id']);
      MyUtils.saveSharedPreferences(
          'empId',dataList[0]['qd_id']);
      AppModel.setLoginStatus(true);
      surveyQuestionApi();

    } else {
      Toast.show(responseJSON['message'],
          duration: Toast.lengthLong,
          gravity: Toast.bottom,
          backgroundColor: Colors.red);
    }
  }
  String? emailValidator(String? value) {
    if (value!.isEmpty) {
      return 'Enter Employee ID';
    }
    return null;
  }
  String? checkPasswordValidator(String? value) {
    if (value!.length < 6) {
      return 'Password is required';
    }
    return null;
  }
  void _submitHandler() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();

    loginApi();

    //
  }
  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  surveyQuestionApi() async {
    FocusScope.of(context).unfocus();
    APIDialog.showAlertDialog(context, 'Please wait...');
    var requestModel = {
      "survey_id": "642a8c6792e2d50b453852fc",
      "email": "",
    };

    print(requestModel);

    ApiBaseHelper helper = ApiBaseHelper();
    var response =
    await helper.postAPI('survey/getDynSurveyAttemp', requestModel, context);
    isLoading = false;
    var responseJSON = json.decode(response.body);
    //print(responseJSON);

    if (responseJSON['code'] == 200) {
      Toast.show("success !!",
          duration: Toast.lengthLong,
          gravity: Toast.bottom,
          backgroundColor: Colors.green);
      surveyDataList = responseJSON['data'];
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => DashboardScreen(true,empId,surveyDataList)),
              (Route<dynamic> route) => false);
    } else {
      Toast.show(responseJSON['message'],
          duration: Toast.lengthLong,
          gravity: Toast.bottom,
          backgroundColor: Colors.red);
    }
  }
}