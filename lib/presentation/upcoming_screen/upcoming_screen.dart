import 'package:flutter/material.dart';
import 'package:houssam_s_application4/core/app_export.dart';
import 'package:houssam_s_application4/widgets/app_bar/appbar_leading_image.dart';
import 'package:houssam_s_application4/widgets/app_bar/appbar_title.dart';
import 'package:houssam_s_application4/widgets/app_bar/custom_app_bar.dart';
import 'package:houssam_s_application4/widgets/custom_elevated_button.dart';

class UpcomingScreen extends StatelessWidget {
  const UpcomingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: 322.h,
                margin: EdgeInsets.fromLTRB(26.h, 44.v, 26.h, 5.v),
                decoration: AppDecoration.outlinePrimary1
                    .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  SizedBox(height: 8.v),
                  Padding(
                      padding: EdgeInsets.only(left: 11.h, right: 4.h),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomImageView(
                                imagePath:
                                    ImageConstant.imgImg2021032200083374465x66,
                                height: 46.v,
                                width: 47.h,
                                radius: BorderRadius.circular(16.h),
                                margin:
                                    EdgeInsets.only(top: 3.v, bottom: 29.v)),
                            Padding(
                                padding: EdgeInsets.only(left: 8.h, top: 2.v),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Houssam Haraf",
                                          style: TextStyle(
                                              color: theme
                                                  .colorScheme.primaryContainer,
                                              fontSize: 15.fSize,
                                              fontFamily: 'Nunito',
                                              fontWeight: FontWeight.w700)),
                                      SizedBox(height: 6.v),
                                      Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomImageView(
                                                imagePath:
                                                    ImageConstant.imgSignal,
                                                height: 8.adaptSize,
                                                width: 8.adaptSize,
                                                margin: EdgeInsets.only(
                                                    top: 1.v, bottom: 4.v)),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 2.h),
                                                child: Text("4.7(1)",
                                                    style: TextStyle(
                                                        color: theme.colorScheme
                                                            .primaryContainer,
                                                        fontSize: 10.fSize,
                                                        fontFamily: 'Nunito',
                                                        fontWeight:
                                                            FontWeight.w700)))
                                          ]),
                                      SizedBox(height: 1.v),
                                      SizedBox(
                                          height: 32.v,
                                          width: 56.h,
                                          child: Stack(
                                              alignment: Alignment.bottomLeft,
                                              children: [
                                                CustomImageView(
                                                    imagePath: ImageConstant
                                                        .imgVector63,
                                                    height: 12.v,
                                                    width: 2.h,
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    margin: EdgeInsets.only(
                                                        left: 3.h)),
                                                CustomImageView(
                                                    imagePath: ImageConstant
                                                        .imgMapPinGray400,
                                                    height: 10.adaptSize,
                                                    width: 10.adaptSize,
                                                    alignment:
                                                        Alignment.bottomLeft,
                                                    margin: EdgeInsets.only(
                                                        bottom: 1.v)),
                                                Align(
                                                    alignment:
                                                        Alignment.bottomLeft,
                                                    child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 14.h),
                                                        child: Text("Safi",
                                                            style: TextStyle(
                                                                color: appTheme
                                                                    .gray400,
                                                                fontSize:
                                                                    9.fSize,
                                                                fontFamily:
                                                                    'Nunito',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400)))),
                                                Align(
                                                    alignment:
                                                        Alignment.topCenter,
                                                    child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          CustomImageView(
                                                              imagePath:
                                                                  ImageConstant
                                                                      .imgMapPinGray400,
                                                              height:
                                                                  10.adaptSize,
                                                              width:
                                                                  10.adaptSize,
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          1.v)),
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left:
                                                                          4.h),
                                                              child: Text(
                                                                  "Marrakech",
                                                                  style: TextStyle(
                                                                      color: appTheme
                                                                          .gray400,
                                                                      fontSize: 9
                                                                          .fSize,
                                                                      fontFamily:
                                                                          'Nunito',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400)))
                                                        ]))
                                              ]))
                                    ])),
                            Spacer(),
                            CustomElevatedButton(
                                height: 24.v,
                                width: 100.h,
                                text: "Coming in 5 mins",
                                margin: EdgeInsets.only(bottom: 54.v),
                                buttonStyle:
                                    CustomButtonStyles.fillLightBlueATL13)
                          ])),
                  SizedBox(height: 6.v),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    SizedBox(
                        width: 38.h,
                        child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: "Price\n",
                                  style: theme.textTheme.labelLarge),
                              TextSpan(
                                  text: "200 Dh",
                                  style: theme.textTheme.bodySmall),
                              TextSpan(text: " ")
                            ]),
                            textAlign: TextAlign.center)),
                    Container(
                        width: 82.h,
                        margin: EdgeInsets.only(left: 26.h, top: 1.v),
                        child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: "Vehicle\n",
                                  style: theme.textTheme.labelLarge),
                              TextSpan(
                                  text: "White BMW M4",
                                  style: theme.textTheme.bodySmall)
                            ]),
                            textAlign: TextAlign.center)),
                    Container(
                        width: 39.h,
                        margin: EdgeInsets.only(left: 26.h, top: 1.v),
                        child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: "Time\n",
                                  style: theme.textTheme.labelLarge),
                              TextSpan(
                                  text: "5:20pm",
                                  style: theme.textTheme.bodySmall)
                            ]),
                            textAlign: TextAlign.center))
                  ]),
                  SizedBox(height: 10.v),
                  CustomElevatedButton(
                      height: 31.v,
                      text: "Cancel Request",
                      buttonStyle: CustomButtonStyles.fillRed)
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 45.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 19.h, top: 15.v, bottom: 14.v),
            onTap: () {
              NavigateToHome(context);
            }),
        title: AppbarTitle(text: "Home", margin: EdgeInsets.only(left: 9.h)));
  }

  /// Navigates to the pickupAndDestinationSelectorScreen when the action is triggered.
  NavigateToHome(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.pickupAndDestinationSelectorScreen);
  }
}
