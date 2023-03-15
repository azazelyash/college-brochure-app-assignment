import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skygoal_assignment/widgets/homeCard.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String imageUrl = "assets/college.jpg";
  String collegeText =
      "Search through thousands of accredited colleges and universities online to find the right one for you.  Apply in 3 min, and connect with your future.";
  String collegeNum = "+128 ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200),
        child: AppBar(
          scrolledUnderElevation: 0,
          elevation: 0,
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: Color(0xff0E3C6E),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 32.0, right: 32, top: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Find your own way",
                              style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Search in 600 colleges around!",
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
                        const Icon(
                          Icons.notifications,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: "Search for colleges, schools.....",
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black26,
                                fontSize: 14,
                              ),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.black26,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        FloatingActionButton(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          elevation: 0,
                          onPressed: () {},
                          backgroundColor: Colors.white,
                          child: const Icon(
                            Icons.mic,
                            color: Color(0xff0E3C6E),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 32.0, right: 32, bottom: 24),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                CollegeCardHome(
                  imageUrl: imageUrl,
                  collegeText: collegeText,
                  collegeNum: collegeNum,
                ),
                CollegeCardHome(
                  imageUrl: imageUrl,
                  collegeText: collegeText,
                  collegeNum: collegeNum,
                ),
                CollegeCardHome(
                  imageUrl: imageUrl,
                  collegeText: collegeText,
                  collegeNum: collegeNum,
                ),
                CollegeCardHome(
                  imageUrl: imageUrl,
                  collegeText: collegeText,
                  collegeNum: collegeNum,
                ),
                CollegeCardHome(
                  imageUrl: imageUrl,
                  collegeText: collegeText,
                  collegeNum: collegeNum,
                ),
                CollegeCardHome(
                  imageUrl: imageUrl,
                  collegeText: collegeText,
                  collegeNum: collegeNum,
                ),
                CollegeCardHome(
                  imageUrl: imageUrl,
                  collegeText: collegeText,
                  collegeNum: collegeNum,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
