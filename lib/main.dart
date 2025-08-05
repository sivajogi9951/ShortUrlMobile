import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:short_url/core/services/shared_pref_service.dart';
import 'package:short_url/core/theme/app_theme.dart';
import 'package:short_url/features/device_info/presentation/provider/device_info_providers.dart';
import 'core/navigation/app_router.dart';
import 'core/providers/common_providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  final prefs = await SharedPreferences.getInstance();
  final prefsService = SharedPrefsService(prefs);
  runApp(
    ProviderScope(
      overrides: [sharedPrefsProvider.overrideWithValue(prefsService)],
      child: const MyApp(),
    ),
  );
}
/// hello siva
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int? userId= ref.read(sharedPrefsProvider).userId;
    if(userId == null){
      ref.watch(getDeviceInfoProvider);
    }
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
