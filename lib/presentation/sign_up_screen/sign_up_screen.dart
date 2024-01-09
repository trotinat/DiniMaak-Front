import 'package:flutter/material.dart';
import 'package:houssam_s_application4/core/app_export.dart';
import 'package:houssam_s_application4/widgets/custom_elevated_button.dart';
import 'package:houssam_s_application4/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  TextEditingController fullNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

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
                            padding: EdgeInsets.symmetric(horizontal: 29.h),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 43.v),
                                  Text("Create Account",
                                      style: TextStyle(
                                          color: theme
                                              .colorScheme.primaryContainer,
                                          fontSize: 32.fSize,
                                          fontFamily: 'Nunito',
                                          fontWeight: FontWeight.w700)),
                                  SizedBox(height: 74.v),
                                  _buildFullName(context),
                                  SizedBox(height: 23.v),
                                  _buildEmail(context),
                                  SizedBox(height: 23.v),
                                  _buildPhoneNumber(context),
                                  SizedBox(height: 23.v),
                                  _buildPassword(context),
                                  SizedBox(height: 24.v),
                                  Align(
                                      alignment: Alignment.centerRight,
                                      child: Text("Forgot Password?",
                                          style: TextStyle(
                                              color: appTheme.gray600,
                                              fontSize: 15.fSize,
                                              fontFamily: 'Nunito',
                                              fontWeight: FontWeight.w700))),
                                  SizedBox(height: 22.v),
                                  _buildLogin(context),
                                  SizedBox(height: 24.v),
                                  GestureDetector(
                                      onTap: () {
                                        navigateToSignup(context);
                                      },
                                      child: RichText(
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text:
                                                    "Already have an account?",
                                                style: CustomTextStyles
                                                    .bodyLargeff7c7c7c),
                                            TextSpan(text: " "),
                                            TextSpan(
                                                text: "Sign In",
                                                style:
                                                    theme.textTheme.bodyLarge)
                                          ]),
                                          textAlign: TextAlign.left))
                                ])))))));
  }

  /// Section Widget
  Widget _buildFullName(BuildContext context) {
    return CustomTextFormField(
        controller: fullNameController,
        hintText: "Full Name",
        prefix: Container(
            margin: EdgeInsets.fromLTRB(15.h, 16.v, 12.h, 16.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgUser,
                height: 24.adaptSize,
                width: 24.adaptSize)),
        prefixConstraints: BoxConstraints(maxHeight: 56.v));
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return CustomTextFormField(
        controller: emailController,
        hintText: "Email",
        textInputType: TextInputType.emailAddress,
        prefix: Container(
            margin: EdgeInsets.fromLTRB(16.h, 18.v, 11.h, 14.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgLock,
                height: 24.adaptSize,
                width: 24.adaptSize)),
        prefixConstraints: BoxConstraints(maxHeight: 56.v));
  }

  /// Section Widget
  Widget _buildPhoneNumber(BuildContext context) {
    return CustomTextFormField(
        controller: phoneNumberController,
        hintText: "Phone number",
        textInputType: TextInputType.phone,
        prefix: Container(
            margin: EdgeInsets.fromLTRB(16.h, 21.v, 13.h, 12.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgPhone,
                height: 22.adaptSize,
                width: 22.adaptSize)),
        prefixConstraints: BoxConstraints(maxHeight: 56.v));
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return CustomTextFormField(
        controller: passwordController,
        hintText: "Password",
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.visiblePassword,
        prefix: Container(
            margin: EdgeInsets.fromLTRB(15.h, 17.v, 14.h, 17.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgLocation,
                height: 22.adaptSize,
                width: 22.adaptSize)),
        prefixConstraints: BoxConstraints(maxHeight: 56.v),
        suffix: Container(
            margin: EdgeInsets.fromLTRB(30.h, 19.v, 17.h, 12.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgSettings,
                height: 24.adaptSize,
                width: 24.adaptSize)),
        suffixConstraints: BoxConstraints(maxHeight: 56.v),
        obscureText: true,
        contentPadding: EdgeInsets.symmetric(vertical: 17.v));
  }

  /// Section Widget
  Widget _buildLogin(BuildContext context) {
    return CustomElevatedButton(
        text: "Login",
        onPressed: () {
          navigateToLogin(context);
        });
  }

  /// Navigates to the loginScreen when the action is triggered.
  navigateToLogin(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.loginScreen);
  }

  /// Navigates to the loginScreen when the action is triggered.
  navigateToSignup(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.loginScreen);
  }
}
