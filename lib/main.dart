import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/caching/tokens_manager.dart';
import 'core/di/dependency_injection.dart';
import 'motor_mania_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  String token = await TokensManager.getAccessToken() ?? "";
  initGetIt();

  runApp(MotorManiaApp(token: token));
}
