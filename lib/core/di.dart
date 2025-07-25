import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:short_url/core/services/shared_prefs.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // Core
  sl.registerLazySingleton<SharedPrefsService>(
        () => SharedPrefsService(sl()),
  );

  // Register other services or features here...
}