import 'dart:async';
import 'package:expandable_widgets/src/constants.dart';
import 'package:flutter/material.dart';

abstract class ExpandableTextWidget extends StatefulWidget {
  ExpandableTextWidget({
    this.textWidget,
    this.onPressed,
    this.padding,
    this.backgroundColor,
    this.elevation,
    this.shape,
    this.animationDuration,
    this.beforeAnimationDuration,
    this.initiallyExpanded,
    this.hoverOn,
    this.showArrowIcon,
    this.arrowColor,
    this.arrowSize,
    this.arrowIcon,
    this.textDirection,
    this.arrowLocation,
    this.finalArrowLocation,
  });

  /// [Text] widget for [ExpandableText].
  final Text? textWidget;

  /// • Function that is placed top of the widget tree.
  ///
  /// • Animation starts AFTER this function.
  ///
  /// • For the duration between see [beforeAnimationDuration].
  final Function? onPressed;

  /// • Padding of the expandable.
  final EdgeInsets? padding;

  /// • Background color of the expandable.
  final Color? backgroundColor;

  /// • Elevation of the expandable.
  final double? elevation;

  /// • Shape of the expandable.
  ///
  /// • Notice that [shape] is a [ShapeBorder], not [BoxShape].
  final ShapeBorder? shape;

  /// • Duration for expand animation.
  final Duration? animationDuration;

  /// • Duration between [onPressed] & expand animation.
  final Duration? beforeAnimationDuration;

  /// • Icon that changes its direction with respect to expand animation.
  final bool? showArrowIcon;

  /// • Color of the icon that changes its direction with respect to expand animation.
  final Color? arrowColor;

  /// • Color of the icon that changes its direction with respect to expand animation.
  final double? arrowSize;

  /// • Icon of the pointer that changes its direction with respect to expand animation.
  final IconData? arrowIcon;

  /// • Whether this expandable widget will be expanded or collapsed at first.
  final bool? initiallyExpanded;

  /// • Whether expand animation will be triggered when hovered over this widget or not.
  ///
  /// • Added for web.
  final bool? hoverOn;

  /// • [TextDirection] of the expandable.
  ///
  /// • Default value is [TextDirection.ltr].
  ///
  /// • Notice that this property does not belong to [textWidget] but [ExpandableText].
  ///
  /// • See [ExpandableTextWidget] & [TextDirection] for more info.
  final TextDirection? textDirection;

  /// • Place of the arrow widget when this expandable is collapsed.
  final ArrowLocation? arrowLocation;

  /// • Place of the arrow widget when this expandable is expanded.
  final ArrowLocation? finalArrowLocation;

  @override
  _ExpandableTextWidgetState createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget>
    with TickerProviderStateMixin {
  late AnimationController _sizeController;
  late Animation<double> _sizeAnimation;
  bool _isExpanded = false;
  bool? initiallyExpanded = false;

  static final Animatable<double> _sizeTween = Tween<double>(
    begin: 00,
    end: 1.0,
  );

  _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
    switch (_sizeAnimation.status) {
      case AnimationStatus.completed:
        _sizeController.reverse();
        break;
      case AnimationStatus.dismissed:
        _sizeController.forward();
        break;
      case AnimationStatus.reverse:
      case AnimationStatus.forward:
        break;
    }
  }

  @override
  initState() {
    super.initState();
    _sizeController = AnimationController(
      vsync: this,
      duration: widget.animationDuration ?? Duration(milliseconds: 200),
    );

    final CurvedAnimation curve =
        CurvedAnimation(parent: _sizeController, curve: Curves.fastOutSlowIn);

    _sizeAnimation = _sizeTween.animate(curve);
    initiallyExpanded = widget.initiallyExpanded;
  }

