import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:short_url/core/services/connectivity_service.dart';
import 'package:short_url/core/services/dio_service.dart';

final dioProvider = Provider((ref) => DioService().dio);
final connectivityProvider = Provider((ref) => ConnectivityService());