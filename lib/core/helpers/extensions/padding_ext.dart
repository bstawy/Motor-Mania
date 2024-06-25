import 'package:flutter/widgets.dart';

extension PaddingtoWidget on Widget {
  Widget setHorizontalPadding(double value) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: value),
      child: this,
    );
  }

  Widget setVerticalPadding(double value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: value),
      child: this,
    );
  }

  Widget setHorizontalAndVerticalPadding(
      double widthValue, double heightValue) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: widthValue, vertical: heightValue),
      child: this,
    );
  }

  Widget setOnlyPadding(
    double top,
    double down,
    double right,
    double left,
  ) {
    return Padding(
      padding: EdgeInsets.only(
        top: top,
        bottom: down,
        right: right,
        left: left,
      ),
      child: this,
    );
  }
}
