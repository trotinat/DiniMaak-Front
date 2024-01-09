import 'package:flutter/material.dart';
import 'package:houssam_s_application4/core/app_export.dart';
import 'package:houssam_s_application4/widgets/custom_elevated_button.dart';
import 'package:houssam_s_application4/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                                      controller: phoneNumberController,
                                      hintText: "Phone number",
                                      textInputType: TextInputType.phone,
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
                                      suffix: Container(
                                          margin: EdgeInsets.fromLTRB(
                                              30.h, 19.v, 17.h, 12.v),
                                          child: CustomImageView(
                                              imagePath:
                                                  ImageConstant.imgSettings,
                                              height: 24.adaptSize,
                                              width: 24.adaptSize)),
                                      suffixConstraints:
                                          BoxConstraints(maxHeight: 56.v),
                                      obscureText: true,
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
                                        navigateToHome(context);
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
}
