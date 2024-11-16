import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:morfeo/di/dependency_injector.dart';
import 'package:morfeo/pages/timer_page.dart';
import 'package:morfeo/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

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
