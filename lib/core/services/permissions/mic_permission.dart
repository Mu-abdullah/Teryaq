import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> requestMicrophonePermission() async {
  // التحقق من الحالة الحالية للإذن
  PermissionStatus status = await Permission.microphone.status;

  if (status.isDenied) {
    // إذا كان مرفوضاً، نطلب الإذن
    status = await Permission.microphone.request();
  }

  // معالجة النتيجة (اختياري)
  switch (status) {
    case PermissionStatus.granted:
      debugPrint('✅ تم منح إذن الميكروفون');
      break;
    case PermissionStatus.permanentlyDenied:
      debugPrint('❌ إذن الميكروفون مرفوض بشكل دائم');
      // يمكنك فتح إعدادات التطبيق للمستخدم إذا أردت
      // await openAppSettings();
      break;
    case PermissionStatus.denied:
      debugPrint('❌ إذن الميكروفون مرفوض');
      break;
    case PermissionStatus.restricted:
      debugPrint('🔒 إذن الميكروفون مقيد');
      break;
    default:
      debugPrint('ℹ️ حالة غير متوقعة: $status');
  }
}
