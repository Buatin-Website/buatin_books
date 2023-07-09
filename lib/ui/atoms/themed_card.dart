import 'package:flutter/material.dart';

class ThemedCard extends StatelessWidget {
  const ThemedCard({
    Key? key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.margin = const EdgeInsets.all(0),
    this.color = Colors.white,
    this.borderRadius = 8,
    this.elevation = 4,
    this.cardImage,
    this.cardTitle,
    this.cardSubtitle,
    this.onTap,
  }) : super(key: key);

  final Widget child;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Color color;
  final double borderRadius;
  final double elevation;
  final Widget? cardImage;
  final String? cardTitle;
  final String? cardSubtitle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: 180,
      child: Card(
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: InkWell(
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Set the card image to be rounded on the top left and bottom left corners
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(borderRadius),
                  topRight: Radius.circular(borderRadius),
                ),
                child: cardImage ?? const SizedBox(),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: padding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cardTitle ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Text(
                        cardSubtitle ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
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