import 'package:flutter/material.dart';

enum CurvesEnum {
  linear(Curves.linear),
  decelerate(Curves.decelerate),
  fastLinearToSlowEaseIn(Curves.fastLinearToSlowEaseIn),
  fastEaseInToSlowEaseOut(Curves.fastEaseInToSlowEaseOut),
  ease(Curves.ease),
  easeIn(Curves.easeIn),
  easeInToLinear(Curves.easeInToLinear),
  easeInSine(Curves.easeInSine),
  easeInQuad(Curves.easeInQuad),
  easeInCubic(Curves.easeInCubic),
  easeInQuart(Curves.easeInQuart),
  easeInQuint(Curves.easeInQuint),
  easeInExpo(Curves.easeInExpo),
  easeInCirc(Curves.easeInCirc),
  easeInBack(Curves.easeInBack),
  easeOut(Curves.easeOut),
  linearToEaseOut(Curves.linearToEaseOut),
  easeOutSine(Curves.easeOutSine),
  easeOutQuad(Curves.easeOutQuad),
  easeOutCubic(Curves.easeOutCubic),
  easeOutQuart(Curves.easeOutQuart),
  easeOutQuint(Curves.easeOutQuint),
  easeOutExpo(Curves.easeOutExpo),
  easeOutCirc(Curves.easeOutCirc),
  easeOutBack(Curves.easeOutBack),
  easeInOut(Curves.easeInOut),
  easeInOutSine(Curves.easeInOutSine),
  easeInOutQuad(Curves.easeInOutQuad),
  easeInOutCubic(Curves.easeInOutCubic),
  easeInOutCubicEmphasized(Curves.easeInOutCubicEmphasized),
  easeInOutQuart(Curves.easeInOutQuart),
  easeInOutQuint(Curves.easeInOutQuint),
  easeInOutExpo(Curves.easeInOutExpo),
  easeInOutCirc(Curves.easeInOutCirc),
  easeInOutBack(Curves.easeInOutBack),
  fastOutSlowIn(Curves.fastOutSlowIn),
  slowMiddle(Curves.slowMiddle),
  bounceIn(Curves.bounceIn),
  bounceOut(Curves.bounceOut),
  bounceInOut(Curves.bounceInOut),
  elasticIn(Curves.elasticIn),
  elasticOut(Curves.elasticOut),
  elasticInOut(Curves.elasticInOut),
  custom(Cubic(.5, 0, .5, 1));

  final Curve curve;

  const CurvesEnum(this.curve);

  static Curve get getFirst => CurvesEnum.values.first.curve;

  static Map<String, List<CurvesEnum>> get list => {
        'ease': easeCurves,
        'bounces': bounceCurves,
        'elastics': elasticCurves,
        'others': otherCurves,
      };
}

// Group curves into categories
final easeCurves = [
  CurvesEnum.ease,
  CurvesEnum.easeIn,
  CurvesEnum.easeInToLinear,
  CurvesEnum.easeInSine,
  CurvesEnum.easeInQuad,
  CurvesEnum.easeInCubic,
  CurvesEnum.easeInQuart,
  CurvesEnum.easeInQuint,
  CurvesEnum.easeInExpo,
  CurvesEnum.easeInCirc,
  CurvesEnum.easeInBack,
  CurvesEnum.easeOut,
  CurvesEnum.linearToEaseOut,
  CurvesEnum.easeOutSine,
  CurvesEnum.easeOutQuad,
  CurvesEnum.easeOutCubic,
  CurvesEnum.easeOutQuart,
  CurvesEnum.easeOutQuint,
  CurvesEnum.easeOutExpo,
  CurvesEnum.easeOutCirc,
  CurvesEnum.easeOutBack,
  CurvesEnum.easeInOut,
  CurvesEnum.easeInOutSine,
  CurvesEnum.easeInOutQuad,
  CurvesEnum.easeInOutCubic,
  CurvesEnum.easeInOutCubicEmphasized,
  CurvesEnum.easeInOutQuart,
  CurvesEnum.easeInOutQuint,
  CurvesEnum.easeInOutExpo,
  CurvesEnum.easeInOutCirc,
  CurvesEnum.easeInOutBack,
];

final bounceCurves = [
  CurvesEnum.bounceIn,
  CurvesEnum.bounceOut,
  CurvesEnum.bounceInOut,
];

final elasticCurves = [
  CurvesEnum.elasticIn,
  CurvesEnum.elasticOut,
  CurvesEnum.elasticInOut,
];

final otherCurves = [
  CurvesEnum.linear,
  CurvesEnum.decelerate,
  CurvesEnum.slowMiddle,
  CurvesEnum.fastOutSlowIn,
  CurvesEnum.fastEaseInToSlowEaseOut,
  CurvesEnum.fastLinearToSlowEaseIn,
  CurvesEnum.custom,
];
