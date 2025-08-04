import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:short_url/core/services/connectivity_service.dart';
import 'package:short_url/core/services/shared_pref_service.dart';

final connectivityProvider = Provider((ref) => ConnectivityService());
final sharedPrefsProvider = Provider<SharedPrefsService>((ref) {
  throw UnimplementedError('Must be overridden in main');
});
