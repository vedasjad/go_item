import 'package:flutter/material.dart';
import 'package:go_item/components/select_country.dart';
import 'package:go_item/providers/user_provider.dart';
import 'package:go_item/screens/hero_screen.dart';
import 'package:go_item/services/auth_services.dart';
import 'package:provider/provider.dart';
import 'screens/homepage.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuthService authService = AuthService();
  @override
  void initState() {
    debugPrint("checkpoint 0");
    authService.getCountries(context);
    authService.getUserData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Provider.of<UserProvider>(context).user.token.isEmpty
          ? const HomePage()
          : const HeroScreen(),
    );
  }
}
