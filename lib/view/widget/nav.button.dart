import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  const NavButton(
      {Key? key,
      required this.title,
      this.flex = 1,
      this.isSelected = false,
      required this.onTap,
      required this.color,
      this.margin = EdgeInsets.zero})
      : super(key: key);
  final String title;
  final int flex;
  final bool isSelected;
  final VoidCallback onTap;
  final Color color;
  final EdgeInsets margin;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(4),
        child: Container(
          margin: margin,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
              child: Text(
            title,
            style: TextStyle(
                color: Colors.white,
                fontWeight: isSelected ? FontWeight.bold : null),
          )),
        ),
      ),
    );
  }
}
