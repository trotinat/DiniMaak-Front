import 'package:flutter/material.dart';
import 'package:houssam_s_application4/core/app_export.dart';
import 'package:houssam_s_application4/widgets/app_bar/appbar_leading_image.dart';
import 'package:houssam_s_application4/widgets/app_bar/appbar_title.dart';
import 'package:houssam_s_application4/widgets/app_bar/custom_app_bar.dart';
import 'package:houssam_s_application4/widgets/custom_elevated_button.dart';
import 'package:houssam_s_application4/widgets/custom_icon_button.dart';

class RiderDetailScreen extends StatelessWidget {
  const RiderDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 12.h),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildRideWillArriveAt520pm(context),
                      SizedBox(height: 73.v),
                      CustomElevatedButton(
                          text: "Book",
                          margin: EdgeInsets.only(left: 9.h, right: 8.h),
                          onPressed: () {
                            navigateToWallet(context);
                          }),
                      SizedBox(height: 5.v)
                    ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 45.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 19.h, top: 16.v, bottom: 13.v),
            onTap: () {
              NavigateToRides(context);
            }),
        title: AppbarTitle(
            text: "Back to rides", margin: EdgeInsets.only(left: 9.h)));
  }

  /// Section Widget
  Widget _buildRideWillArriveAt520pm(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 6.h, vertical: 8.v),
        decoration: AppDecoration.outlinePrimary2
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 83.v,
                  width: 333.h,
                  margin: EdgeInsets.only(left: 6.h),
                  child: Stack(alignment: Alignment.bottomLeft, children: [
                    CustomElevatedButton(
                        height: 26.v,
                        width: 167.h,
                        text: "Ride will arrive at 5:20pm",
                        buttonStyle: CustomButtonStyles.fillLightBlueATL13,
                        alignment: Alignment.topRight),
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Row(children: [
                          CustomImageView(
                              imagePath:
                                  ImageConstant.imgImg2021032200083374465x66,
                              height: 65.v,
                              width: 66.h,
                              radius: BorderRadius.circular(16.h)),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 8.h, top: 16.v, bottom: 7.v),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                        ])
                                  ]))
                        ]))
                  ])),
              SizedBox(height: 13.v),
              Padding(
                  padding: EdgeInsets.only(left: 10.h),
                  child: Row(children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgUberxRemovebgPreview,
                        height: 23.v,
                        width: 41.h),
                    Padding(
                        padding: EdgeInsets.only(left: 1.h, top: 2.v),
                        child: Text("Black BMW M4",
                            style: TextStyle(
                                color: theme.colorScheme.primaryContainer,
                                fontSize: 14.fSize,
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w600)))
                  ])),
              SizedBox(height: 19.v),
              Padding(
                  padding: EdgeInsets.only(left: 10.h),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomIconButton(
                            height: 28.adaptSize,
                            width: 28.adaptSize,
                            padding: EdgeInsets.all(5.h),
                            child: CustomImageView(
                                imagePath: ImageConstant.imgMapPinWhiteA700)),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 8.h, top: 4.v, bottom: 5.v),
                            child: Text("Marrakech",
                                style: TextStyle(
                                    color: theme.colorScheme.primaryContainer,
                                    fontSize: 13.fSize,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w400)))
                      ])),
              Padding(
                  padding: EdgeInsets.only(left: 23.h),
                  child: SizedBox(
                      height: 16.v,
                      child: VerticalDivider(width: 2.h, thickness: 2.v))),
              Padding(
                  padding: EdgeInsets.only(left: 10.h),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomIconButton(
                            height: 28.adaptSize,
                            width: 28.adaptSize,
                            padding: EdgeInsets.all(5.h),
                            child: CustomImageView(
                                imagePath: ImageConstant.imgMapPinWhiteA700)),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 8.h, top: 4.v, bottom: 5.v),
                            child: Text("Safi",
                                style: TextStyle(
                                    color: theme.colorScheme.primaryContainer,
                                    fontSize: 13.fSize,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w400)))
                      ])),
              SizedBox(height: 16.v),
              Align(
                  alignment: Alignment.center,
                  child: Divider(
                      color: appTheme.gray400, indent: 21.h, endIndent: 24.h)),
              SizedBox(height: 14.v),
              Align(
                  alignment: Alignment.center,
                  child: Padding(
                      padding: EdgeInsets.only(left: 19.h, right: 11.h),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgImage11,
                                height: 28.adaptSize,
                                width: 28.adaptSize,
                                margin: EdgeInsets.only(bottom: 5.v)),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 5.h, top: 7.v, bottom: 7.v),
                                child: Text("Select Seats",
                                    style: TextStyle(
                                        color:
                                            theme.colorScheme.primaryContainer,
                                        fontSize: 14.fSize,
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.w600))),
                            Spacer(),
                            Container(
                                width: 154.h,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 3.h, vertical: 2.v),
                                decoration: AppDecoration.fillGray.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder16),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(bottom: 1.v),
                                          child: CustomIconButton(
                                              height: 30.adaptSize,
                                              width: 30.adaptSize,
                                              padding: EdgeInsets.all(8.h),
                                              decoration: IconButtonStyleHelper
                                                  .fillWhiteA,
                                              child: CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgGroup81143))),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 6.v),
                                          child: RichText(
                                              text: TextSpan(children: [
                                                TextSpan(
                                                    text: "1 ",
                                                    style: CustomTextStyles
                                                        .labelLargeSemiBold),
                                                TextSpan(
                                                    text: "seats",
                                                    style: CustomTextStyles
                                                        .labelLargeSemiBold)
                                              ]),
                                              textAlign: TextAlign.left)),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              right: 1.h, bottom: 1.v),
                                          child: CustomIconButton(
                                              height: 30.adaptSize,
                                              width: 30.adaptSize,
                                              child: CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgFloatingIcon)))
                                    ]))
                          ]))),
              SizedBox(height: 19.v),
              Align(
                  alignment: Alignment.center,
                  child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 9.h),
                      padding:
                          EdgeInsets.symmetric(horizontal: 13.h, vertical: 9.v),
                      decoration: AppDecoration.fillBlueA.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(top: 1.v),
                                child: Text("You will Pay",
                                    style: TextStyle(
                                        color: appTheme.whiteA700,
                                        fontSize: 14.fSize,
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.w800))),
                            Padding(
                                padding: EdgeInsets.only(top: 1.v, right: 11.h),
                                child: Text("100 Dh",
                                    style: TextStyle(
                                        color: appTheme.whiteA700,
                                        fontSize: 14.fSize,
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.w800)))
                          ]))),
              SizedBox(height: 6.v)
            ]));
  }

  /// Navigates to the selectRideScreen when the action is triggered.
  NavigateToRides(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.selectRideScreen);
  }

  /// Navigates to the walletScreen when the action is triggered.
  navigateToWallet(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.walletScreen);
  }
}
