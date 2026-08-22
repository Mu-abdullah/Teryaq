import 'package:flutter/material.dart';

enum DeviceType { mobile, tablet, web, desktop }

extension DeviceTypeExtension on BuildContext {
  DeviceType get deviceType {
    final width = MediaQuery.of(this).size.width;
    if (width < 600) return DeviceType.mobile;
    if (width < 900) return DeviceType.tablet;
    if (width < 1200) return DeviceType.web;
    return DeviceType.desktop;
  }

  bool get isMobile => deviceType == DeviceType.mobile;
  bool get isTablet => deviceType == DeviceType.tablet;
  bool get isWeb => deviceType == DeviceType.web;
  bool get isDesktop => deviceType == DeviceType.desktop;
  bool get isSmallScreen => isMobile || isTablet;
  bool get isLargeScreen => isWeb || isDesktop;
}

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? web;
  final Widget? desktop;

  const ResponsiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    this.web,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    switch (context.deviceType) {
      case DeviceType.mobile:
        return mobile;
      case DeviceType.tablet:
        return tablet ?? mobile;
      case DeviceType.web:
        return web ?? tablet ?? mobile;
      case DeviceType.desktop:
        return desktop ?? web ?? tablet ?? mobile;
    }
  }
}