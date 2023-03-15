// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:skygoal_assignment/screens/collegelistscreen.dart';

class CollegeCardHome extends StatefulWidget {
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
  State<CollegeCardHome> createState() => _CollegeCardHomeState();
}

class _CollegeCardHomeState extends State<CollegeCardHome> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: GestureDetector(
        /* ------------------------------ Swipe Up Menu ----------------------------- */

        onTap: () {
          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
            context: context,
            builder: (BuildContext context) {
              return SizedBox(
                // height: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 24,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Sort by",
                            style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff0E3C6E),
                                fontSize: 18,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.close,
                              color: Colors.black45,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Divider(),
                      const Expanded(
                        child: RadioButtonWidget(),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: FloatingActionButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CollegeListScreen(),
                              ),
                            );
                          },
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          backgroundColor: const Color(0xff0E3C6E),
                          child: Text(
                            "Sort",
                            style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Stack(
          children: [
            /* --------------------------- Bottom Image Layer --------------------------- */

            Container(
              margin: const EdgeInsets.all(0),
              height: 150,
              width: 350,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    widget.imageUrl,
                  ),
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),

            /* -------------------------- Black Gradient Layer -------------------------- */

            Container(
              margin: const EdgeInsets.all(0),
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
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      widget.collegeText,
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
                              widget.collegeNum,
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

enum SortBy { btech, barch, pharma, law, management }

class RadioButtonWidget extends StatefulWidget {
  const RadioButtonWidget({super.key});

  @override
  State<RadioButtonWidget> createState() => _RadioButtonWidgetState();
}

class _RadioButtonWidgetState extends State<RadioButtonWidget> {
  SortBy? _character = SortBy.btech;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ListTile(
            iconColor: Colors.black,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            title: Text(
              'Bachelors of Technology',
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
            leading: const Icon(LineIcons.graduationCap),
            trailing: Radio<SortBy>(
              value: SortBy.btech,
              activeColor: const Color(0xff0E3C6E),
              groupValue: _character,
              onChanged: (SortBy? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          ListTile(
            iconColor: Colors.black,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            title: Text(
              'Bachelors of Architecture',
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
            leading: const Icon(LineIcons.drawPolygon),
            trailing: Radio<SortBy>(
              value: SortBy.barch,
              activeColor: const Color(0xff0E3C6E),
              groupValue: _character,
              onChanged: (SortBy? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          ListTile(
            iconColor: Colors.black,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            title: Text(
              'Pharma',
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
            leading: const Icon(LineIcons.microscope),
            trailing: Radio<SortBy>(
              value: SortBy.pharma,
              activeColor: const Color(0xff0E3C6E),
              groupValue: _character,
              onChanged: (SortBy? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          ListTile(
            iconColor: Colors.black,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            title: Text(
              'Law',
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
            leading: const Icon(LineIcons.balanceScale),
            trailing: Radio<SortBy>(
              value: SortBy.law,
              activeColor: const Color(0xff0E3C6E),
              groupValue: _character,
              onChanged: (SortBy? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          ListTile(
            iconColor: Colors.black,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            title: Text(
              'Management',
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
            leading: const Icon(LineIcons.chalkboardTeacher),
            trailing: Radio<SortBy>(
              value: SortBy.management,
              activeColor: const Color(0xff0E3C6E),
              groupValue: _character,
              onChanged: (SortBy? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
