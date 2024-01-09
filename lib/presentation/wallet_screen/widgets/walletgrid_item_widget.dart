import 'package:flutter/material.dart';
import 'package:houssam_s_application4/core/app_export.dart';

// ignore: must_be_immutable
class WalletgridItemWidget extends StatelessWidget {
  const WalletgridItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 94.v,
      width: 137.h,
      decoration: BoxDecoration(
        color: const Color.fromARGB(
            255, 174, 208, 236), // Change color or use appTheme.whiteA700
        borderRadius: BorderRadius.circular(
            10.h), // Increase border radius for a rounded card
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Add shadow for depth
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // Offset for shadow
          ),
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.h),
            child: Image.asset(
              'assets/images/Cih-bank.png', // Replace with your image path
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Positioned(
            bottom: 10.0, // Adjust position as needed
            left: 10.0, // Adjust position as needed
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            ),
          ),
          Positioned(
            top: 10.0, // Adjust position as needed
            right: 10.0, // Adjust position as needed
            child: Padding(
              padding: EdgeInsets.all(4.0),
              child: Icon(
                Icons.payment, // Add payment icon or any other icon
                color: Colors.white,
                size: 24.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
