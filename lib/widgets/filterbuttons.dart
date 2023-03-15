import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterButtons extends StatefulWidget {
  const FilterButtons({super.key, required this.title});
  final String title;

  @override
  State<FilterButtons> createState() => _FilterButtonsState();
}

class _FilterButtonsState extends State<FilterButtons> {
  Color blockColor = Colors.transparent;
  Color fontColor = Colors.black;
  bool isSelected = false;

  void updateUI() {
    setState(() {
      if (isSelected) {
        blockColor = const Color(0xff0E3C6E);
        fontColor = Colors.white;
      } else {
        blockColor = Colors.transparent;
        fontColor = Colors.black;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected ? isSelected = false : isSelected = true;
        });
        updateUI();
      },
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: blockColor,
          border: Border.all(width: 1),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: Text(
            widget.title,
            style: GoogleFonts.lato(
              color: fontColor,
              textStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
