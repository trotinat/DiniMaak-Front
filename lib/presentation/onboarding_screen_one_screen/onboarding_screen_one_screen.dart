import 'package:flutter/material.dart';
import 'package:houssam_s_application4/core/app_export.dart';
import 'package:houssam_s_application4/widgets/custom_elevated_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class OnboardingScreenOneScreen extends StatelessWidget {
  const OnboardingScreenOneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  SizedBox(height: 44.v),
                  Text("Dini Maak",
                      style: TextStyle(
                          color: appTheme.lightBlueA700,
                          fontSize: 48.fSize,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w800)),
                  SizedBox(height: 29.v),
                  CustomImageView(
                      imagePath: ImageConstant.imgGroup,
                      height: 256.v,
                      width: 278.h),
                  SizedBox(height: 33.v),
                  Text("Reduce Cost",
                      style: TextStyle(
                          color: appTheme.lightBlueA700,
                          fontSize: 25.fSize,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w600)),
                  SizedBox(height: 5.v),
                  Container(
                      width: 286.h,
                      margin: EdgeInsets.only(left: 43.h, right: 44.h),
                      child: Text(
                          "Join the carpooling community and save time and money on your daily commute",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: appTheme.gray600,
                              fontSize: 16.fSize,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w400))),
                  SizedBox(height: 5.v),
                  SizedBox(height: 10.v),
                  _buildLoginSection(context)
                ]))));
  }

  /// Section Widget
  Widget _buildLoginSection(BuildContext context) {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 26.h, vertical: 43.v),
        decoration: AppDecoration.outlinePrimary
            .copyWith(borderRadius: BorderRadiusStyle.customBorderTL38),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          CustomElevatedButton(
              text: "Login",
              margin: EdgeInsets.only(right: 6.h),
              onPressed: () {
                navigateToLogin(context);
              }),
          SizedBox(height: 10.v),
          CustomElevatedButton(
              text: "Sign up",
              margin: EdgeInsets.only(right: 6.h),
              buttonStyle: CustomButtonStyles.outlinePrimaryTL15,
              onPressed: () {
                navigateToSignup(context);
              })
        ]));
  }

  /// Navigates to the loginScreen when the action is triggered.
  navigateToLogin(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.loginScreen);
  }

  /// Navigates to the signUpScreen when the action is triggered.
  navigateToSignup(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signUpScreen);
  }
}
