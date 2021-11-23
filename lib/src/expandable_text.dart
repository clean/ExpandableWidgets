import 'package:expandable_widgets/src/constants.dart';
import 'package:expandable_widgets/src/expandable_text_widget.dart';
import 'package:flutter/material.dart';

class ExpandableText extends ExpandableTextWidget {
  /// • Provides an expandable widget for a long text.
  ///
  /// • One should add [maxLines] property to [textWidget] otherwise widget will
  /// not be expandable.
  ///
  /// • See [ExpandableTextWidget] for more details.
  ExpandableText({
    Color? backgroundColor,
    double? elevation = 0.0,
    EdgeInsets? padding = const EdgeInsets.all(20.0),
    ShapeBorder? shape,
    Duration? animationDuration = const Duration(milliseconds: 100),
    Function? onPressed,
    Text? textWidget,
    bool? hoverOn = false,
    bool? showArrowIcon = false,
    Color? arrowColor = Colors.black,
    double? arrowSize,
    IconData? arrowIcon,
    bool? initiallyExpanded = false,
    TextDirection textDirection = TextDirection.ltr,
    ArrowLocation arrowLocation = ArrowLocation.right,
    ArrowLocation finalArrowLocation = ArrowLocation.bottom,
  })  : assert(textWidget != null),
        super(
          backgroundColor: backgroundColor,
          elevation: elevation,
          padding: padding,
          shape: shape,
          animationDuration: animationDuration,
          onPressed: onPressed,
          textWidget: textWidget,
          hoverOn: hoverOn,
          showArrowIcon: showArrowIcon,
          arrowColor: arrowColor,
          arrowSize: arrowSize,
          arrowIcon: arrowIcon,
          initiallyExpanded: initiallyExpanded,
          textDirection: textDirection,
          arrowLocation: arrowLocation,
          finalArrowLocation: finalArrowLocation,
        );
}
