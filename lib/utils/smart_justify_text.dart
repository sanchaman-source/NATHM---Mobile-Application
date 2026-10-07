import 'package:flutter/material.dart';

class SmartJustifyText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final double minFill;

  const SmartJustifyText(
    this.text, {
    super.key,
    this.style,
    this.minFill = 0.9,
  });

  @override
  Widget build(BuildContext context) {
    final effective = style ?? DefaultTextStyle.of(context).style;

    return LayoutBuilder(
      builder: (context, constraints) {
        final painter = TextPainter(
          text: TextSpan(text: text, style: effective),
          textDirection: Directionality.of(context),
          textScaler: MediaQuery.textScalerOf(context),
        )..layout(maxWidth: constraints.maxWidth);

        final lines = painter.computeLineMetrics();

        var justify = lines.length > 1;

        for (var i = 0; i < lines.length - 1 && justify; i++) {
          if (lines[i].width / constraints.maxWidth < minFill) {
            justify = false;
          }
        }

        return Text(
          text,
          style: style,
          textAlign: justify ? TextAlign.justify : TextAlign.start,
        );
      },
    );
  }
}