import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lanars_test/core/di/dependency_provider.dart';
import 'package:lanars_test/core/navigation/route_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await setupDI();

  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Lanars test',
      initialRoute: loginRoute,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteManager.generateRoute,
    );
  }
}
