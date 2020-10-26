import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

enum AniPros {opacity, translateY}

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;
  FadeAnimation(this.delay, this.child);
  @override
  Widget build(BuildContext context) {
    

    final tween = MultiTween<AniPros>()
    ..add(AniPros.opacity, 0.0.tweenTo(1.0), 500.milliseconds)
    ..add(AniPros.translateY, (-30.0).tweenTo(0.0), 500.milliseconds, Curves.easeOut);
    return PlayAnimation<MultiTweenValues<AniPros>>(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, child, value) => Opacity(
        opacity: value.get(AniPros.opacity),
        child: Transform.translate(
            offset: Offset(0, value.get(AniPros.translateY)),
            child: child
        ),
      ),
    );
  }
}