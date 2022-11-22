import 'package:flutter/material.dart';

class SizeSelector extends StatelessWidget {
  List<String> sizes = ['40', '41', '42', '43', '44'];
  final String selectedSize;

  SizeSelector({
    super.key,
    required this.selectedSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        sizes.length,
        (index) => Padding(
          padding: EdgeInsets.only(right: 8),
          child: Material(
            color: Colors.white,
            child: InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: () {},
              child: Ink(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: selectedSize == sizes[index]
                      ? Theme.of(context).primaryColor
                      : Color(0xFFF3F3F3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    sizes[index],
                    style: TextStyle(
                        fontSize: 16,
                        color: selectedSize == sizes[index]
                            ? Colors.white
                            : Colors.black),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
