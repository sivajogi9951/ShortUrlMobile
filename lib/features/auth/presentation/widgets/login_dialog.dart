import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:short_url/core/extensions/async_ui.dart';
import 'package:short_url/core/navigation/route_name.dart';
import 'package:short_url/core/theme/app_colors.dart';
import 'package:short_url/core/widgets/text_fields/app_text_fields.dart';
import 'package:short_url/features/auth/presentation/provider/auth_provider.dart';

class LoginDialog extends ConsumerStatefulWidget {
  const LoginDialog({super.key});

  @override
  ConsumerState<LoginDialog> createState() => _LoginDialogState();
}

class _LoginDialogState extends ConsumerState<LoginDialog> {
  final emailController = TextEditingController();
  final otpController = TextEditingController();
  final GlobalKey<FormState> _loginKey = GlobalKey();
  final GlobalKey<FormState> _otpKey = GlobalKey();
  bool _isListenerAttached = false;

  bool otpSent = false;
  String error = '';

  Future<String> requestOtp() async {
    final result = await ref
        .read(authProvider.notifier)
        .requestOtp(emailController.text);
    String val = result.fold(
      (failure) {
        setState(() => error = failure.message);
        return failure.message;
      },
      (val) {
        setState(() => otpSent = true);
        return val.message;
      },
    );
    return val;
  }

  void verifyOtp() {
    ref
        .read(authProvider.notifier)
        .verifyOtp(emailController.text, otpController.text);
  }

  bool isValidEmail(String email) {
    final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    if (!_isListenerAttached) {
      _isListenerAttached = true;

      ref.listen<AsyncValue<void>>(authProvider, (_, state) {
        state.showAlertDialogOnError(context);
      });
    }

    final state = ref.watch(authProvider);

    return AlertDialog(
      title: const Text("Login"),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          !otpSent
              ? Form(
                  key: _loginKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTextFields(
                        controller: emailController,
                        hintText: "Email",
                        validator: (val) {
                          if (val == null || val.trim().isEmpty) {
                            return 'Enter Email';
                          } else if (isValidEmail(val)) {
                            return null;
                          }
                          return 'Invalid email';
                        },
                      ),
                      TextButton(
                        onPressed: () async {
                          if (_loginKey.currentState!.validate()) {
                            String val = await requestOtp();
                            if (!context.mounted) return;
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: AppColors.primaryColor,
                                content: Text(
                                  val,
                                  style: TextStyle(color: AppColors.whiteColor),
                                ),
                              ),
                            );
                          }
                        },
                        child: const Text("Request OTP"),
                      ),
                    ],
                  ),
                )
              : Form(
                  key: _otpKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppTextFields(
                        controller: otpController,
                        hintText: "OTP",
                        validator: (val) {
                          if (val != null && val.length == 6) {
                            return null;
                          }
                          return "Enter valid OTP";
                        },
                      ),
                      TextButton(
                        onPressed: () async {
                          if (_otpKey.currentState!.validate()) {
                            verifyOtp();
                          }
                        },
                        child: const Text("Verify OTP"),
                      ),
                    ],
                  ),
                ),
          if (error.isNotEmpty)
            Text(error, style: const TextStyle(color: Colors.red)),
          if (state.isLoading)
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    otpController.dispose();
    super.dispose();
  }
}
