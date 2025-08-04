import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:short_url/core/constants/app_sizes.dart';
import 'package:short_url/core/extensions/extensions.dart';
import 'package:short_url/core/providers/common_providers.dart';
import 'package:short_url/core/theme/app_colors.dart';
import 'package:short_url/core/widgets/buttons/app_button.dart';
import 'package:short_url/core/widgets/text_fields/app_text_fields.dart';
import 'package:short_url/features/shorten_url/domain/entity/short_url.dart';
import 'package:short_url/features/shorten_url/presentation/provider/short_url_provider.dart';

class ShortUrlTab extends ConsumerStatefulWidget {
  const ShortUrlTab({super.key});

  @override
  ConsumerState<ShortUrlTab> createState() => _ShortUrlTabState();
}

class _ShortUrlTabState extends ConsumerState<ShortUrlTab> {
  ShortUrl? output;
  final mainUrlController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final String? deviceId = ref.read(sharedPrefsProvider).deviceId;

    void requestShortUrl() async {
      final result = await ref
          .read(shortUrlProvider.notifier)
          .requestShortUrl(
            mainURL: mainUrlController.text.trim(),
            deviceId: deviceId??'',
          );

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
        (shortURL) => setState(() {
          output = shortURL;
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
            'Shorten URL',
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
            controller: mainUrlController,
            hintText: 'Enter URL',
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
              ? Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(child: SelectableText(output!.shortUrl)),
                  IconButton(
                    onPressed: () async {
                      await Clipboard.setData(
                        ClipboardData(text: output!.shortUrl),
                      );
                    },
                    icon: Icon(Icons.copy),
                  ),
                ],
              ),

            ],
          )
              : SizedBox.shrink(),
          AppSizes.gap(
            h: context.isMobile ? context.width * 0.03 : context.width * 0.005,
          ),
          AppButton(
            label: output != null ? '' : 'Generate Shorten URL',
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                if (output != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: Text('Un implemented'),
                    ),
                  );
                } else {
                  requestShortUrl();
                }
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    mainUrlController.dispose();
    super.dispose();
  }
}
