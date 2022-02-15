import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:woocommerce_app/routes.dart';
import 'package:woocommerce_app/screens/splash/splash_screen.dart';
import 'package:woocommerce_app/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: theme(),
        // home: SplashScreen(),
        // We use routeName so that we dont need to remember the name
        initialRoute: SplashScreen.routeName,
        routes: routes,
      ),
    );
  }
}
