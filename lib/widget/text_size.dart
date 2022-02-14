import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gondwana_club/global_style/style.dart';

class SizedText extends StatelessWidget {
  final String text;
  final Color color;
  const SizedText({Key? key, required this.text, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final Size textsize = _thetextSize(text);
    return Container(
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: color,
              fontWeight: FontWeight.w400,
            ),
            maxLines: 1,
            softWrap: false,
            overflow: TextOverflow.clip,
          )
        ],
      ),
    );
  }

  // Size _thetextSize(String text) {
  //   final TextPainter textPainter= TextPainter(
  //     text: TextSpan(
  //       text: text,
  //       style: TextStyle(
  //         fontSize: 16,
  //         color: color,
  //         fontWeight: FontWeight.w400,
  //       ),
  //     ),
  //     maxLines: 1,
  //     textDirection: TextDirection.ltr,
  //   )..layout(minWidth: 0, maxWidth: double.infinity);
  // }
}
