import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CollegeListCardWidget extends StatefulWidget {
  const CollegeListCardWidget({super.key});

  @override
  State<CollegeListCardWidget> createState() => _CollegeListCardWidgetState();
}

class _CollegeListCardWidgetState extends State<CollegeListCardWidget> {
  bool _isPressed = false;
  IconData bookmarkIcon = Icons.bookmark_outline;

  void updateUI() {
    if (_isPressed) {
      setState(() {
        bookmarkIcon = Icons.bookmark;
      });
    } else {
      setState(() {
        bookmarkIcon = Icons.bookmark_outline;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        elevation: 5,
        child: SizedBox(
          child: Stack(
            children: [
              /* ---------------------------------- Image --------------------------------- */

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ), // Image border
                    child: SizedBox(
                      width: double.infinity,
                      height: 116,
                      child: Image.asset(
                        'assets/college.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  /* -------------------------------- First Row ------------------------------- */

                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      top: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "GHJK Engineering College",
                              style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              width: 180,
                              child: Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eu ut imperdiet sed nec ullamcorper.",
                                style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black54,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        /* ------------------------------ Star & Button ----------------------------- */

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xff27C200),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    "4.2 ",
                                    style: GoogleFonts.lato(
                                      textStyle: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  const Icon(
                                    Icons.star,
                                    size: 16,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              width: 100,
                              height: 36,
                              child: FloatingActionButton.small(
                                backgroundColor: const Color(0xff0E3C6E),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                onPressed: () {},
                                child: Center(
                                  child: Text(
                                    "Apply Now",
                                    style: GoogleFonts.lato(
                                      textStyle: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  /* ------------------------------- Second Row ------------------------------- */

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.black26,
                    ),
                  ),

                  /* -------------------------------- Third Row ------------------------------- */

                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      bottom: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.thumb_up,
                              size: 20,
                              color: Colors.black54,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              "More than 1000+ students have been placed",
                              style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.remove_red_eye,
                              size: 20,
                              color: Colors.black54,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              "452+",
                              style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),

              /* --------------------- Share Button & Bookmark Button --------------------- */

              Padding(
                padding: const EdgeInsets.only(
                  left: 12,
                  right: 12,
                  top: 12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FloatingActionButton.small(
                      backgroundColor: Colors.white,
                      onPressed: () {},
                      child: const Icon(
                        Icons.share,
                        color: const Color(0xff0E3C6E),
                      ),
                    ),
                    FloatingActionButton.small(
                      backgroundColor: Colors.white,
                      onPressed: () {
                        setState(() {
                          _isPressed ? _isPressed = false : _isPressed = true;
                          updateUI();
                        });
                      },
                      child: Icon(
                        bookmarkIcon,
                        color: const Color(0xff0E3C6E),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
