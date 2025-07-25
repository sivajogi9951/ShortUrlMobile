import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnalyticsModel {
  final IconData icon;
  final String title;
  final String subTitle;

  AnalyticsModel({
    required this.icon,
    required this.title,
    required this.subTitle,
  });
}


List<AnalyticsModel> analyticsDummyData=[
  AnalyticsModel(icon: Icons.group_add_outlined, title: '10,000+', subTitle: 'Active Users'),
  AnalyticsModel(icon: Icons.ac_unit_outlined, title: '2M+', subTitle: 'Links Shortened'),
  AnalyticsModel(icon: Icons.monitor_heart_outlined, title: '99.99%', subTitle: 'Uptime'),
  AnalyticsModel(icon: Icons.add_chart_outlined, title: '99.99%', subTitle: 'Uptime'),
];