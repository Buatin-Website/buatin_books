import 'package:flutter/material.dart';

class ThemedListView extends StatelessWidget {
  const ThemedListView({
    super.key,
    required this.children,
    this.scrollDirection = Axis.vertical,
    this.separatorBuilder,
    this.padding = 16.0,
    this.sectionTitle,
    this.sectionAction,
  });

  final List<Widget> children;
  final Axis scrollDirection;
  final Widget Function(BuildContext, int) ?separatorBuilder;
  final double padding;
  final String? sectionTitle;
  final Widget? sectionAction;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (sectionTitle != null) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(right: padding, top: padding, left: padding),
                child: Text(
                  sectionTitle!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (sectionAction != null) ...[
                Padding(
                  padding: EdgeInsets.only(right: padding, top: padding),
                  child: sectionAction,
                ),
              ],
            ],
          ),
        ],
        SizedBox(
          height: 285,
          child: ListView.separated(
            itemCount: children.length,
            scrollDirection: scrollDirection,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return children[index];
            },
            separatorBuilder: separatorBuilder ?? (context, index) {
              return const SizedBox(width: 16);
            },
            padding: EdgeInsets.all(padding)
          ),
        ),
      ],
    );
  }
}