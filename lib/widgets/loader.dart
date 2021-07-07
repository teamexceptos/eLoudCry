import 'package:eloudcry/utils/colors.dart';
import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({Key key, this.opacity = 1.0, this.label = ''})
      : super(key: key);

  final double opacity;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(11.0),
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: XColors.mainColor(),
          strokeWidth: 3,
          valueColor: AlwaysStoppedAnimation<Color>(XColors.white()),
        ),
      ),
    );
  }
}
