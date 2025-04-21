import 'package:taza/taza.dart';

class ProductCheckoutCard extends StatelessWidget {
  const ProductCheckoutCard({super.key, required this.model, this.isOutOfStock});
  final FoodModel model;
  final bool? isOutOfStock;
  @override
  Widget build(BuildContext context) {
    var style = AppTheme.of(context).checkoutStyle;
    return Padding(
      padding: EdgeInsetsDirectional.only(bottom: 10.h),
      child: Stack(
        children: [
          SmartRow(
            spacing: 10.w,
            children: [
              SmartImage(
                path: model.imageUrl,
                size: 50.w,
                imageBorderRadius: BorderRadius.circular(6.r),
                clipBehavior: Clip.antiAlias,
              ),
              SmartColumn(
                mainAxisSize: MainAxisSize.min,
                expanded: true,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SmartText(
                    model.name,
                    style: style.productTitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SmartText(
                    "3.5L",
                    style: style.productSubtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),

              if(isOutOfStock!=true)...[SmartAnimatedQuantity(
                index: 19,
                onIncrease:
                    () => Get.find<QuantityController>().increment(19),
                onDecrease:
                    () => Get.find<QuantityController>().decrement(19),
                model: model,
              ),SmartText(model.price.toCurrencyCodeFormat(), style: style.productTitle),],
              if(isOutOfStock==true) SmartRow(
                spacing: 4.w,
                children: [
                  SmartText(LocaleKeys.outOfStock.tr,style: style.productTitle,),
                  Icon(Icons.delete_forever,size: 20.w,)
                ],
              ),
            ],
          ),
          if(isOutOfStock==true)Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: style.whiteColor.withValues(alpha: 0.6),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
