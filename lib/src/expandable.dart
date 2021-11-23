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
    bool? showArrowIcon = false,
    bool? hoverOn,
    Color? arrowColor = Colors.black,
    double? arrowSize,
    IconData? arrowIcon,
    bool? centralizePrimaryWidget = false,
    bool? isClickable = true,
    ArrowLocation? arrowLocation = ArrowLocation.right,
  })  : assert(primaryWidget != null),
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
          arrowColor: arrowColor,
          arrowSize: arrowSize,
          arrowIcon: arrowIcon,
          centralizePrimaryWidget: centralizePrimaryWidget,
          isClickable: isClickable,
          arrowLocation: arrowLocation,
        );
}
