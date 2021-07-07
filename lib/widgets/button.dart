import 'package:eloudcry/utils/colors.dart';
import 'package:eloudcry/widgets/texts.dart';
import 'package:flutter/material.dart';

class MkButton extends StatelessWidget {
  MkButton({
    Key key,
    @required this.text,
    @required this.onPressed,
    @required this.height,
    this.width,
    this.borderColor = Colors.transparent,
    this.fontWeight = FontWeight.w500,
    this.isLoading = false,
    this.progressColor,
    this.color,
    this.textColor,
    this.isRound = false,
    this.fontSize = 16.0,
  })  : assert(
            text != null && onPressed != null && height != null && height > 0),
        super(key: key);

  final String text;
  final Function onPressed;
  Color color;
  final Color textColor;
  final Color borderColor;
  final Color progressColor;
  final bool isRound;
  final bool isLoading;
  final double height;
  final double width;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {

    return Container(
      height: height,
      width: width != null ? width : null,
      child: FlatButton(
        onPressed: onPressed,
        color: color ?? Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(isRound ? 9.0 : 0.0),
          side: BorderSide(
            width: 2,
            color: Colors.transparent,
          ),
        ),
        child: !isLoading ? MkText(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: textColor ?? XColors.mainColor(),
          ),
        ) : SizedBox(
          child: CircularProgressIndicator(
            strokeWidth: 2.0,
            valueColor: progressColor != null ? AlwaysStoppedAnimation<Color>(progressColor): null,),
          height: 20,
          width: 20,
        ),
      ),
    );
  }
}

class MkOutlinedButton extends StatelessWidget {
  MkOutlinedButton({
    Key key,
    @required this.text,
    @required this.onPressed,
    @required this.height,
    this.width,
    this.borderColor = Colors.transparent,
    this.fontWeight = FontWeight.w500,
    this.color,
    this.isLoading = false,
    this.progressColor,
    this.textColor,
    this.isRound = false,
    this.fontSize = 14.0,
  })  : assert(
  text != null && onPressed != null && height != null && height > 0),
        super(key: key);

  final String text;
  final Function onPressed;
  Color color;
  Color textColor;
  final Color borderColor;
  final Color progressColor;
  final bool isRound;
  final bool isLoading;
  final double height;
  final double width;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {

    return Container(
      height: height,
      width: width != null ? width : null,
      child: OutlineButton(
        onPressed: onPressed,
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(isRound ? 9.0 : 0.0),
          side: BorderSide(
            color: borderColor ?? Theme.of(context).primaryColor
          ),
        ),
        child: !isLoading ? MkText(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: textColor ?? XColors.mainColor(),
          ),
        ) : SizedBox(
          child: CircularProgressIndicator(
            strokeWidth: 2.0,
            valueColor: progressColor != null ? AlwaysStoppedAnimation<Color>(progressColor): null,),
          height: 20,
          width: 20,
        ),
      ),
    );
  }
}
