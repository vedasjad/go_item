import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';
import '../providers/user_provider.dart';
import '../screens/hero_screen.dart';
import '../screens/homepage.dart';
import '../utils/constants.dart';
import '../utils/utils.dart';

class AuthService {
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
    required bool isBusiness,
  }) async {
    try {
      User user = User(
        name: name,
        email: email,
        token: '',
        password: password,
        isBusiness: isBusiness,
      );
      // debugPrint(user.toJson());
      http.Response res = await http.post(
        Uri.parse('${Constants.uri}/auth/register'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (res.statusCode != 201) {
        debugPrint(res.statusCode.toString());
      }
      showSnackBar(
        context,
        'Account created! Login with the same credentials!',
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      final navigator = Navigator.of(context);
      http.Response res = await http.post(
        Uri.parse('${Constants.uri}/auth/login'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      SharedPreferences prefs = await SharedPreferences.getInstance();
      debugPrint(res.body);
      userProvider.setUser(res.body);

      await prefs.setString('auth-token', jsonDecode(res.body)['accessToken']);
      // debugPrint(prefs.getString('auth-token'));
      //
      navigator.pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const HeroScreen()),
        (route) => false,
      );
      //
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void getUserData(
    BuildContext context,
  ) async {
    try {
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('auth-token');

      if (token == null) {
        prefs.setString('auth-token', '');
      }
      var tokenRes = await http.get(
        Uri.parse('${Constants.uri}/auth/verifytoken'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'auth-token': token!,
        },
      );
      var response = jsonDecode(tokenRes.body);

      if (response == true) {
        http.Response userRes = await http.get(
          Uri.parse('${Constants.uri}/users/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'auth-token': token,
          },
        );
        userProvider.setUser(userRes.body);
        debugPrint(userRes.body);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void signOut(BuildContext context) async {
    final navigator = Navigator.of(context);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('auth-token', '');
    navigator.pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const HeroScreen(),
      ),
      (route) => false,
    );
  }

  void getCountries(BuildContext context) async {
    try {
      http.Response res = await http.get(
        Uri.parse('${Constants.uri}/getCountries'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (res.statusCode == 201) {
        debugPrint(res.body);
      } else {
        debugPrint(res.statusCode.toString());
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void addWarehouse(
    BuildContext context,
    String email,
    String country,
    num capacity,
    List commodity,
    num availableCapacity,
  ) async {
    try {
      http.Response res = await http.post(
        Uri.parse('${Constants.uri}/business/:$email/addWarehouse'),
        body: jsonEncode({
          'email': email,
          'country': country,
          'capacity': capacity,
          'commodity': commodity,
          'availableCapacity': availableCapacity,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
