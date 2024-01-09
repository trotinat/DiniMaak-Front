import 'package:flutter/material.dart';
import 'package:houssam_s_application4/core/app_export.dart';
import 'package:houssam_s_application4/widgets/app_bar/appbar_leading_image.dart';
import 'package:houssam_s_application4/widgets/app_bar/appbar_title.dart';
import 'package:houssam_s_application4/widgets/app_bar/custom_app_bar.dart';
import 'package:houssam_s_application4/widgets/custom_elevated_button.dart';
import 'package:houssam_s_application4/widgets/custom_icon_button.dart';

class SelectRideScreen extends StatelessWidget {
  const SelectRideScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 15.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 32.h),
                          child: Row(children: [
                            CustomIconButton(
                                height: 28.adaptSize,
                                width: 28.adaptSize,
                                padding: EdgeInsets.all(5.h),
                                child: CustomImageView(
                                    imagePath:
                                        ImageConstant.imgMapPinWhiteA700)),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 8.h, top: 3.v, bottom: 3.v),
                                child: Text("Marakkech",
                                    style: TextStyle(
                                        color:
                                            theme.colorScheme.primaryContainer,
                                        fontSize: 15.fSize,
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.w400)))
                          ])),
                      Padding(
                          padding: EdgeInsets.only(left: 45.h),
                          child: SizedBox(
                              height: 16.v,
                              child:
                                  VerticalDivider(width: 2.h, thickness: 2.v))),
                      Padding(
                          padding: EdgeInsets.only(left: 32.h),
                          child: Row(children: [
                            CustomIconButton(
                                height: 28.adaptSize,
                                width: 28.adaptSize,
                                padding: EdgeInsets.all(5.h),
                                child: CustomImageView(
                                    imagePath:
                                        ImageConstant.imgMapPinWhiteA700)),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 8.h, top: 3.v, bottom: 3.v),
                                child: Text("Safi",
                                    style: TextStyle(
                                        color:
                                            theme.colorScheme.primaryContainer,
                                        fontSize: 15.fSize,
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.w400)))
                          ])),
                      SizedBox(height: 15.v),
                      Divider(color: appTheme.gray400),
                      SizedBox(height: 14.v),
                      Container(
                          height: 153.adaptSize,
                          width: 153.adaptSize,
                          margin: EdgeInsets.only(left: 28.h),
                          child:
                              Stack(alignment: Alignment.topCenter, children: [
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                    decoration: AppDecoration.outlinePrimary1
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .customBorderBL16),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(height: 22.v),
                                          Text("Houssam",
                                              style: TextStyle(
                                                  color: theme.colorScheme
                                                      .primaryContainer,
                                                  fontSize: 12.fSize,
                                                  fontFamily: 'Nunito',
                                                  fontWeight: FontWeight.w400)),
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                CustomImageView(
                                                    imagePath:
                                                        ImageConstant.imgStar,
                                                    height: 8.adaptSize,
                                                    width: 8.adaptSize,
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            vertical: 2.v)),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 1.h),
                                                    child: Text("4.5 (2)",
                                                        style: TextStyle(
                                                            color: appTheme
                                                                .orange400,
                                                            fontSize: 8.fSize,
                                                            fontFamily:
                                                                'Nunito',
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400))),
                                                CustomImageView(
                                                    imagePath: ImageConstant
                                                        .imgVector64,
                                                    height: 10.v,
                                                    width: 1.h,
                                                    margin: EdgeInsets.only(
                                                        left: 5.h)),
                                                CustomImageView(
                                                    imagePath: ImageConstant
                                                        .imgUberxRemovebgPreview,
                                                    height: 12.v,
                                                    width: 21.h,
                                                    margin: EdgeInsets.only(
                                                        left: 1.h)),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 2.h),
                                                    child: Text("Swift",
                                                        style: TextStyle(
                                                            color: theme
                                                                .colorScheme
                                                                .primaryContainer,
                                                            fontSize: 8.fSize,
                                                            fontFamily:
                                                                'Nunito',
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500)))
                                              ]),
                                          SizedBox(height: 1.v),
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                CustomImageView(
                                                    imagePath:
                                                        ImageConstant.imgClock3,
                                                    height: 10.adaptSize,
                                                    width: 10.adaptSize,
                                                    margin: EdgeInsets.only(
                                                        top: 4.v, bottom: 3.v)),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 2.h,
                                                        top: 4.v,
                                                        bottom: 2.v),
                                                    child: Text("07:30 Pm",
                                                        style: TextStyle(
                                                            color: theme
                                                                .colorScheme
                                                                .primaryContainer,
                                                            fontSize: 8.fSize,
                                                            fontFamily:
                                                                'Nunito',
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500))),
                                                Container(
                                                    height: 18.v,
                                                    width: 66.h,
                                                    margin: EdgeInsets.only(
                                                        left: 28.h),
                                                    child: Align(
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child: Text("100 MAD",
                                                            style: TextStyle(
                                                                color: appTheme
                                                                    .tealA400,
                                                                fontSize:
                                                                    10.fSize,
                                                                fontFamily:
                                                                    'Nunito',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800))))
                                              ]),
                                          SizedBox(height: 1.v),
                                          CustomElevatedButton(
                                              height: 23.v,
                                              width: 153.h,
                                              text: "Book Now",
                                              buttonStyle: CustomButtonStyles
                                                  .outlinePrimaryBL16,
                                              onPressed: () {
                                                navigateToRideDetails(context);
                                              })
                                        ]))),
                            Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                    decoration: AppDecoration.fillLightBlueA
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .customBorderTL16),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 21.v,
                                            width: 76.h,
                                            decoration: BoxDecoration(
                                              color: Colors
                                                  .blue, // Set button background color
                                              borderRadius: BorderRadius.circular(
                                                  8.0), // Set button border radius
                                            ),
                                            child: Material(
                                              color: Colors.transparent,
                                              child: InkWell(
                                                child: Center(
                                                  child: Text(
                                                    "2 Seats Left",
                                                    style: TextStyle(
                                                      color: Colors
                                                          .white, // Set text color to white
                                                      fontSize:
                                                          10.0, // Set text size
                                                      fontWeight: FontWeight
                                                          .bold, // Set text weight
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 34.v),
                                        ]))),
                            CustomImageView(
                                imagePath:
                                    ImageConstant.imgImg20210322000833744,
                                height: 51.v,
                                width: 50.h,
                                radius: BorderRadius.circular(25.h),
                                alignment: Alignment.topCenter,
                                margin: EdgeInsets.only(top: 27.v))
                          ])),
                      SizedBox(height: 5.v)
                    ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 45.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 19.h, top: 13.v, bottom: 16.v),
            onTap: () {
              navigateToHome(context);
            }),
        title: AppbarTitle(
            text: "Select your ride", margin: EdgeInsets.only(left: 9.h)));
  }

  /// Navigates to the pickupAndDestinationSelectorScreen when the action is triggered.
  navigateToHome(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.pickupAndDestinationSelectorScreen);
  }

  /// Navigates to the riderDetailScreen when the action is triggered.
  navigateToRideDetails(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.riderDetailScreen);
  }
}
