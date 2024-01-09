import 'package:flutter/material.dart';
import 'package:houssam_s_application4/core/app_export.dart';
import 'package:houssam_s_application4/widgets/custom_elevated_button.dart';
import 'package:houssam_s_application4/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class PickupAndDestinationSelectorScreen extends StatelessWidget {
  PickupAndDestinationSelectorScreen({Key? key}) : super(key: key);

  TextEditingController marrakechLocationController = TextEditingController();

  TextEditingController safiLocationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 46.v),
                child: Column(children: [
                  Text("My Trips",
                      style: TextStyle(
                          color: theme.colorScheme.primaryContainer,
                          fontSize: 24.fSize,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w700)),
                  SizedBox(height: 14.v),
                  _buildFiveRow(context),
                  Spacer(flex: 39),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 71.h),
                          child: Text("Select your ride",
                              style: TextStyle(
                                  color: theme.colorScheme.primaryContainer,
                                  fontSize: 24.fSize,
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.w700)))),
                  SizedBox(height: 47.v),
                  _buildMarrakechLocation(context),
                  SizedBox(height: 13.v),
                  _buildSafiLocation(context),
                  SizedBox(height: 49.v),
                  _buildContinueButton(context),
                  Spacer(flex: 60),
                  _buildLogoutButton(context)
                ]))));
  }

  /// Section Widget
  Widget _buildUpcomingButton(BuildContext context) {
    return Expanded(
        child: CustomElevatedButton(
            height: 46.v,
            text: "Upcoming",
            margin: EdgeInsets.only(right: 10.h),
            buttonStyle: CustomButtonStyles.fillLightBlueA,
            onPressed: () {
              navigateToUpcoming(context);
            }));
  }

  /// Section Widget
  Widget _buildPastTripsButton(BuildContext context) {
    return Expanded(
        child: CustomElevatedButton(
            height: 46.v,
            text: "Past trips",
            margin: EdgeInsets.only(left: 10.h),
            buttonStyle: CustomButtonStyles.fillLightBlueA,
            onPressed: () {
              navigateToCompleted(context);
            }));
  }

  /// Section Widget
  Widget _buildFiveRow(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 3.h, right: 12.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          _buildUpcomingButton(context),
          _buildPastTripsButton(context)
        ]));
  }

  /// Section Widget
  Widget _buildMarrakechLocation(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 6.h, right: 5.h),
        child: CustomTextFormField(
            controller: marrakechLocationController,
            hintText: "Marrakech",
            prefix: Container(
                margin: EdgeInsets.fromLTRB(9.h, 13.v, 6.h, 9.v),
                child: CustomImageView(
                    imagePath: ImageConstant.imgMappin,
                    height: 24.adaptSize,
                    width: 24.adaptSize)),
            prefixConstraints: BoxConstraints(maxHeight: 46.v),
            contentPadding:
                EdgeInsets.only(top: 12.v, right: 30.h, bottom: 12.v),
            borderDecoration: TextFormFieldStyleHelper.fillWhiteA));
  }

  /// Section Widget
  Widget _buildSafiLocation(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 6.h, right: 5.h),
        child: CustomTextFormField(
            controller: safiLocationController,
            hintText: "Safi",
            textInputAction: TextInputAction.done,
            prefix: Container(
                margin: EdgeInsets.fromLTRB(9.h, 13.v, 6.h, 9.v),
                child: CustomImageView(
                    imagePath: ImageConstant.imgLocate,
                    height: 24.adaptSize,
                    width: 24.adaptSize)),
            prefixConstraints: BoxConstraints(maxHeight: 46.v),
            suffix: Container(
                margin: EdgeInsets.fromLTRB(30.h, 16.v, 12.h, 15.v),
                child: CustomImageView(
                    imagePath: ImageConstant.imgGgmenuleft,
                    height: 15.adaptSize,
                    width: 15.adaptSize)),
            suffixConstraints: BoxConstraints(maxHeight: 46.v),
            contentPadding: EdgeInsets.symmetric(vertical: 12.v),
            borderDecoration: TextFormFieldStyleHelper.fillWhiteA));
  }

  /// Section Widget
  Widget _buildContinueButton(BuildContext context) {
    return CustomElevatedButton(
        text: "Continue",
        onPressed: () {
          navigateToRides(context);
        });
  }

  Widget _buildLogoutButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          primary: Colors.red, // Change the button background color
          onPrimary: Colors.white, // Change the text color
          padding:
              EdgeInsets.symmetric(vertical: 16.0), // Adjust the button padding
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(8.0), // Adjust the button border radius
          ),
        ),
        onPressed: () {
          logout(context);
        },
        icon: Icon(
          Icons.exit_to_app, // Choose an icon (here, exit_to_app icon)
          size: 24.0, // Adjust the icon size
        ),
        label: Text(
          'Logout',
          style: TextStyle(fontSize: 16.0), // Adjust the text size
        ),
      ),
    );
  }

  void logout(BuildContext context) {
    // Perform logout actions here, such as clearing user data, resetting authentication, etc.

    // Navigate to the login screen after logout
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.loginScreen,
      (route) =>
          false, // This line removes all existing routes and only keeps the login screen
    );
  }

  /// Navigates to the upcomingScreen when the action is triggered.
  navigateToUpcoming(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.upcomingScreen);
  }

  /// Navigates to the pastTripsScreen when the action is triggered.
  navigateToCompleted(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.pastTripsScreen);
  }

  /// Navigates to the selectRideScreen when the action is triggered.
  navigateToRides(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.selectRideScreen);
  }
}
