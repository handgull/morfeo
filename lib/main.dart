import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health/health.dart';
import 'package:morfeo/di/dependency_injector.dart';
import 'package:morfeo/misc/constants.dart';
import 'package:morfeo/pages/timer_page.dart';
import 'package:morfeo/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  await Alarm.init();

  await Health().configure();
  await Health().requestAuthorization(K.healthTypes);

  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) => DependencyInjector(
        child: MaterialApp(
          onGenerateTitle: (context) => 'Morfeo',
          debugShowCheckedModeBanner: false,
          theme: LightTheme.make,
          home: const TimerPage(),
        ),
      );
}
