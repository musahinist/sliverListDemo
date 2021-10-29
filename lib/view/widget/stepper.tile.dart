import 'package:flutter/material.dart';

class StepperTile extends StatelessWidget {
  const StepperTile(
      {Key? key,
      required this.index,
      required this.listLength,
      required this.image,
      required this.title})
      : super(key: key);
  final int index;
  final int listLength;
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 2),
          child: Column(
            children: [
              if (index != 0)
                CustomPaint(
                    size: const Size(0, 12), painter: DashedLinePainter())
              else
                const SizedBox(height: 12),
              const Padding(
                padding: EdgeInsets.all(4.0),
                child: CircleAvatar(
                  radius: 8,
                  child: Icon(
                    Icons.place,
                    size: 14,
                  ),
                ),
              ),
              if (index != listLength - 1)
                CustomPaint(
                    size: const Size(0, 12), painter: DashedLinePainter())
              else
                const SizedBox(height: 12),
            ],
          ),
        ),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: NetworkImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.only(right: 12, left: 8),
            height: 40,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey),
            ),
            child: Text(title),
          ),
        )
      ],
    );
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = 4, dashSpace = 4, startY = 0;
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
