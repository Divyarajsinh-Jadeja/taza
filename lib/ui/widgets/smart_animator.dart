import 'package:taza/taza.dart';

class SmartAnimator extends StatelessWidget {
  final Widget? child;

  // Core animation flags
  final bool animateFade;
  final bool animateFadeIn;
  final bool animateFadeOut;
  final bool animateSlideX;
  final bool animateSlideY;
  final bool animateScale;
  final bool animateRotate;
  final bool animateShimmer;
  final bool animateFlip;
  final bool animateBounce;
  final bool animateBlur;
  final bool animateShake;
  final bool animateColor;
  final bool animateSwap;

  // Customization
  final Offset? slideXBegin;
  final Offset? slideYBegin;
  final Offset? slideEnd;
  final Offset? scaleBegin;
  final Offset? scaleEnd;
  final double? rotateBegin;
  final double? rotateEnd;
  final double? flipBegin;
  final double? flipEnd;
  final Axis? flipDirection;
  final Offset? blurBegin;
  final Offset? blurEnd;
  final Offset? bounceBegin;
  final Offset? bounceEnd;
  final Offset? shakeOffset;
  final Color? colorBegin;
  final Color? colorEnd;
  final bool isColorOnBackground;

  // Timing
  final Duration animationDelay;
  final Duration animationDuration;
  final Curve animationCurve;

  const SmartAnimator({
    super.key,
    this.child,
    this.animateFade = false,
    this.animateFadeIn = false,
    this.animateFadeOut = false,
    this.animateSlideX = false,
    this.animateSlideY = false,
    this.animateScale = false,
    this.animateRotate = false,
    this.animateShimmer = false,
    this.animateFlip = false,
    this.animateBounce = false,
    this.animateBlur = false,
    this.animateShake = false,
    this.animateColor = false,
    this.animateSwap = false,
    this.slideXBegin,
    this.slideYBegin,
    this.slideEnd,
    this.scaleBegin,
    this.scaleEnd,
    this.rotateBegin,
    this.rotateEnd,
    this.flipBegin,
    this.flipEnd,
    this.flipDirection,
    this.blurBegin,
    this.blurEnd,
    this.bounceBegin,
    this.bounceEnd,
    this.shakeOffset,
    this.colorBegin,
    this.colorEnd,
    this.isColorOnBackground = true,
    this.animationDelay = const Duration(milliseconds: 300),
    this.animationDuration = const Duration(milliseconds: 500),
    this.animationCurve = Curves.decelerate,
  });

  @override
  Widget build(BuildContext context) {
    final effects = <Effect>[
      if (animateFade)
        FadeEffect(duration: animationDuration, curve: animationCurve),
      if (animateFadeIn)
        FadeEffect(
          begin: 0,
          end: 1,
          duration: animationDuration,
          curve: animationCurve,
        ),
      if (animateFadeOut)
        FadeEffect(
          begin: 1,
          end: 0,
          duration: animationDuration,
          curve: animationCurve,
        ),
      if (animateSlideX)
        SlideEffect(
          begin: slideXBegin ?? const Offset(0.2, 0),
          end: slideEnd ?? Offset.zero,
          duration: animationDuration,
          curve: animationCurve,
        ),
      if (animateSlideY)
        SlideEffect(
          begin: slideYBegin ?? const Offset(0, -0.2),
          end: slideEnd ?? Offset.zero,
          duration: animationDuration,
          curve: animationCurve,
        ),
      if (animateScale)
        ScaleEffect(
          begin: scaleBegin ?? const Offset(0.0, 0.0),
          end: scaleEnd ?? const Offset(1.0, 1.0),
          duration: animationDuration,
          curve: animationCurve,
        ),
      if (animateRotate)
        RotateEffect(
          begin: rotateBegin ?? -0.1,
          end: rotateEnd ?? 0.0,
          duration: animationDuration,
          curve: animationCurve,
        ),
      if (animateShimmer)
        ShimmerEffect(duration: animationDuration, delay: animationDelay),
      if (animateFlip)
        FlipEffect(
          begin: flipBegin ?? 0.0,
          end: flipEnd ?? 1.0,
          direction: flipDirection ?? Axis.horizontal,
          duration: animationDuration,
          curve: animationCurve,
        ),
      if (animateBounce)
        MoveEffect(
          begin: bounceBegin ?? const Offset(0, -0.1),
          end: bounceEnd ?? Offset.zero,
          duration: animationDuration,
          curve: Curves.bounceOut,
        ),
      if (animateBlur)
        BlurEffect(
          begin: blurBegin ?? const Offset(5, 5),
          end: blurEnd ?? Offset.zero,
          duration: animationDuration,
          curve: animationCurve,
        ),
      if (animateShake)
        MoveEffect(
          begin: shakeOffset ?? const Offset(-0.02, 0),
          end: Offset.zero,
          duration: animationDuration,
          curve: Curves.elasticIn,
        ),
      if (animateColor && colorBegin != null && colorEnd != null)
        ColorEffect(
          begin: colorBegin!,
          end: colorEnd!,
          duration: animationDuration,
          curve: animationCurve,
          blendMode: isColorOnBackground ? BlendMode.srcATop : BlendMode.srcIn,
        ),
      if (animateSwap)
        SwapEffect(
          duration: animationDuration,
          curve: animationCurve,
          builder: (context, child) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(3.14),
              child: child,
            );
          },
        ),
    ];

    if (effects.isEmpty) return child ?? SizedBox();

    return Animate(
      delay: animationDelay,
      effects: effects,
      child: child ?? SizedBox(),
    );
  }

  /// ✅ Copy the animator but replace the child
  SmartAnimator copyWith({required Widget child}) {
    return SmartAnimator(
      animateFade: animateFade,
      animateFadeIn: animateFadeIn,
      animateFadeOut: animateFadeOut,
      animateSlideX: animateSlideX,
      animateSlideY: animateSlideY,
      animateScale: animateScale,
      animateRotate: animateRotate,
      animateShimmer: animateShimmer,
      animateFlip: animateFlip,
      animateBounce: animateBounce,
      animateBlur: animateBlur,
      animateShake: animateShake,
      animateColor: animateColor,
      animateSwap: animateSwap,
      slideXBegin: slideXBegin,
      slideYBegin: slideYBegin,
      slideEnd: slideEnd,
      scaleBegin: scaleBegin,
      scaleEnd: scaleEnd,
      rotateBegin: rotateBegin,
      rotateEnd: rotateEnd,
      flipBegin: flipBegin,
      flipEnd: flipEnd,
      flipDirection: flipDirection,
      blurBegin: blurBegin,
      blurEnd: blurEnd,
      bounceBegin: bounceBegin,
      bounceEnd: bounceEnd,
      shakeOffset: shakeOffset,
      colorBegin: colorBegin,
      colorEnd: colorEnd,
      isColorOnBackground: isColorOnBackground,
      animationDelay: animationDelay,
      animationDuration: animationDuration,
      animationCurve: animationCurve,
      child: child,
    );
  }
}
