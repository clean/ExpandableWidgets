import 'package:expandable_widgets/expandable_widgets.dart';
import 'package:expandable_widgets/src/expandable_widget.dart';
import 'package:flutter/material.dart';

class Expandable extends ExpandableWidget {
  /// • Provides an expandable widget for general use.
  ///
  /// • See [ExpandableWidget] for more details.
  Expandable({
    Widget? primaryWidget,
    Widget? secondaryWidget,
    Function? onPressed,
    Color? backgroundColor = Colors.white,
    double? elevation = 0,
    ShapeBorder? shape,
    EdgeInsets? padding = const EdgeInsets.all(20.0),
    Duration? animationDuration = const Duration(milliseconds: 100),
    Duration? beforeAnimationDuration,
    DecorationImage? backgroundImage,
    bool? showArrowIcon = false,
    bool? hoverOn,
    Widget? arrowWidget,
    bool? centralizePrimaryWidget = false,
    bool? isClickable = true,
    ArrowLocation? arrowLocation = ArrowLocation.right,
  })  : assert(primaryWidget != null),
        assert((isClickable == false && arrowWidget != null) ||
            (isClickable == true)),
        super(
          primaryWidget: primaryWidget,
          secondaryWidget: secondaryWidget,
          onPressed: onPressed,
          backgroundColor: backgroundColor,
          elevation: elevation,
          shape: shape,
          animationDuration: animationDuration,
          beforeAnimationDuration: beforeAnimationDuration,
          padding: padding,
          hoverOn: hoverOn,
          showArrowIcon: showArrowIcon,
          arrowWidget: arrowWidget,
          centralizePrimaryWidget: centralizePrimaryWidget,
          isClickable: isClickable,
          arrowLocation: arrowLocation,
        );
}
