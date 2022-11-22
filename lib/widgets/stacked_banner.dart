import 'package:flutter/material.dart';

class StackedBanner extends StatelessWidget {
  const StackedBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          child: Stack(
            children: [
              Positioned(
                top: 40,
                left: 180,
                child: Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF725ABC),
                  ),
                ),
              ),
              Positioned(
                top: -50,
                left: -80,
                child: Container(
                  height: 180,
                  width: 180,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF8D55B8),
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  height: 250,
                  alignment: Alignment.center,
                  child: Text(
                    'Welcome to AR Mall',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
