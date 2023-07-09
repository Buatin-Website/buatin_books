import 'package:flutter/material.dart';

class ThemedIndicator extends StatelessWidget {
  const ThemedIndicator({
    Key? key,
    this.title,
    this.subtitle,
    this.height = 200,
    this.width = 1,
  }) : super(key: key);

  final String ?title;
  final String ?subtitle;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    // Fit to width and center the text
    return Center(
      child: SizedBox(
        height: height,
        width: MediaQuery.of(context).size.width * width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            ...[
              if (title != null) ...[
                Text(
                  title!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ],
            ...[
              if (subtitle != null) ...[
                Text(
                  subtitle!,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ],
          ],
        ),
      ),
    );
  }
}