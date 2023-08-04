import 'package:flutter/material.dart';
import 'package:techno_world/data/models/product/product_model.dart';
import 'package:techno_world/ui/route/route_names.dart';
import 'package:techno_world/ui/tab_admin/products/sub_screens/product_add_screen.dart';
import 'package:techno_world/ui/tab_client/products/widgets/product_detail.dart';

import '../tab_admin/categories/sub_screens/category_add_screen.dart';
import '../tab_admin/profile/widgets/edit_profile.dart';
import '../tab_admin/profile/widgets/show_photo.dart';

class AppRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.editProfile:
        return MaterialPageRoute(builder: (_) => const EditProfile());
      case RouteNames.showPhoto:
        return MaterialPageRoute(builder: (_) => ShowPhoto(image: settings.arguments as String));
      case RouteNames.categoryDetail:
        return MaterialPageRoute(builder: (_) => const CategoryAddScreen());
      case RouteNames.productAdd:
        return MaterialPageRoute(builder: (_) =>  ProductAddScreen(productModel: settings.arguments as ProductModel?));
      case RouteNames.productDetail:
        return MaterialPageRoute(builder: (_) =>  ProductDetailScreen(argumentsList: settings.arguments as List,));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));
    }
  }
}