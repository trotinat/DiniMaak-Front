import 'package:flutter/material.dart';
import 'package:houssam_s_application4/core/app_export.dart';
import 'package:houssam_s_application4/widgets/custom_elevated_button.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:houssam_s_application4/presentation/select_ride_screen/select_ride_screen.dart';
import '../sidebar_drawer/user_drawer.dart';

class PickupAndDestinationSelectorScreen extends StatefulWidget {
  @override
  _PickupAndDestinationSelectorScreenState createState() =>
      _PickupAndDestinationSelectorScreenState();
}

class _PickupAndDestinationSelectorScreenState
    extends State<PickupAndDestinationSelectorScreen> {
  String? selectedDepartureCityId;
  String? selectedDestinationCityId;
  List<City> cities = [];

  @override
  void initState() {
    super.initState();
    fetchCities();
  }

  Future<void> fetchCities() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('accessToken') ?? '';

    final response = await http.get(
      Uri.parse('https://dinimaak.azurewebsites.net/api/city'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> cityJson = json.decode(response.body)['result'];
      setState(() {
        cities = cityJson.map((json) => City.fromJson(json)).toList();
      });
      print('Cities loaded: ${cities.length}');
    } else {
      print('Failed to load cities');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("My Trips"),
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
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 46.v),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Select your ride",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: theme.colorScheme.primaryContainer,
                  fontSize: 24.fSize,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 30.v),
              _buildCityDropdown('Departure City', (cityId) {
                selectedDepartureCityId = cityId;
              }),
              SizedBox(height: 20.v),
              _buildCityDropdown('Destination City', (cityId) {
                selectedDestinationCityId = cityId;
              }),
              SizedBox(height: 30.v),
              _buildContinueButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCityDropdown(String hintText, Function(String?) onChanged) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        hintText: hintText,
      ),
      value: null,
      items: cities.map<DropdownMenuItem<String>>((City city) {
        return DropdownMenuItem<String>(
          value: city.id,
          child: Text(
            city.cityName,
            style: TextStyle(color: Colors.black),
          ),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }

  Widget _buildContinueButton(BuildContext context) {
    return CustomElevatedButton(
      text: "Continue",
      onPressed: () {
        if (selectedDepartureCityId != null &&
            selectedDestinationCityId != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SelectRideScreen(
                fromCity: selectedDepartureCityId!,
                toCity: selectedDestinationCityId!,
              ),
            ),
          );
        } else {
          // Handle null selection
        }
      },
    );
  }
}

class City {
  final String id;
  final String cityName;

  City({required this.id, required this.cityName});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'],
      cityName: json['cityName'],
    );
  }
}
