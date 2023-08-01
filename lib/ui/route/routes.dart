import 'package:flutter/material.dart';
import 'package:techno_world/ui/route/route_names.dart';

import '../profile/widgets/edit_profile.dart';


class AppRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.editProfile:
        return MaterialPageRoute(builder: (_) => const EditProfile());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));
    }
  }
}