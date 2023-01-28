import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';

import '../components/authentication/user.dart';
import '../components/buttons/btn1.dart';
import 'package:flutter/material.dart';
import '../components/palette.dart';
import 'package:rive/rive.dart';
import '../components/authentication/sign_in_dialog.dart';
import '../components/buttons/btn2.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _OnbodingScreenState();
}

class _OnbodingScreenState extends State<HomePage> {
  late RiveAnimationController _btnAnimationController;

  bool isShowSignInDialog = false;

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation(
      "active",
      autoplay: true,
    );
    super.initState();
  }

  String x = "Business ";
  String y = "Consumer";

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            const RiveAnimation.asset(
              "assets/RiveAssets/shapes.riv",
              fit: BoxFit.fitWidth,
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: const SizedBox(),
              ),
            ),
            Positioned(
              width: MediaQuery.of(context).size.width * 1.7,
              right: 100,
              bottom: 210,
              child: Image.asset(
                "assets/images/Spline.png",
              ),
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: const SizedBox(),
              ),
            ),
            AnimatedPositioned(
              top: isShowSignInDialog ? -50 : 0,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              duration: const Duration(milliseconds: 500),
              child: SafeArea(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: screenHeight * 0.1),
                          height: screenHeight * 0.3,
                          child: Center(
                            child: Text(
                              "Welcome Back!\nYour shipments missed you",
                              style: GoogleFonts.getFont(
                                "Ubuntu",
                                fontSize: screenHeight * 0.05,
                                color: Colors.black87,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        AnimatedBtn1(
                          btnAnimationController: _btnAnimationController,
                          press: () {
                            _btnAnimationController.isActive = true;
                            Future.delayed(
                              const Duration(milliseconds: 800),
                              () {
                                setState(() {
                                  isShowSignInDialog = true;
                                });
                                showCustomDialog(
                                  context,
                                  onValue: (_) {
                                    setState(() {
                                      isShowSignInDialog = false;
                                    });
                                  },
                                  isBusiness: true,
                                );
                                User.isBusiness = true;
                              },
                            );
                          },
                        ),
                        // Row(
                        //   children: [
                        //     const Expanded(
                        //       child: Divider(
                        //         color: Colors.black,
                        //       ),
                        //     ),
                        //     Padding(
                        //       padding:
                        //           const EdgeInsets.symmetric(horizontal: 16),
                        //       child: Text(
                        //         "OR",
                        //         style: GoogleFonts.getFont(
                        //           "Ubuntu",
                        //           color: Colors.black,
                        //           fontSize: 20,
                        //           fontWeight: FontWeight.w500,
                        //         ),
                        //       ),
                        //     ),
                        //     const Expanded(
                        //         child: Divider(
                        //       color: Colors.black,
                        //     )),
                        //   ],
                        // ),
                        // AnimatedBtn2(
                        //   btnAnimationController: _btnAnimationController,
                        //   press: () {
                        //     _btnAnimationController.isActive = true;
                        //
                        //     Future.delayed(
                        //       const Duration(milliseconds: 800),
                        //       () {
                        //         setState(() {
                        //           isShowSignInDialog = true;
                        //         });
                        //         showCustomDialog(
                        //           context,
                        //           onValue: (_) {
                        //             setState(() {
                        //               isShowSignInDialog = false;
                        //             });
                        //           },
                        //           isBusiness: false,
                        //         );
                        //         User.isBusiness = false;
                        //       },
                        //     );
                        //   },
                        // ),
                        // SizedBox(
                        //   height: screenHeight * 0.2,
                        // )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
