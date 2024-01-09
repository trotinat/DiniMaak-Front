import '../wallet_screen/widgets/walletgrid_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:houssam_s_application4/core/app_export.dart';
import 'package:houssam_s_application4/widgets/app_bar/appbar_leading_image.dart';
import 'package:houssam_s_application4/widgets/app_bar/appbar_title.dart';
import 'package:houssam_s_application4/widgets/app_bar/custom_app_bar.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Padding(
                padding: EdgeInsets.only(left: 39.h, top: 35.v, right: 32.h),
                child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 95.v,
                        crossAxisCount: 2,
                        mainAxisSpacing: 29.h,
                        crossAxisSpacing: 29.h),
                    physics: BouncingScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return WalletgridItemWidget();
                    }))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 43.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 17.h, top: 13.v, bottom: 16.v),
            onTap: () {
              navigateTorider(context);
            }),
        centerTitle: true,
        title: AppbarTitle(text: "Choose Payment Method"));
  }

  /// Navigates to the riderDetailScreen when the action is triggered.
  navigateTorider(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.riderDetailScreen);
  }
}
