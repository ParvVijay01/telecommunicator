import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jctelecaller/data/data_provider.dart';
import 'package:jctelecaller/provider/cart_provider.dart';
import 'package:jctelecaller/provider/user_provider.dart';
import 'package:jctelecaller/routes/router.dart';
import 'package:jctelecaller/utils/theme/theme.dart';
import 'package:provider/provider.dart';

void main() async {
  await GetStorage.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DataProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
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
