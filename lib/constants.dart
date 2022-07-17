import 'package:flutter/material.dart';
import 'core/router/router.dart';

void closeKeyboard() => FocusManager.instance.primaryFocus?.unfocus();

double sizeFromHeight(double fraction,
    {bool removeAppBarSize = true}) {
  MediaQueryData mediaQuery = MediaQuery.of(RouteManager.currentContext);
  fraction = (removeAppBarSize
          ? (mediaQuery.size.height -
              AppBar().preferredSize.height -
              mediaQuery.padding.top)
          : (mediaQuery.size.height - mediaQuery.viewPadding.top)) /
      (fraction == 0 ? 1 : fraction);
  return fraction;
}

double sizeFromWidth(double fraction) {
  fraction = MediaQuery.of(RouteManager.currentContext).size.width / (fraction == 0 ? 1 : fraction);
  return fraction;
}
