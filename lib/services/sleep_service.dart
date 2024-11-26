import 'dart:io';

import 'package:flutter/material.dart';
import 'package:health/health.dart';
import 'package:morfeo/misc/constants.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

// ignore: one_member_abstracts
abstract class SleepService {
  void init();
  void read();
}

class SleepServiceImpl implements SleepService {
  SleepServiceImpl();

  PermissionStatus? activityPermissionStatus;

  @override
  Future<void> init() async {
    activityPermissionStatus ??= await Permission.activityRecognition.request();
  }

  @override
  Future<void> read() async {
    await init();
    if (Platform.isIOS ||
        activityPermissionStatus == PermissionStatus.granted) {
      final now = DateTime.now();
      final from = now.add(const Duration(days: -1));
      final healthData = await Health().getHealthDataFromTypes(
        startTime: from,
        endTime: now,
        types: K.healthTypes,
      );

      debugPrint(healthData.toString());
    }
  }
}

extension SleepServiceExtension on BuildContext {
  SleepService get sleepService => read<SleepService>();
}
