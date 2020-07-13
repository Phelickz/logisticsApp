import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logistics/services/responsiveness/altres.dart';

import '../style.dart';

class SidebarItem extends StatelessWidget {
  final isSelected;
  final String text;
  final Function onTabTap;

  const SidebarItem({
    Key key,
    this.isSelected,
    this.text,
    this.onTabTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -1.58,
      child: GestureDetector(
        onTap: onTabTap,
        child: Column(
          children: <Widget>[
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 6,
              width: 6,
              decoration: BoxDecoration(shape: BoxShape.circle, color: isSelected ? Colors.white : Colors.transparent),
            ),
            AnimatedDefaultTextStyle(
              child: Text(
                text,
                style: GoogleFonts.aBeeZee(
                  fontSize: SizeConfig().textSize(context, 3)
                ),
              ),
              duration: const Duration(milliseconds: 200),
              style: isSelected ? selectedTabStyle : defaultTabStyle,
            ),
          ],
        ),
      ),
    );
  }
}