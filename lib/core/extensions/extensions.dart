import 'package:flutter/material.dart';

enum FormFactoryType { mobile, tablet, desktop }

extension StyleContext on BuildContext {
  MediaQueryData get mq => MediaQuery.of(this);
  double get width => mq.size.width;
  double get height => mq.size.height;
  TextScaler get textScaler => mq.textScaler;

  double proportionateWidth(inputWidth) => (inputWidth / 1536)*width;
  double proportionateHeight(inputHeight) => (inputHeight / 825)*height;

  setFontSize(val)=>(val * (width / 1536)).clamp(val*0.8,val*1.4);

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
}
