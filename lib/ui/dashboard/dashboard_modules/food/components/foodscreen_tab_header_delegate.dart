import 'package:taza/taza.dart';

class DynamicSliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget Function(double shrinkOffset, bool overlapsContent) builder;

  DynamicSliverHeaderDelegate({required this.minHeight, required this.maxHeight, required this.builder});

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: builder(shrinkOffset, overlapsContent));
  }

  @override
  bool shouldRebuild(covariant DynamicSliverHeaderDelegate oldDelegate) {
    return minHeight != oldDelegate.minHeight || maxHeight != oldDelegate.maxHeight;
  }
}
