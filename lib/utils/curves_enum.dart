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
  elasticInOut(Curves.elasticInOut);

  final Curve curve;

  const CurvesEnum(this.curve);

  static Curve get getFirst => CurvesEnum.values.first.curve;
}
