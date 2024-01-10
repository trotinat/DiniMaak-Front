import 'package:flutter/material.dart';
import 'package:houssam_s_application4/core/app_export.dart';
import 'package:houssam_s_application4/widgets/custom_elevated_button.dart';
import 'package:houssam_s_application4/widgets/custom_text_form_field.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore_for_file: must_be_immutable
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isPasswordVisible = false; // Add this line

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Center(
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(horizontal: 27.h),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 3.v),
                                  Text("Login",
                                      style: TextStyle(
                                          color: theme
                                              .colorScheme.primaryContainer,
                                          fontSize: 32.fSize,
                                          fontFamily: 'Nunito',
                                          fontWeight: FontWeight.w700)),
                                  SizedBox(height: 71.v),
                                  CustomTextFormField(
                                      controller: emailController,
                                      hintText: "Email",
                                      textInputType: TextInputType.text,
                                      prefix: Container(
                                          margin: EdgeInsets.fromLTRB(
                                              16.h, 21.v, 13.h, 12.v),
                                          child: CustomImageView(
                                              imagePath: ImageConstant.imgPhone,
                                              height: 22.adaptSize,
                                              width: 22.adaptSize)),
                                      prefixConstraints:
                                          BoxConstraints(maxHeight: 56.v)),
                                  SizedBox(height: 19.v),
                                  CustomTextFormField(
                                      controller: passwordController,
                                      hintText: "Password",
                                      textInputAction: TextInputAction.done,
                                      textInputType:
                                          TextInputType.visiblePassword,
                                      obscureText:
                                          !_isPasswordVisible, // Toggle visibility
                                      prefix: Container(
                                          margin: EdgeInsets.fromLTRB(
                                              15.h, 17.v, 14.h, 17.v),
                                          child: CustomImageView(
                                              imagePath:
                                                  ImageConstant.imgLocation,
                                              height: 22.adaptSize,
                                              width: 22.adaptSize)),
                                      prefixConstraints:
                                          BoxConstraints(maxHeight: 56.v),
                                      suffix: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _isPasswordVisible =
                                                !_isPasswordVisible;
                                          });
                                        },
                                        child: Icon(
                                          _isPasswordVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                        ),
                                      ),
                                      suffixConstraints:
                                          BoxConstraints(maxHeight: 56.v),
                                      //obscureText: true,
                                      contentPadding:
                                          EdgeInsets.symmetric(vertical: 17.v)),
                                  SizedBox(height: 21.v),
                                  Align(
                                      alignment: Alignment.centerRight,
                                      child: Text("Forgot Password?",
                                          style: TextStyle(
                                              color: appTheme.gray600,
                                              fontSize: 15.fSize,
                                              fontFamily: 'Nunito',
                                              fontWeight: FontWeight.w700))),
                                  SizedBox(height: 29.v),
                                  CustomElevatedButton(
                                      text: "Login",
                                      onPressed: () {
                                        login(context);
                                      }),
                                  SizedBox(height: 29.v),
                                  GestureDetector(
                                      onTap: () {
                                        navigateToSignUp(context);
                                      },
                                      child: RichText(
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text:
                                                    "Don’t you have an account?",
                                                style: CustomTextStyles
                                                    .bodyLargeff7c7c7c),
                                            TextSpan(text: " "),
                                            TextSpan(
                                                text: "Sign Up",
                                                style:
                                                    theme.textTheme.bodyLarge)
                                          ]),
                                          textAlign: TextAlign.left))
                                ])))))));
  }

  /// Navigates to the pickupAndDestinationSelectorScreen when the action is triggered.
  navigateToHome(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.pickupAndDestinationSelectorScreen);
  }

  /// Navigates to the signUpScreen when the action is triggered.
  navigateToSignUp(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signUpScreen);
  }

  /// Navigates to the signUpScreen when the action is triggered.
  navigateToLogin(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.loginScreen);
  }

  Future<void> login(BuildContext context) async {
    print(emailController.text + passwordController.text);
    try {
      var url = Uri.parse('https://dinimaak.azurewebsites.net/login');
      var headers = {'Content-Type': 'application/json'};
      var body = jsonEncode({
        'email': emailController.text,
        'password': passwordController.text,
      });

      var response = await http.post(url, headers: headers, body: body);
      print(response.statusCode);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        String accessToken = data['accessToken']; // Extract the access token
        await _saveAccessToken(accessToken); // Save the access token
        navigateToHome(context);
      } else {
        Flushbar(
          message: "Invalid email or password",
          icon: Icon(
            Icons.info_outline,
            size: 28.0,
            color: Colors.white,
          ),
          duration: Duration(seconds: 3),
          leftBarIndicatorColor: Colors.red,
        )..show(context);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Network error: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> _saveAccessToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('accessToken', token);
    print(token); // Save the token
  }
}
