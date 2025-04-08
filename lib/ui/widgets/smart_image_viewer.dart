import 'package:taza/taza.dart';

class SmartImage extends StatelessWidget {
  final String path;
  final double? height;
  final double? width;
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

  const SmartImage({
    super.key,
    required this.path,
    this.height,
    this.fit = BoxFit.cover,
    this.width,
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
  });

  @override
  Widget build(BuildContext context) {
    Widget? child;
    if (path.isNullOrEmpty || !path.contains('/')) {
      child = Image.asset(
        AppImages.icPlaceholder,
        height: height,
        width: width,
        fit: fit ?? BoxFit.cover,
        color: color,
      );
    }
    if (child == null) {
      switch (path.imageType) {
        case ImageType.svg:
          child = SvgPicture.asset(
            path,
            width: width,
            height: height,
            fit: fit ?? BoxFit.contain,
            colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
          );
        case ImageType.asset:
          child = Image.asset(
            path,
            height: height,
            width: width,
            fit: fit ?? BoxFit.cover,
          );
        case ImageType.file:
          child = Image.file(
            File(path),
            height: height,
            width: width,
            fit: fit ?? BoxFit.cover,
          );
        case ImageType.network:
          child = path.isSvgUrl
              ? SvgPicture.network(path, width: width, height: height)
              : CachedNetworkImage(
                  height: height,
                  width: width,
                  fit: fit,
                  errorWidget: (context, url, error) => Image.asset(
                        AppImages.icPlaceholder,
                        height: height,
                        width: width,
                        fit: fit ?? BoxFit.cover,
                      ),
                  placeholder: (context, url) => SizedBox(
                        height: height ?? 50.w,
                        width: height ?? 50.w,
                        child: Container(
                            height: 20.w,
                            width: 20.w,
                            alignment: Alignment.center,
                            child: SizedBox(
                              height: 20.w,
                              width: 20.w,
                              child: SmartCircularProgressIndicator(
                                padding: EdgeInsets.zero,
                              ),
                            )),
                      ),
                  imageUrl: path);
        default:
          child = Image.asset(
            AppImages.icPlaceholder,
            height: height,
            width: width,
            fit: fit ?? BoxFit.cover,
          );
      }
    }
    if (height != null ||
        width != null ||
        padding != null ||
        margin != null ||
        decoration != null ||
        alignment != null ||
        border != null ||
        imageBorderRadius != null) {
      child = Container(
        height: height,
        width: width,
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

    return onTap != null
        ? InkWell(
            onTap: onTap,
            borderRadius: inkwellBorderRadius,
            child: child,
          )
        : child;
  }
}
