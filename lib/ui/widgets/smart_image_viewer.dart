import 'package:taza/taza.dart';

class SmartImage extends StatelessWidget {
  final String path;
  final double? height;
  final double? width;
  final double? size;
  final BoxFit? fit;
  final BorderRadiusGeometry? imageBorderRadius;
  final Color? color;
  final GestureTapCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? inkwellBorderRadius;
  final BoxBorder? border;
  final AlignmentGeometry? alignment;
  final Clip clipBehavior;
  final Decoration? decoration;
  final SmartAnimator? animator;

  const SmartImage({
    super.key,
    required this.path,
    this.height,
    this.width,
    this.size,
    this.fit = BoxFit.cover,
    this.imageBorderRadius,
    this.color,
    this.onTap,
    this.padding,
    this.margin,
    this.inkwellBorderRadius,
    this.border,
    this.alignment,
    this.clipBehavior = Clip.none,
    this.decoration,
    this.animator,
  });

  bool get isLottie => path.toLowerCase().endsWith('.json');

  @override
  Widget build(BuildContext context) {
    final double? finalHeight = size ?? height;
    final double? finalWidth = size ?? width;

    Widget? child;

    if (path.isNullOrEmpty || !path.contains('/')) {
      child = Image.asset(
        AppImages.icHome,
        height: finalHeight,
        width: finalWidth,
        fit: fit,
        color: color,
      );
    }

    if (child == null) {
      if (isLottie) {
        child = path.startsWith('http')
            ? Lottie.network(
          path,
          height: finalHeight,
          width: finalWidth,
          fit: fit ?? BoxFit.contain,
        )
            : Lottie.asset(
          path,
          height: finalHeight,
          width: finalWidth,
          fit: fit ?? BoxFit.contain,
        );
      } else {
        switch (path.imageType) {
          case ImageType.svg:
            child = SvgPicture.asset(
              path,
              width: finalWidth,
              height: finalHeight,
              fit: fit ?? BoxFit.contain,
              colorFilter: color != null
                  ? ColorFilter.mode(color!, BlendMode.srcIn)
                  : null,
            );
            break;
          case ImageType.asset:
            child = Image.asset(
              path,
              height: finalHeight,
              width: finalWidth,
              fit: fit,
            );
            break;
          case ImageType.file:
            child = Image.file(
              File(path),
              height: finalHeight,
              width: finalWidth,
              fit: fit,
            );
            break;
          case ImageType.network:
            child = path.isSvgUrl
                ? SvgPicture.network(
              path,
              width: finalWidth,
              height: finalHeight,
            )
                : CachedNetworkImage(
              height: finalHeight,
              width: finalWidth,
              fit: fit,
              errorWidget: (context, url, error) => Image.asset(
                AppImages.icHome,
                height: finalHeight,
                width: finalWidth,
                fit: fit,
              ),
              placeholder: (context, url) => SizedBox(
                height: finalHeight ?? 50.w,
                width: finalWidth ?? 50.w,
                child: Center(
                  child: SizedBox(
                    height: 20.w,
                    width: 20.w,
                    child: SmartCircularProgressIndicator(padding: EdgeInsets.zero),
                  ),
                ),
              ),
              imageUrl: path,
            );
            break;
        }
      }
    }

    if (finalHeight != null ||
        finalWidth != null ||
        padding != null ||
        margin != null ||
        decoration != null ||
        alignment != null ||
        border != null ||
        imageBorderRadius != null) {
      child = Container(
        height: finalHeight,
        width: finalWidth,
        padding: padding,
        margin: margin,
        clipBehavior: clipBehavior,
        alignment: alignment,
        decoration: decoration ??
            BoxDecoration(
              borderRadius: imageBorderRadius,
              border: border,
            ),
        child: child,
      );
    }

    if (onTap != null) {
      child = InkWell(
        onTap: onTap,
        highlightColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        borderRadius: inkwellBorderRadius,
        child: child,
      );
    }

    if (animator != null) {
      return animator!.copyWith(child: child);
    } else {
      return child;
    }
  }
}
