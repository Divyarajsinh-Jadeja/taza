import 'package:flutter/rendering.dart';
import 'package:taza/taza.dart';

class StickySliver extends SingleChildRenderObjectWidget {
  const StickySliver({super.child, super.key});

  @override
  RenderObject createRenderObject(BuildContext context) => _RenderStickySliver();
}

class _RenderStickySliver extends RenderSliverSingleBoxAdapter {
  _RenderStickySliver();

  @override
  void performLayout() {
    geometry = SliverGeometry.zero;

    child?.layout(constraints.asBoxConstraints(), parentUsesSize: true);

    double childExtent = child?.size.height ?? 0;

    geometry = SliverGeometry(paintExtent: childExtent, maxPaintExtent: childExtent, paintOrigin: constraints.scrollOffset);

    setChildParentData(child!, constraints, geometry!);
  }
}
