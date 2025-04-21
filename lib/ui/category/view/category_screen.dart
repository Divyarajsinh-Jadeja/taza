import 'package:taza/taza.dart';

class CategoryScreen extends GetView<CategoryController> {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).appBarStyle;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Obx(() {
          return SmartAppBar(
            leadingImage: controller.currentCategory.image,
            titleWidget: SmartColumn(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SmartText(controller.currentCategory.name, style: style.titleStyle),
                SmartText(controller.currentCategory.name, style: style.subTitleStyle),
              ],
            ),
            actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
          );
        }),
      ),
      body: Row(children: [CategorySidebar(), Expanded(child: CategoryProductGrid())]),
    );
  }
}

class ProductListView extends GetView<CategoryController> {
  const ProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).productListViewStyle;
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        _buildProductCountSection(style),
        // Featured Ad Banner - Part of scrollable content
        AnimatedSliverBox(
          child:
              controller.isShowBanner
                  ? Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0), child: PromotionalBanner())
                  : SizedBox(),
        ),

        // Items count text
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              "${controller.currentCategory.products?.length ?? 0} items in ${controller.currentCategory.name}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
        ),

        // Products Grid converted to SliverList
        SliverPadding(
          padding: const EdgeInsets.all(16.0),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final int itemIndex = index * 2;

              if (itemIndex >= (controller.currentCategory.products?.length ?? 0)) {
                return null; // End of list
              }

              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ProductCard(
                      product: controller.currentCategory.products![itemIndex],
                      index: itemIndex,
                      hasDiscount: itemIndex % 3 == 0,
                      discountPercent: "${(10 + (itemIndex % 3) * 5)}%",
                      onAddTap: () {},
                    ),
                  ),
                  SizedBox(width: 16),
                  if (itemIndex + 1 < (controller.currentCategory.products?.length ?? 0))
                    Expanded(
                      child: ProductCard(
                        product: controller.currentCategory.products![itemIndex + 1],
                        index: itemIndex + 1,
                        hasDiscount: (itemIndex + 1) % 4 == 0,
                        discountPercent: "${(5 + ((itemIndex + 1) % 4) * 3)}%",
                        onAddTap: () {},
                      ),
                    )
                  else
                    Expanded(child: SizedBox()),
                ],
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildProductCountSection(ProductListViewStyle style) {
    return AnimatedSliverBox(
      child: SmartRow(
        padding: EdgeInsets.all(16.w),
        children: [
          SmartColumn(
            expanded: true,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SmartText(controller.currentCategory.name ?? "", style: style.categoryHeaderStyle),
              SizedBox(height: 2.h),
              SmartText("${controller.currentCategory.products?.length ?? 0} items", style: style.categorysubHeaderStyle),
            ],
          ),
          FilterButton(onTap: () {}),
        ],
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final VoidCallback onTap;

  const FilterButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: SmartRow(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r), border: Border.all(color: Colors.grey[300]!)),
        children: [Icon(Icons.tune, size: 18), SizedBox(width: 4), Text("Filters", style: TextStyle(fontWeight: FontWeight.w500))],
      ),
    );
  }
}

class ProductCard extends StatefulWidget {
  final ProductModel product;
  final int index;
  final bool hasDiscount;
  final String discountPercent;
  final VoidCallback onAddTap;

  const ProductCard({
    super.key,
    required this.product,
    required this.index,
    this.hasDiscount = false,
    this.discountPercent = "0%",
    required this.onAddTap,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isHovering = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 150));

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onAddButtonPressed() async {
    setState(() {
      _isHovering = true;
    });
    _controller.forward();
    await Future.delayed(Duration(milliseconds: 150));
    _controller.reverse();
    widget.onAddTap();
    await Future.delayed(Duration(milliseconds: 150));
    setState(() {
      _isHovering = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(scale: _scaleAnimation.value, child: child);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 24),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Image with Hero animation
                Hero(
                  tag: 'product_${widget.product.id}',
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child:
                          widget.product.imageUrl.isNotEmpty
                              ? SmartImage(path: widget.product.imageUrl, fit: BoxFit.cover)
                              : Icon(Icons.image, size: 40, color: Colors.grey),
                    ),
                  ),
                ),

                // Delivery Time
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    children: [
                      Icon(Icons.bolt, size: 14, color: Colors.grey),
                      SizedBox(width: 4),
                      Text("6 MINS", style: TextStyle(fontSize: 12, color: Colors.grey)),
                    ],
                  ),
                ),

                // Product Name
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    "${widget.product.name}\n",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                // Size
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text("250 ml", style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                ),

                // Price with discount
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Row(
                    children: [
                      Text(
                        "₹${widget.hasDiscount ? (widget.product.price * 0.8).toStringAsFixed(0) : widget.product.price.toStringAsFixed(0)}",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      SizedBox(width: 6),
                      if (widget.hasDiscount)
                        Text(
                          "₹${widget.product.price.toStringAsFixed(0)}",
                          style: TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey, fontSize: 14),
                        ),
                    ],
                  ),
                ),

                // Add Button with animation
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: GestureDetector(
                    onTap: _onAddButtonPressed,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: _isHovering ? Colors.green.withOpacity(0.1) : Colors.transparent,
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text("ADD", textAlign: TextAlign.center, style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ],
            ),
            if (widget.hasDiscount)
              Container(
                margin: EdgeInsets.only(bottom: 8),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: Colors.deepOrange, borderRadius: BorderRadius.circular(4)),
                child: Text(
                  "${widget.discountPercent} OFF",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class AnimatedSliverBox extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final double verticalOffset;

  const AnimatedSliverBox({super.key, required this.child, this.duration = const Duration(milliseconds: 375), this.verticalOffset = 20.0});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AnimationLimiter(
        child: AnimationConfiguration.synchronized(
          duration: duration,
          child: SlideAnimation(verticalOffset: verticalOffset, child: FadeInAnimation(child: child)),
        ),
      ),
    );
  }
}
