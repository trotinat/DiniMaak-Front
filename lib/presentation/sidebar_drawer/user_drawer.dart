import 'package:flutter/material.dart';
import 'package:houssam_s_application4/core/app_export.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:houssam_s_application4/core/utils/image_constant.dart';

class UserDrawer extends StatefulWidget {
  @override
  _UserDrawerState createState() => _UserDrawerState();
}

class _UserDrawerState extends State<UserDrawer> {
  String userName = '';
  String email = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      var url = Uri.parse('https://dinimaak.azurewebsites.net/api/user');
      String accessToken = await getAccessToken(); // Retrieve the access token
      var headers = {
        'Authorization':
            'Bearer $accessToken', // Include the access token in headers
      };
      var response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        setState(() {
          userName = data['result']['userName'];
          email = data['result']['email'];
          isLoading = false;
        });
      } else {
        // Handle API error
        setState(() {
          userName = 'Error Loading Data';
          email = '';
          isLoading = false;
        });
      }
    } catch (e) {
      // Handle network error
      setState(() {
        userName = 'Network Error';
        email = '';
        isLoading = false;
      });
    }
  }

  Future<String> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('accessToken') ??
        ''; // Return an empty string if token is not found
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .primaryColor, // Customize the background color
                    // Add an image background (optional)
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(ImageConstant.background),
                    ),
                  ),
                  accountName: Text(
                    userName, // Display the username here
                    style: TextStyle(
                      color: Colors.white, // Custom text color
                      fontWeight: FontWeight.bold, // Bold text
                      fontSize: 20.0, // Larger font size
                    ),
                  ),
                  accountEmail: Text(
                    email, // Keep the email here
                    style: TextStyle(
                      color: Colors.white70, // Lighter text color for the email
                      fontSize:
                          16.0, // Slightly smaller font size for the email
                    ),
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Theme.of(context)
                        .colorScheme
                        .onPrimary, // Use a contrasting color for the avatar background
                    child: Padding(
                      padding: EdgeInsets.all(
                          8.0), // Add padding around the text for spacing
                      child: Text(
                        userName.isNotEmpty ? userName[0] : '',
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context)
                              .primaryColor, // Color that contrasts with the background
                        ),
                      ),
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                  onTap: () => Navigator.pushNamed(
                      context, AppRoutes.pickupAndDestinationSelectorScreen),
                ),
                ListTile(
                  leading: Icon(Icons.upcoming),
                  title: Text('Upcoming Trips'),
                  onTap: () => Navigator.pushNamed(context, '/upcoming_screen'),
                ),
                ListTile(
                  leading: Icon(Icons.history),
                  title: Text('Past Trips'),
                  onTap: () =>
                      Navigator.pushNamed(context, '/past_trips_screen'),
                ),
                ListTile(
                  leading: Icon(Icons.add),
                  title: Text('Add a Trip'),
                  onTap: () =>
                      Navigator.pushNamed(context, '/past_trips_screen'),
                ),
                ListTile(
                  leading: Icon(Icons.directions_car), // Icon for 'Add a Car'
                  title: Text('Add a Car'),
                  onTap: () => Navigator.pushNamed(context,
                      '/add_car_screen'), // Adjust the navigation route as needed
                ),
                ListTile(
                  leading: Icon(Icons.list), // Icon for 'Car List'
                  title: Text('Car List'),
                  onTap: () => Navigator.pushNamed(context,
                      '/car_list_screen'), // Adjust the navigation route as needed
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text('Logout'),
                  onTap: () => _logout(context),
                ),
              ],
            ),
    );
  }

  void _logout(BuildContext context) async {
    // Clear user data or reset authentication
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('accessToken');

    // Navigate to the login screen
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/login_screen',
      (route) => false,
    );
  }
}
