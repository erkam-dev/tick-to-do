import 'package:flutter/material.dart';

extension MaterialExtension on Widget {
  Material material({
    Key? key,
    Color? color,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
    Duration? animationDuration,
    bool? enableFeedback,
    bool? semanticContainer,
    double? shadowColorOpacity,
  }) {
    return Material(
      key: key,
      color: color,
      elevation: elevation ?? 0,
      shape: shape,
      clipBehavior: clipBehavior ?? Clip.none,
      animationDuration: animationDuration ?? kThemeChangeDuration,
      child: this,
    );
  }

  Card card({
    Key? key,
    Color? color,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
    bool? semanticContainer,
    double? shadowColorOpacity,
  }) {
    return Card(
      key: key,
      color: color,
      elevation: elevation ?? 0,
      shape: shape,
      clipBehavior: clipBehavior ?? Clip.none,
      child: this,
    );
  }
}