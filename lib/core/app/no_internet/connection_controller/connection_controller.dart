import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectionController {
  ConnectionController._();

  ValueNotifier<bool> isConnected = ValueNotifier(true);

  static final ConnectionController instance = ConnectionController._();

  Future<void> init() async {
    await checkConnection();
    final result = await Connectivity().checkConnectivity();
    isInternetConnected(result);
    Connectivity().onConnectivityChanged.listen(isInternetConnected);
  }

  bool isInternetConnected(List<ConnectivityResult> results) {
    // Check if connected to any network
    final bool hasNetwork = results.any(
      (result) =>
          result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi,
    );

    isConnected.value = hasNetwork;
    return hasNetwork;
  }

  Future<void> checkConnection() async {
    try {
      final connectivityResult = await Connectivity().checkConnectivity();

      // Check if we have mobile or wifi connection
      final bool hasNetwork = connectivityResult.any(
        (result) =>
            result == ConnectivityResult.mobile ||
            result == ConnectivityResult.wifi,
      );

      if (!hasNetwork) {
        isConnected.value = false;
        return;
      }

      // Verify actual internet access with a ping
      final result = await InternetAddress.lookup('google.com').timeout(
        const Duration(seconds: 5),
        onTimeout: () => throw Exception('Timeout'),
      );
      isConnected.value = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (e) {
      isConnected.value = false;
    }
  }
}
