import 'package:flutter/material.dart';
import '../screens/homepage.dart';

class OnBoardingSinglePage extends StatelessWidget {
  const OnBoardingSinglePage(
      {required this.imagePath,
      required this.title,
      required this.description,
      this.isLastPage = false,
      Key? key})
      : super(key: key);

  final String imagePath;
  final String title;
  final String description;
  final bool isLastPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
      ),
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.transparent, Theme.of(context).primaryColor],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 4),
            Text(title,
                style: Theme.of(context).textTheme.headline5?.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Text(
              description,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            if (isLastPage)
              Column(
                children: [
                  const SizedBox(height: 36),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, HomePage.namedRoute, (route) => false);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('GET STARTED',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2
                                ?.copyWith(color: Colors.white)),
                        const SizedBox(width: 5),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor:
                              Theme.of(context).textTheme.subtitle1?.color,
                          child: const Icon(Icons.chevron_right_rounded,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            if (!isLastPage) const Spacer(flex: 3) else const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
