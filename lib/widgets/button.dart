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
  final bool isRound;
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
          borderRadius: BorderRadius.circular(isRound ? 36.0 : 0.0),
          side: BorderSide(
            width: 2,
            color: isRound
                ? Colors.transparent
                : borderColor.withOpacity(0.2) ?? Theme.of(context).primaryColor,
          ),
        ),
        child: MkText(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: textColor ?? XColors.mainColor(),
          ),
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
  final bool isRound;
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
        color: color ?? Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(isRound ? 36.0 : 0.0),
          side: BorderSide(
            color: isRound
                ? borderColor ?? Theme.of(context).primaryColor
                :  Colors.transparent,
          ),
        ),
        child: MkText(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: textColor ?? XColors.mainColor(),
          ),
        ),
      ),
    );
  }
}

class XButton extends StatelessWidget {

  final double height;
  final double width;
  final Function onClick;
  final String text;
  final double radius;
  final Color buttonColor;
  final Color textColor;
  final bool isLoading;
  final Color progressColor;
  final double textSize;

  XButton({
    @required this.onClick,
    @required this.text,
    this.height,
    this.width,
    this.radius,
    this.buttonColor,
    this.textColor,
    this.isLoading,
    this.progressColor,
    this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onClick();
      },
      child: Container(
        height: height != null ? height : 50,
        width: width != null ? width : 100,
        decoration: BoxDecoration(
          color: buttonColor ?? Theme.of(context).accentColor,
          borderRadius: radius != null ? BorderRadius.circular(radius) : BorderRadius.circular(5.0)
        ),
        child: Center(
          child:
          isLoading == null ?
          NormalText(
            text: text,
            textColor: textColor ?? Colors.white,
            fontSize: textSize == null ? 17: textSize,
          ): !isLoading ?
          NormalText(
            text: text,
            textColor: textColor ?? Colors.white,
            fontSize: textSize == null ? 17: textSize,
          ): isLoading ?
          SizedBox(
            child: CircularProgressIndicator(
              strokeWidth: 2.0,
              valueColor: progressColor != null ? AlwaysStoppedAnimation<Color>(progressColor): null,),
            height: 20,
            width: 20,
          ) :
          NormalText(
            text: text,
            textColor: textColor ?? Colors.white,
            fontSize: textSize == null ? 17: textSize,
          )
        ),
      ),
    );
  }
}
