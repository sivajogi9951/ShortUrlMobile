import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:short_url/features/profile/presentation/providers/profile_provider.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDetailsAsync = ref.watch(userDetailsProvider);
    return Scaffold(
      body: userDetailsAsync.when(
        data: (user)=>SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(user.email!),
              Text(user.isVerified.toString()),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(user.currentPlan!.name!),
                  Text(' - Balance: '),
                  Text(user.urlLimit.toString()),
                ],
              )
            ],
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
