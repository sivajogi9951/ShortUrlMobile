import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:short_url/features/auth/presentation/provider/auth_provider.dart';

class LoginDialog extends ConsumerStatefulWidget {
  const LoginDialog({super.key});

  @override
  ConsumerState<LoginDialog> createState() => _LoginDialogState();
}

class _LoginDialogState extends ConsumerState<LoginDialog> {
  final emailController = TextEditingController();
  final otpController = TextEditingController();

  bool otpSent = false;
  String error = '';

  void requestOtp() async {
    final result = await ref.read(authProvider.notifier).requestOtp(emailController.text);
    result.fold(
          (failure) => setState(() => error = failure.message),
          (_) => setState(() => otpSent = true),
    );
  }

  void verifyOtp() {
    ref.read(authProvider.notifier).verifyOtp(emailController.text, otpController.text);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authProvider);

    return AlertDialog(
      title: const Text("Login"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!otpSent)
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
          if (otpSent)
            TextField(
              controller: otpController,
              decoration: const InputDecoration(labelText: "OTP"),
            ),
          if (error.isNotEmpty) Text(error, style: const TextStyle(color: Colors.red)),
          if (state.isLoading) const Padding(padding: EdgeInsets.only(top: 10), child: CircularProgressIndicator()),
        ],
      ),
      actions: [
        if (!otpSent)
          TextButton(
            onPressed: requestOtp,
            child: const Text("Send OTP"),
          ),
        if (otpSent)
          TextButton(
            onPressed: verifyOtp,
            child: const Text("Verify OTP"),
          ),
      ],
    );
  }
}