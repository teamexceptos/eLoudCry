import 'package:eloudcry/utils/size_config.dart';
import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color textColor;
  final FontWeight fontWeight;
  final TextAlign textAlign;

  TitleText(
      {@required this.text,
      this.fontSize,
      this.fontWeight,
      this.textColor,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign != null ? textAlign : TextAlign.start,
      style: Theme.of(context).textTheme.headline1.copyWith(
          fontSize: fontSize != null ? fontSize : 20,
          fontWeight: fontWeight != null ? fontWeight : FontWeight.normal,
          color: textColor != null ? textColor : Colors.black),
    );
  }
}

class NormalText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color textColor;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final int maxLines;

  NormalText(
      {@required this.text,
      this.fontSize,
      this.textColor,
      this.fontWeight,
      this.textAlign,
      this.maxLines
    });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign != null ? textAlign : TextAlign.start,
      style: Theme.of(context).textTheme.bodyText1.copyWith(
          fontSize: fontSize != null ? fontSize : 15,
          color: textColor != null ? textColor : Colors.black,
          fontWeight: fontWeight != null ? fontWeight : FontWeight.w400),
    );
  }
}

class AccentText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color textColor;
  final TextAlign textAlign;

  AccentText(
      {@required this.text, this.fontSize, this.textColor, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign != null ? textAlign : TextAlign.start,
      style: Theme.of(context).textTheme.bodyText1.copyWith(
          fontSize: fontSize != null ? fontSize : 15,
          color: textColor != null ? textColor : Colors.black),
    );
  }
}

class MkText extends StatelessWidget {
  const MkText(
    this.text, {
    Key key,
    this.textAlign,
    this.style,
    this.textWidth,
    this.maxLines,
    this.overflow = TextOverflow.ellipsis,
  })  : assert(text != null),
        super(key: key);

  final String text;
  final TextAlign textAlign;
  final TextStyle style;
  final double textWidth;
  final int maxLines;
  final TextOverflow overflow;

  @override
  Widget build(BuildContext context) {

    return Container(
      width: textWidth ?? null,
      child: Text(
        text,
        maxLines: maxLines,
        overflow: maxLines != null ? overflow : null,
        textAlign: textAlign,
        style: style?.copyWith(
          fontSize: style.fontSize ?? 12,
        ),
      ),
    );
  }
}
