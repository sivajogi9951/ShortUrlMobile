import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:short_url/core/providers/common_providers.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final int? id=ref.read(sharedPrefsProvider).userId;
    return Scaffold(body:Center(
      child: Text(id.toString()),
    ));
  }
}
