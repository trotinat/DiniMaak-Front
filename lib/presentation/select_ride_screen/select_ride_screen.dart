import 'package:flutter/material.dart';
import 'package:houssam_s_application4/core/app_export.dart';
import 'package:houssam_s_application4/widgets/app_bar/appbar_leading_image.dart';
import 'package:houssam_s_application4/widgets/app_bar/appbar_title.dart';
import 'package:houssam_s_application4/widgets/app_bar/custom_app_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../sidebar_drawer/user_drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SelectRideScreen extends StatefulWidget {
  final String fromCity;
  final String toCity;

  const SelectRideScreen({
    Key? key,
    required this.fromCity,
    required this.toCity,
  }) : super(key: key);

  @override
  _SelectRideScreenState createState() => _SelectRideScreenState();
}

class _SelectRideScreenState extends State<SelectRideScreen> {
  Future<List<Trip>>? futureTrips;

  @override
  void initState() {
    super.initState();
    futureTrips = fetchTrips(widget.fromCity, widget.toCity);
  }

  Future<List<Trip>> fetchTrips(String fromCityId, String toCityId) async {
    print(fromCityId + " " + toCityId);
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('accessToken') ?? '';

    final String url =
        'https://dinimaak.azurewebsites.net/api/trip/query?from=$fromCityId&to=$toCityId';
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    print(response.statusCode);
    if (response.statusCode == 200) {
      List<dynamic> tripsJson = json.decode(response.body)['result'];
      List<Trip> trips = tripsJson.map((json) => Trip.fromJson(json)).toList();
      return trips;
    } else {
      throw Exception('Failed to load trips');
    }
  }

  Future<void> joinTrip(String tripId, BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('accessToken') ?? '';
    final String url =
        'https://dinimaak.azurewebsites.net/api/trip/join/$tripId';

    final response = await http.put(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("You've registred in this trip")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Select a Ride"),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              );
            },
          ),
        ),
        drawer: UserDrawer(),
        body: FutureBuilder<List<Trip>>(
          future: futureTrips,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No trips available.'));
            }

            List<Trip> trips = snapshot.data!;
            Trip firstTrip = trips.first;

            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            firstTrip.sourceCityName,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('Departure City'),
                        ],
                      ),
                      Icon(Icons.arrow_forward),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            firstTrip.destinationCityName,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('Destination City'),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: trips.length,
                    itemBuilder: (context, index) {
                      Trip trip = trips[index];
                      return Card(
                        elevation: 6.0,
                        shadowColor: Colors.blueGrey[100],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        margin: EdgeInsets.all(12.0),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${trip.sourceCityName} to ${trip.destinationCityName}',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[800],
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Date: ${trip.tripDate}',
                                    style: TextStyle(fontSize: 14.0),
                                  ),
                                  Text(
                                    '${trip.remainingSeats} seats left',
                                    style: TextStyle(
                                      color: Colors.blue[800],
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                'Driver: ${trip.userName}',
                                style: TextStyle(fontSize: 14.0),
                              ),
                              SizedBox(height: 16.0),
                              Container(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    await joinTrip(trip.id, context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    primary: Colors.blue[800],
                                    padding:
                                        EdgeInsets.symmetric(vertical: 12.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ),
                                  child: Text(
                                    'Book Now',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
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

class Trip {
  final String id;
  final String sourceCityName;
  final String destinationCityName;
  final String tripDate;
  final int seats;
  final int remainingSeats;
  final String userName; // User's username

  Trip({
    required this.id,
    required this.sourceCityName,
    required this.destinationCityName,
    required this.tripDate,
    required this.seats,
    required this.remainingSeats,
    required this.userName,
  });

  factory Trip.fromJson(Map<String, dynamic> json) {
    return Trip(
      id: json['id'],
      sourceCityName: json['source']['cityName'],
      destinationCityName: json['destination']['cityName'],
      tripDate: json['tripDate'],
      seats: json['seats'],
      remainingSeats: json['remainigSeats'],
      userName: json['user']['userName'],
    );
  }
}
