import 'package:flutter/material.dart';

class TermsConditionsPage extends StatelessWidget {
  const TermsConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Terms & Conditions'),
          Text(
            'Please read these terms and conditions carefully before using our service.',
          ),
          Expanded(
            child: Material(
              elevation: 20,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                ),
                child: ListView(
                  children: [
                    _titleDesc(
                      '1. Acceptance of Terms',
                      'By accessing and using ShortLink\'s services, you accept and agree to be bound by the terms and provision of this agreement. If you do not agree to abide by the above, please do not use this service.',
                    ),
                    _titleDesc(
                      '2. Service Description',
                      'ShortLink provides URL shortening services that allow users to create shortened versions of long URLs. Our service is provided "as is" and we reserve the right to modify or discontinue the service at any time without notice.',
                    ),
                    _titleDesc(
                      '2. Service Description',
                      'ShortLink provides URL shortening services that allow users to create shortened versions of long URLs. Our service is provided "as is" and we reserve the right to modify or discontinue the service at any time without notice.',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _titleDesc(String t, String s) {
    return ListTile(title: Text(t), subtitle: Text(s));
  }
}