  @override
  Widget build(BuildContext context) {
    if (initiallyExpanded == true) {
      _toggleExpand();
      initiallyExpanded = false;
    }
    Text finalText = Text(
      widget.textWidget!.data!,
      style: widget.textWidget!.style ?? TextStyle(color: Colors.black),
      strutStyle: widget.textWidget!.strutStyle,
      textAlign: widget.textWidget!.textAlign,
      textDirection: widget.textWidget!.textDirection,
      locale: widget.textWidget!.locale,
      softWrap: widget.textWidget!.softWrap,
      textScaleFactor: widget.textWidget!.textScaleFactor,
      semanticsLabel: widget.textWidget!.semanticsLabel,
      textWidthBasis: widget.textWidget!.textWidthBasis,
      textHeightBehavior: widget.textWidget!.textHeightBehavior,
    );
    return Directionality(
      textDirection: widget.textDirection!,
      child: Material(
        color: widget.backgroundColor ?? Colors.white,
        elevation: widget.elevation ?? 0,
        shape: widget.shape ?? null,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          onHover: widget.hoverOn ?? false
              ? (value) => value ? _toggleExpand() : _isExpanded = true
              : null,
          onTap: () {
            if (widget.onPressed.toString() != 'null') widget.onPressed!();
            Timer(widget.beforeAnimationDuration ?? Duration(milliseconds: 20),
                () => _toggleExpand());
          },
          child: Container(
            padding: widget.padding ?? EdgeInsets.all(20.0),
            child: widget.showArrowIcon!
                ? AnimatedCrossFade(
                    duration: widget.animationDuration!,
                    crossFadeState: _isExpanded
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    firstChild: (widget.finalArrowLocation ==
                                ArrowLocation.left ||
                            widget.finalArrowLocation == ArrowLocation.right)
                        ? Row(
                            textDirection:
                                widget.arrowLocation == ArrowLocation.right
                                    ? TextDirection.ltr
                                    : TextDirection.rtl,
                            children: [
                              Expanded(child: finalText),
                              Padding(
                                padding:
                                    widget.arrowLocation == ArrowLocation.left
                                        ? EdgeInsets.only(
                                            right: widget.padding!.right)
                                        : EdgeInsets.only(
                                            left: widget.padding!.left),
                                child: Icon(
                                  Icons.keyboard_arrow_up_rounded,
                                  color: Colors.black,
                                  size: 25.0,
                                ),
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              if (widget.finalArrowLocation ==
                                  ArrowLocation.bottom)
                                finalText,
                              Padding(
                                padding: EdgeInsets.only(
                                    top: widget.padding!.bottom),
                                child: Icon(
                                  Icons.keyboard_arrow_up_rounded,
                                  color: Colors.black,
                                  size: 25.0,
                                ),
                              ),
                            ],
                          ),
                    secondChild: (widget.arrowLocation == ArrowLocation.left ||
                            widget.arrowLocation == ArrowLocation.right)
                        ? Row(
                            textDirection:
                                widget.arrowLocation == ArrowLocation.right
                                    ? TextDirection.ltr
                                    : TextDirection.rtl,
                            children: [
                              Expanded(child: widget.textWidget!),
                              Padding(
                                padding:
                                    widget.arrowLocation == ArrowLocation.left
                                        ? EdgeInsets.only(
                                            right: widget.padding!.right)
                                        : EdgeInsets.only(
                                            left: widget.padding!.left),
                                child: _holderIcon(widget.arrowColor),
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              if (widget.arrowLocation == ArrowLocation.bottom)
                                widget.textWidget!,
                              Padding(
                                padding: EdgeInsets.only(
                                    top: widget.padding!.bottom),
                                child: _holderIcon(widget.arrowColor),
                              ),
                            ],
                          ),
                  )
                : AnimatedCrossFade(
                    duration: widget.animationDuration!,
                    crossFadeState: _isExpanded
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    firstChild: Text(
                      widget.textWidget!.data!,
                      style: widget.textWidget!.style ??
                          TextStyle(color: Colors.black),
                      strutStyle: widget.textWidget!.strutStyle,
                      textAlign: widget.textWidget!.textAlign,
                      textDirection: widget.textWidget!.textDirection,
                      locale: widget.textWidget!.locale,
                      softWrap: widget.textWidget!.softWrap,
                      textScaleFactor: widget.textWidget!.textScaleFactor,
                      semanticsLabel: widget.textWidget!.semanticsLabel,
                      textWidthBasis: widget.textWidget!.textWidthBasis,
                      textHeightBehavior: widget.textWidget!.textHeightBehavior,
                    ),
                    secondChild: widget.textWidget!,
                  ),
          ),
        ),
      ),
    );
  }

  Widget _holderIcon(Color? color) {
    return Icon(
      widget.arrowIcon ?? Icons.keyboard_arrow_down_rounded,
      color: color,
      size: widget.arrowSize,
    );
  }
}
