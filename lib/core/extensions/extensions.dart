import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum FormFactoryType { mobile, tablet, desktop }

extension StyleContext on BuildContext {
  MediaQueryData get mq => MediaQuery.of(this);
  double get width => mq.size.width;
  double get height => mq.size.height;
  TextScaler get textScaler => mq.textScaler;
  setFontSize(val)=>val * (width / 1536);

  FormFactoryType get formFactor {
    if (width < 600) {
      return FormFactoryType.mobile;
    } else if (width < 900) {
      return FormFactoryType.mobile;
    } else {
      return FormFactoryType.desktop;
    }
  }

  bool get isMobile => formFactor == FormFactoryType.mobile;
  bool get isTablet => formFactor == FormFactoryType.tablet;
  bool get isDesktop => formFactor == FormFactoryType.desktop;

  ThemeData get theme => Theme.of(this);
  double dynamicFont(double percent) => width * percent;

}
