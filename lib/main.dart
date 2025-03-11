import 'package:lookme/data/data_provider.dart';
import 'package:lookme/provider/telecaller_provider.dart';
import 'package:lookme/routes/router.dart';
import 'package:lookme/provider/user_provider.dart';
import 'package:lookme/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DataProvider()),
        ChangeNotifierProvider(
            create: (context) => UserProvider(DataProvider())),
        ChangeNotifierProvider(create: (_) => TelecallerProvider()),
      ],
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: IKAppTheme.lightTheme,
      darkTheme: IKAppTheme.darkTheme,
      initialRoute: '/splash',
      routes: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
