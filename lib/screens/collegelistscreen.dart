import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:skygoal_assignment/pages/account.dart';
import 'package:skygoal_assignment/pages/saved.dart';
import 'package:skygoal_assignment/pages/search.dart';
import 'package:skygoal_assignment/widgets/filterbuttons.dart';

class CollegeListScreen extends StatefulWidget {
  const CollegeListScreen({super.key});

  @override
  State<CollegeListScreen> createState() => _CollegeListScreenState();
}

class _CollegeListScreenState extends State<CollegeListScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const SearchPage(),
    const SavedPage(),
    const SavedPage(),
    const AccountPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          automaticallyImplyLeading: false,
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
                padding: const EdgeInsets.only(
                  left: 32.0,
                  right: 32,
                  top: 24,
                  bottom: 24,
                ),
                child: Row(
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
              ),
            ),
          ),
        ),
      ),

      /* ----------------------------- Navigation Bar ----------------------------- */

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color(0xff0E3C6E),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 16),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: const Color(0xff0E3C6E),
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              textStyle: GoogleFonts.lato(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xff0E3C6E),
                  fontSize: 14,
                ),
              ),
              color: Colors.white,
              tabs: const [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: LineIcons.archive,
                  text: 'Saved',
                ),
                GButton(
                  icon: LineIcons.archiveFile,
                  text: 'Saved',
                ),
                GButton(
                  icon: LineIcons.user,
                  text: 'Profile',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),

      /* ---------------------------------- Body ---------------------------------- */

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              child: Row(
                children: const [
                  FilterButtons(
                    title: "JSS Banglore",
                  ),
                  FilterButtons(
                    title: "JSS NOIDA",
                  ),
                  FilterButtons(
                    title: "IIT Delhi",
                  ),
                  FilterButtons(
                    title: "HBTI Kanpur",
                  ),
                  FilterButtons(
                    title: "NIT Warangal",
                  ),
                  FilterButtons(
                    title: "NIT Trichy",
                  ),
                ],
              ),
            ),
            Text("Hello"),
          ],
        ),
      ),
    );
  }
}
