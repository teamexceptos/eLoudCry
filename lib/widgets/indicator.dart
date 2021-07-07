import 'package:eloudcry/utils/colors.dart';
import 'package:flutter/material.dart';


class Indicator extends StatelessWidget {
  Indicator({
    @required this.controller,
    this.itemCount = 0,
  }) : assert(controller != null);

  final PageController controller;
  final int itemCount;
  final Color normalColor = XColors.primaryColor().withOpacity(0.4);
  final Color selectedColor = XColors.primaryColor();
  final double size = 12.0;
  final double spacing = 9.0;

  Widget _buildIndicator(int index, int pageCount, double dotSize, double spacing) {
    final bool isCurrentPageSelected = index == (controller.page != null ? controller.page.round() % pageCount: 0);

    return Container(
      height: size,
      width: size + (2 * spacing),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            width: isCurrentPageSelected ? 18 : dotSize,
            height: isCurrentPageSelected ? 13 :  dotSize,
            decoration: BoxDecoration(
              shape: isCurrentPageSelected ? BoxShape.rectangle : BoxShape.circle,
              color: isCurrentPageSelected ? selectedColor : normalColor,
            ),   
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(itemCount, (int index) {
        return _buildIndicator(index, itemCount, size, spacing);
      }),
    );
  }
}