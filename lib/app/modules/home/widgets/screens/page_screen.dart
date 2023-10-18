import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class PageScreen extends StatelessWidget {
  final String title;
  final String subtitle;
  final String pathImage;
  final String pathAnimation;

  const PageScreen(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.pathImage,
      this.pathAnimation = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.kanit(
              color: const Color(0xFF405965),
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          pathAnimation != ''
              ? Lottie.asset(
                  pathAnimation,
                  width: 220,
                  height: 220,
                  fit: BoxFit.contain,
                )
              : SizedBox(
                  width: 120,
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: const Color(0xFFC8D7D2),
                        width: 2,
                      ),
                    ),
                    child: Image.asset(
                      pathImage,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
          const SizedBox(
            height: 20,
          ),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: GoogleFonts.kanit(
              color: const Color(0xFF405965),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
