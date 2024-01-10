import 'package:flutter/material.dart';
import 'package:houssam_s_application4/presentation/onboarding_screen_one_screen/onboarding_screen_one_screen.dart';
import 'package:houssam_s_application4/presentation/login_screen/login_screen.dart';
import 'package:houssam_s_application4/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:houssam_s_application4/presentation/pickup_and_destination_selector_screen/pickup_and_destination_selector_screen.dart';
import 'package:houssam_s_application4/presentation/select_ride_screen/select_ride_screen.dart';
import 'package:houssam_s_application4/presentation/rider_detail_screen/rider_detail_screen.dart';
import 'package:houssam_s_application4/presentation/wallet_screen/wallet_screen.dart';
import 'package:houssam_s_application4/presentation/upcoming_screen/upcoming_screen.dart';
import 'package:houssam_s_application4/presentation/past_trips_screen/past_trips_screen.dart';
import 'package:houssam_s_application4/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String onboardingScreenOneScreen =
      '/onboarding_screen_one_screen';

  static const String loginScreen = '/login_screen';

  static const String signUpScreen = '/sign_up_screen';

  static const String pickupAndDestinationSelectorScreen =
      '/pickup_and_destination_selector_screen';

  static const String selectRideScreen = '/select_ride_screen';

  static const String riderDetailScreen = '/rider_detail_screen';

  static const String walletScreen = '/wallet_screen';

  static const String upcomingScreen = '/upcoming_screen';

  static const String pastTripsScreen = '/past_trips_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    onboardingScreenOneScreen: (context) => OnboardingScreenOneScreen(),
    loginScreen: (context) => LoginScreen(),
    signUpScreen: (context) => SignUpScreen(),
    pickupAndDestinationSelectorScreen: (context) =>
        PickupAndDestinationSelectorScreen(),
    selectRideScreen: (context) => SelectRideScreen(
        fromCity: 'defaultFromCityValue',
        toCity: 'defaultToCityValue',
      ),
    riderDetailScreen: (context) => RiderDetailScreen(),
    walletScreen: (context) => WalletScreen(),
    upcomingScreen: (context) => UpcomingScreen(),
    pastTripsScreen: (context) => PastTripsScreen(),
    appNavigationScreen: (context) => AppNavigationScreen()
  };
}
