import 'package:flutter/material.dart';

class Appbar extends StatelessWidget {
  const Appbar({
    required this.title,
    this.color,
    Key? key,
  }) : super(key: key);
  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 5,
                      spreadRadius: 1)
                ]),
            child: Builder(
              builder: (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(
                  Icons.notes_rounded,
                ),
              ),
            ),
          ),
          Text(
            title,
            style: TextStyle(
                color: color == null ? Colors.black : Colors.white,
                fontSize: 19,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Color(0xFFFB9ED2), width: 2),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      blurRadius: 4,
                      spreadRadius: 1)
                ]),
            child: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              maxRadius: 23,
              child: Text(
                'A',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
