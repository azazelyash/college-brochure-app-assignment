import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CollegeCardHome extends StatelessWidget {
  const CollegeCardHome({
    super.key,
    required this.imageUrl,
    required this.collegeText,
    required this.collegeNum,
  });

  final String imageUrl;
  final String collegeText;
  final String collegeNum;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Stack(
        children: [
          /* --------------------------- Bottom Image Layer --------------------------- */

          Container(
            margin: EdgeInsets.all(0),
            height: 150,
            width: 350,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  imageUrl,
                ),
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
          ),

          /* -------------------------- Black Gradient Layer -------------------------- */

          Container(
            margin: EdgeInsets.all(0),
            height: 150,
            width: 350,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.black,
                  Colors.black.withOpacity(0),
                ],
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
          ),

          /* ------------------------------- Text Layer ------------------------------- */

          SizedBox(
            height: 150,
            width: 350,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 20.0,
              ),
              child: Column(
                textBaseline: TextBaseline.alphabetic,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Top Colleges",
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    collegeText,
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /* ------------------------------ Clipped Path ------------------------------ */

          Positioned(
            right: 0,
            bottom: 0,
            child: ClipPath(
              clipper: MyCustomCliper(),
              child: Container(
                color: const Color.fromARGB(255, 245, 245, 245),
                height: 60,
                width: 120,
                child: Center(
                  child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            collegeNum,
                            style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Text(
                            "Colleges",
                            style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black54,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyCustomCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(0, size.height)
      ..quadraticBezierTo(20, size.height, 20, 40)
      ..quadraticBezierTo(20, 20, 40, 20)
      ..lineTo(size.width - 20, 20)
      ..quadraticBezierTo(size.width, 20, size.width, 0)
      ..lineTo(size.width, size.height)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
