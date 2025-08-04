import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:short_url/core/constants/app_sizes.dart';
import 'package:short_url/core/extensions/extensions.dart';
import 'package:short_url/core/theme/app_colors.dart';
import 'package:short_url/core/widgets/buttons/app_button.dart';
import 'package:short_url/core/widgets/text_fields/app_text_fields.dart';
import 'package:short_url/features/qr_code/domain/entity/qr_code.dart';
import 'package:short_url/features/qr_code/presentation/provider/qr_url_provider.dart';
import 'package:short_url/features/qr_code/presentation/widgets/image_render_widget.dart';

class QrCodeTab extends ConsumerStatefulWidget {
  const QrCodeTab({super.key});

  @override
  ConsumerState<QrCodeTab> createState() => _QrCodeTabState();
}

class _QrCodeTabState extends ConsumerState<QrCodeTab> {
  QrCodeEntity? output;
  final urlController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    void generateQrCode() async {
      final result = await ref
          .read(qrCodeProvider.notifier)
          .generateQrCode(url: urlController.text.trim());

      result.fold(
        (failure) => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(failure.message),
            backgroundColor: Colors.red,
            showCloseIcon: true,
            closeIconColor: Colors.white,
            behavior: SnackBarBehavior.floating,
          ),
        ),
        (qrCode) => setState(() {
          output = qrCode;
        }),
      );
    }

    return Form(
      key: _formKey,
      child: ListView(
        padding: context.isMobile
            ? AppSizes.edgeAll(context.width * 0.03)
            : AppSizes.edgeAll(context.width * 0.005),
        children: [
          Text(
            'QR Code Metadata',
            style: context.theme.textTheme.headlineSmall!.copyWith(
              fontSize: context.setFontSize(18),
              fontWeight: FontWeight.w600,
              color: AppColors.primaryColor,
            ),
          ),
          AppSizes.gap(
            h: context.isMobile ? context.width * 0.03 : context.width * 0.005,
          ),
          AppTextFields(
            controller: urlController,
            hintText: 'Enter Link',
            validator: (val) {
              if (val == null || val.isEmpty) {
                return 'Enter URL';
              }
              return null;
            },
          ),
          AppSizes.gap(
            h: context.isMobile ? context.width * 0.03 : context.width * 0.005,
          ),
          output != null
              ? ImageRenderWidget(output!.link)
              : AppButton(
                  label: 'Generate QR Code',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      generateQrCode();
                    }
                  },
                ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    urlController.dispose();
    super.dispose();
  }
}
