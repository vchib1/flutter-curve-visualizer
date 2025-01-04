import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CurveModel extends Equatable {
  final Curve curve;
  final String code;
  final String name;
  final bool isCustom;

  const CurveModel({
    required this.curve,
    required this.code,
    required this.name,
    this.isCustom = false,
  });

  @override
  List<Object?> get props => [isCustom, name];

  static Map<String, List<CurveModel>> get list => {
        'ease': easeCurves,
        'bounces': bounceCurves,
        'elastics': elasticCurves,
        'others': otherCurves,
      };

  CurveModel copyWith({
    Curve? curve,
    String? code,
    String? name,
    bool? isCustom,
  }) {
    return CurveModel(
      curve: curve ?? this.curve,
      code: code ?? this.code,
      name: name ?? this.name,
      isCustom: isCustom ?? this.isCustom,
    );
  }
}

final easeCurves = [
  CurveModel(curve: Curves.ease, code: "Curves.ease", name: "ease"),
  CurveModel(curve: Curves.easeIn, code: "Curves.easeIn", name: "easeIn"),
  CurveModel(
      curve: Curves.easeInToLinear,
      code: "Curves.easeInToLinear",
      name: "easeInToLinear"),
  CurveModel(
      curve: Curves.easeInSine, code: "Curves.easeInSine", name: "easeInSine"),
  CurveModel(
      curve: Curves.easeInQuad, code: "Curves.easeInQuad", name: "easeInQuad"),
  CurveModel(
      curve: Curves.easeInCubic,
      code: "Curves.easeInCubic",
      name: "easeInCubic"),
  CurveModel(
      curve: Curves.easeInQuart,
      code: "Curves.easeInQuart",
      name: "easeInQuart"),
  CurveModel(
      curve: Curves.easeInQuint,
      code: "Curves.easeInQuint",
      name: "easeInQuint"),
  CurveModel(
      curve: Curves.easeInExpo, code: "Curves.easeInExpo", name: "easeInExpo"),
  CurveModel(
      curve: Curves.easeInCirc, code: "Curves.easeInCirc", name: "easeInCirc"),
  CurveModel(
      curve: Curves.easeInBack, code: "Curves.easeInBack", name: "easeInBack"),
  CurveModel(curve: Curves.easeOut, code: "Curves.easeOut", name: "easeOut"),
  CurveModel(
      curve: Curves.linearToEaseOut,
      code: "Curves.linearToEaseOut",
      name: "linearToEaseOut"),
  CurveModel(
      curve: Curves.easeOutSine,
      code: "Curves.easeOutSine",
      name: "easeOutSine"),
  CurveModel(
      curve: Curves.easeOutQuad,
      code: "Curves.easeOutQuad",
      name: "easeOutQuad"),
  CurveModel(
      curve: Curves.easeOutCubic,
      code: "Curves.easeOutCubic",
      name: "easeOutCubic"),
  CurveModel(
      curve: Curves.easeOutQuart,
      code: "Curves.easeOutQuart",
      name: "easeOutQuart"),
  CurveModel(
      curve: Curves.easeOutQuint,
      code: "Curves.easeOutQuint",
      name: "easeOutQuint"),
  CurveModel(
      curve: Curves.easeOutExpo,
      code: "Curves.easeOutExpo",
      name: "easeOutExpo"),
  CurveModel(
      curve: Curves.easeOutCirc,
      code: "Curves.easeOutCirc",
      name: "easeOutCirc"),
  CurveModel(
      curve: Curves.easeOutBack,
      code: "Curves.easeOutBack",
      name: "easeOutBack"),
  CurveModel(
      curve: Curves.easeInOut, code: "Curves.easeInOut", name: "easeInOut"),
  CurveModel(
      curve: Curves.easeInOutSine,
      code: "Curves.easeInOutSine",
      name: "easeInOutSine"),
  CurveModel(
      curve: Curves.easeInOutQuad,
      code: "Curves.easeInOutQuad",
      name: "easeInOutQuad"),
  CurveModel(
      curve: Curves.easeInOutCubic,
      code: "Curves.easeInOutCubic",
      name: "easeInOutCubic"),
  CurveModel(
      curve: Curves.easeInOutCubicEmphasized,
      code: "Curves.easeInOutCubicEmphasized",
      name: "easeInOutCubicEmphasized"),
  CurveModel(
      curve: Curves.easeInOutQuart,
      code: "Curves.easeInOutQuart",
      name: "easeInOutQuart"),
  CurveModel(
      curve: Curves.easeInOutQuint,
      code: "Curves.easeInOutQuint",
      name: "easeInOutQuint"),
  CurveModel(
      curve: Curves.easeInOutExpo,
      code: "Curves.easeInOutExpo",
      name: "easeInOutExpo"),
  CurveModel(
      curve: Curves.easeInOutCirc,
      code: "Curves.easeInOutCirc",
      name: "easeInOutCirc"),
  CurveModel(
      curve: Curves.easeInOutBack,
      code: "Curves.easeInOutBack",
      name: "easeInOutBack"),
];

final bounceCurves = [
  CurveModel(
    curve: Curves.bounceIn,
    code: "Curves.bounceIn",
    name: "bounceIn",
  ),
  CurveModel(
    curve: Curves.bounceOut,
    code: "Curves.bounceOut",
    name: "bounceOut",
  ),
  CurveModel(
    curve: Curves.bounceInOut,
    code: "Curves.bounceInOut",
    name: "bounceInOut",
  ),
];

final elasticCurves = [
  CurveModel(
    curve: Curves.elasticIn,
    code: "Curves.elasticIn",
    name: "elasticIn",
  ),
  CurveModel(
    curve: Curves.elasticOut,
    code: "Curves.elasticOut",
    name: "elasticOut",
  ),
  CurveModel(
    curve: Curves.elasticInOut,
    code: "Curves.elasticInOut",
    name: "elasticInOut",
  ),
];

final otherCurves = [
  CurveModel(
    curve: Curves.linear,
    code: "Curves.linear",
    name: "linear",
  ),
  CurveModel(
    curve: Curves.decelerate,
    code: "Curves.decelerate",
    name: "decelerate",
  ),
  CurveModel(
    curve: Curves.slowMiddle,
    code: "Curves.slowMiddle",
    name: "slowMiddle",
  ),
  CurveModel(
    curve: Curves.fastOutSlowIn,
    code: "Curves.fastOutSlowIn",
    name: "fastOutSlowIn",
  ),
  CurveModel(
    curve: Curves.fastEaseInToSlowEaseOut,
    code: "Curves.fastEaseInToSlowEaseOut",
    name: "fastEaseInToSlowEaseOut",
  ),
  CurveModel(
    curve: Curves.fastLinearToSlowEaseIn,
    code: "Curves.fastLinearToSlowEaseIn",
    name: "fastLinearToSlowEaseIn",
  ),
  // CurveModel(
  //   curve: Cubic(.5, 0, .5, 1),
  //   code: "Cubic(.5, 0, .5, 1)",
  //   name: "custom",
  //   isCustom: true,
  // ),
];
