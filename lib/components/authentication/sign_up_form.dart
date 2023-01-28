import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_item/services/auth_services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';
import 'package:searchfield/searchfield.dart';
import '../select_country.dart';
import '/components/authentication/user.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignUpForm> {
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService authService = AuthService();
  void signupUser() {
    debugPrint("checkpoint 1");
    authService.signUpUser(
      context: context,
      email: emailController.text,
      password: passwordController.text,
      name: nameController.text,
      isBusiness: User.isBusiness,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Name",
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0, bottom: 10),
                child: TextFormField(
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Your Name';
                    } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return 'Enter Valid Name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: SvgPicture.asset(
                      "assets/icons/name.svg.svg",
                      fit: BoxFit.contain,
                      height: 8,
                      width: 8,
                    ),
                  ),
                ),
              ),
              const Text(
                "Email",
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0, bottom: 10),
                child: TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Your Email';
                    } else if (!RegExp(
                            r'^[a-zA-Z0-9]+(?:\.[a-zA-Z0-9]+)*@[a-zA-Z0-9]+(?:\.[a-zA-Z0-9]+)*$')
                        .hasMatch(value)) {
                      return 'Enter Valid Email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: SvgPicture.asset(
                      "assets/icons/email.svg",
                      fit: BoxFit.contain,
                      height: 8,
                      width: 8,
                    ),
                  ),
                ),
              ),
              const Text(
                "Password",
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2, bottom: 16),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: _obscureText,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Your Phone No.';
                    } else if (!RegExp(
                            r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
                        .hasMatch(value)) {
                      return 'Enter A Valid Phone No.';
                    } else if (value.length < 10 || value.length > 10) {
                      return 'Enter 10-Digit Phone No.';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      splashRadius: 0.1,
                      color: Colors.black54,
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: _toggle,
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: SvgPicture.asset("assets/icons/password.svg"),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 24),
                child: ElevatedButton(
                  onPressed: () {
                    signupUser();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF77D8E),
                    minimumSize: const Size(double.infinity, 56),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                      ),
                    ),
                  ),
                  child: Text(
                    "Sign Up",
                    style: GoogleFonts.getFont(
                      "Ubuntu",
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(),
      ],
    );
  }
}
