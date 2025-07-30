import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:short_url/core/navigation/route_name.dart';
import 'package:short_url/features/about_us/presentation/pages/about_us_page.dart';
import 'package:short_url/features/contact_us/presentation/pages/contact_us_page.dart';
import 'package:short_url/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:short_url/features/docs/presentation/pages/docs_page.dart';
import 'package:short_url/features/home/presentation/pages/home_page.dart';
import 'package:short_url/features/landing_page/presentation/pages/landing_page.dart';
import 'package:short_url/features/plans/presentation/pages/pricing_page.dart';
import 'package:short_url/features/profile/presentation/pages/profile_screen.dart';
import 'package:short_url/features/terms_conditions/presentation/pages/terms_conditions_page.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        name: RouteName.landing,
        builder: (BuildContext context, GoRouterState state) =>
            const LandingPage(child: HomePage()),
        routes: <RouteBase>[
          ShellRoute(
            builder: (context, state, child) => LandingPage(child: child),
            routes: [
              GoRoute(
                path: '/home',
                name: RouteName.home,
                builder: (BuildContext context, GoRouterState state) {
                  return const HomePage();
                },
              ),
              GoRoute(
                path: '/plans',
                name: RouteName.pricing,
                builder: (BuildContext context, GoRouterState state) {
                  return const PricingPage();
                },
              ),
              GoRoute(
                path: '/docs',
                name: RouteName.docs,
                builder: (BuildContext context, GoRouterState state) {
                  return const DocsPage();
                },
              ),
              GoRoute(
                path: '/about_us',
                name: RouteName.aboutUs,
                builder: (BuildContext context, GoRouterState state) {
                  return const AboutUsPage();
                },
              ),
              GoRoute(
                path: '/contact_us',
                name: RouteName.contactUs,
                builder: (BuildContext context, GoRouterState state) {
                  return const ContactUsPage();
                },
              ),
              GoRoute(
                path: '/terms_conditions',
                name: RouteName.termsConditions,
                builder: (BuildContext context, GoRouterState state) {
                  return const TermsConditionsPage();
                },
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/dashboard',
        name: RouteName.dashboard,
        builder: (BuildContext context, GoRouterState state) =>
            const DashboardPage(),
      ),
      GoRoute(
        path: '/profile',
        name: RouteName.profile,
        builder: (BuildContext context, GoRouterState state) =>
        const ProfilePage(),
      ),
    ],
  );
});

// final GoRouter router = GoRouter(
//   initialLocation: '/',
//   routes: <RouteBase>[
//     GoRoute(
//       path: '/',
//       name: RouteName.landing,
//       builder: (BuildContext context, GoRouterState state) =>
//           // const TestScreen(),
//           const LandingPage(child: HomePage()),
//       routes: <RouteBase>[
//         ShellRoute(
//           builder: (context, state, child) => LandingPage(child: child),
//           routes: [
//             GoRoute(
//               path: '/home',
//               name: RouteName.home,
//               builder: (BuildContext context, GoRouterState state) {
//                 return const HomePage();
//               },
//             ),
//             GoRoute(
//               path: '/plans',
//               name: RouteName.plans,
//               builder: (BuildContext context, GoRouterState state) {
//                 return const PricingPage();
//               },
//             ),
//             GoRoute(
//               path: '/docs',
//               name: RouteName.docs,
//               builder: (BuildContext context, GoRouterState state) {
//                 return const DocsPage();
//               },
//             ),
//             GoRoute(
//               path: '/about_us',
//               name: RouteName.aboutUs,
//               builder: (BuildContext context, GoRouterState state) {
//                 return const AboutUsPage();
//               },
//             ),
//             GoRoute(
//               path: '/contact_us',
//               name: RouteName.contactUs,
//               builder: (BuildContext context, GoRouterState state) {
//                 return const ContactUsPage();
//               },
//             ),
//             GoRoute(
//               path: '/terms_conditions',
//               name: RouteName.termsConditions,
//               builder: (BuildContext context, GoRouterState state) {
//                 return const TermsConditionsPage();
//               },
//             ),
//           ],
//         ),
//       ],
//     ),
//     GoRoute(
//       path: '/dashboard',
//       name: RouteName.dashboard,
//       builder: (BuildContext context, GoRouterState state) =>
//           const DashboardPage(),
//     ),
//   ],
// );
