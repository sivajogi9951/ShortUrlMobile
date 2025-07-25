import 'package:flutter/cupertino.dart';
import 'package:short_url/core/navigation/route_name.dart';

class AppMenuList {
  static List<AppMenu> getItems(BuildContext context) {
    return [
      AppMenu(title: 'Pricing', path: '/pricing',routeName: RouteName.pricing),
      AppMenu(title: 'Docs', path: '/docs',routeName: RouteName.docs),
      AppMenu(title: 'About Us', path: '/about_us',routeName: RouteName.aboutUs),
      AppMenu(title: 'Contact Us', path: '/contact_us',routeName: RouteName.contactUs),
      AppMenu(title: 'Terms & Conditions', path: '/terms_conditions',routeName: RouteName.termsConditions),
    ];
  }
}

class AppMenu {
  final String title;
  final String path;
  final String routeName;
  AppMenu({required this.title, required this.path, required this.routeName});
}
