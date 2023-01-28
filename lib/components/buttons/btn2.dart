import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';

class AnimatedBtn2 extends StatelessWidget {
  const AnimatedBtn2({
    Key? key,
    required RiveAnimationController btnAnimationController,
    required this.press,
  })  : _btnAnimationController = btnAnimationController,
        super(key: key);

  final RiveAnimationController _btnAnimationController;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        child: SizedBox(
          height: 64,
          width: 270,
          child: Stack(
            children: [
              RiveAnimation.asset(
                "assets/RiveAssets/button.riv",
                controllers: [_btnAnimationController],
              ),
              Positioned.fill(
                top: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // SizedBox(width: 1),
                    // Icon(
                    //   CupertinoIcons.arrow_right,
                    //   size: 30,
                    // ),
                    // SizedBox(width: 25),
                    Text(
                      "Consumer",
                      style: GoogleFonts.getFont(
                        "Ubuntu",
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
