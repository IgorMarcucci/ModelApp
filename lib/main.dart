import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:model_app/app/keys/keys.dart';
import 'package:model_app/app/providers/user.provider.dart';
import 'package:model_app/app/routes/route.dart';
import 'package:model_app/app/theme/theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MultiProvider(
    providers: [userProvider],
    child: const MainApp(),
  ));
}

Keys keys = Keys();

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'modelApp',
      theme: themeData(),
      routerDelegate: routes.routerDelegate,
      routeInformationParser: routes.routeInformationParser,
      routeInformationProvider: routes.routeInformationProvider,
    );
  }
}
