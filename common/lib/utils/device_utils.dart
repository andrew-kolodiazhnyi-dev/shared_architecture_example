import 'package:flutter/material.dart';

enum DeviceType {
  phone,
  tablet,
}

class DeviceUtils {
  static DeviceType get deviceType {
    final data = MediaQueryData.fromView(
      WidgetsBinding.instance.platformDispatcher.views.first,
    );
    return data.size.shortestSide < 600 ? DeviceType.phone : DeviceType.tablet;
  }
}
