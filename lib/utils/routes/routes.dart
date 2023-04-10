
import 'package:flutter/material.dart';
import 'package:getting_api/screen/homeScreen.dart';
import 'package:getting_api/utils/routes/routes_name.dart';


class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen());

      default:
        return MaterialPageRoute(builder: (BuildContext context) {
          return Scaffold(
            body: Center(
              child: Text("No Route Defined for ${settings.name}"),
            ),
          );
        });
    }
  }
}